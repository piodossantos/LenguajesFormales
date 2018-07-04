import qualified Data.Map as Map
import System.Random
import Data.List
import Grammar
import Tokens

parseGrammar::String -> BabbleGrammar
parseGrammar grammar = normalizeGrammar (Grammar.parseCalc (alexScanTokens  grammar))

parseGrammarFile::String->IO BabbleGrammar
parseGrammarFile path = do
    contents <- readFile(path)
    return (normalizeGrammar (Grammar.parseCalc (alexScanTokens  contents)))

unparseGrammar:: BabbleGrammar -> String
unparseGrammar (a, productions) = (unparseProduction (a,head)) ++ (concat [(unparseProduction i) | i <- (Map.toList remaining) ])
    where 
        map = Map.fromList productions
        head = map Map.! a
        remaining = Map.delete a map

unparseProduction:: Prod -> String
unparseProduction ( "", [x]) = (concat (map unparseSymbol
    (fst x))) ++ "%prob" ++ (show (snd x)) ++ ";"
unparseProduction ("" ,(x:xs)) = (concat (map unparseSymbol
    (fst x))) ++ "%prob" ++ (show (snd x)) ++ "|" ++ unparseProduction ( "" , xs)
unparseProduction (a, l) = a ++ ":" ++ unparseProduction( "", l)

unparseSymbol:: Symbol -> String
unparseSymbol (NoTerm nt) = nt
unparseSymbol (Term t) = "'" ++ t ++ "'"

showSymbol:: Symbol -> String
showSymbol (NoTerm nt) = nt
showSymbol (Term t) = t

generateValidStrings::BabbleGrammar-> Int -> (Int,Int,[Prod]) -> Double ->IO [String]
generateValidStrings grammar n (min, max, prods) ignorableFactor= do
    let updatedGrammar = normalizeGrammar (updateGrammar grammar prods)
    gen <- newStdGen
    let strings = genRandomString [] [] [] (fst updatedGrammar) (snd updatedGrammar) (randomRs (0.0, 1.0) gen) n min max min max ignorableFactor
    return (map (\x -> concat(map showSymbol (concat x))) strings)



genRandomString :: [Symbol]  -> [[Symbol]] -> [[Symbol]]  -> String -> [(String , [([Symbol],Double)])] -> [Double] -> Int -> Int -> Int -> Int -> Int -> Double -> [[[Symbol]]]
genRandomString _ _ _ _ _ _ 0 _ _ _ _ _ = []
genRandomString [] [] [] initial productions (r:rs) n min max amin amax ignorableFactor = genRandomString [] [] [(fst (usedProds !! index))] initial productions rs n min max amin amax ignorableFactor
    where 
        prods = (Map.fromList productions) Map.! initial
        desirableProds = normalizeProd (getProductionsByHeight amin amax prods)
        usedProds = if (length desirableProds) == 0 then prods else desirableProds
        probs = accumulatedProbability (map (\x-> (snd x)) usedProds)
        el = elemIndex ((filter(\x -> x > r) probs) !! 0) probs
        index = case el of (Just x) -> x
genRandomString [] [] remaining initial  productions rs n min max amin amax ignorableFactor
    | length((filter (\y -> length(filter(\x -> isTerminal(x)), y) == (length y)) remaining)) == length remaining = [remaining] ++ genRandomString [] [] [] initial productions rs (n-1) min max min max ignorableFactor
    | otherwise = genRandomString [] remaining [] initial productions rs n min max (amin - 1) (amax - 1) ignorableFactor
genRandomString [] (lvl:lvls) remaining initial productions rs n min max amin amax ignorableFactor = genRandomString lvl lvls remaining initial productions rs n min max amin amax ignorableFactor
genRandomString ((Term s):ss) lvls remaining initial productions (r: r1 : r2 : r3 :rs) n min max amin amax ignorableFactor = genRandomString ss lvls (remaining ++ (if (length prods > 0 && r2 < ignorableFactor) then ([fst (prods !! index)]) else []) ++[[(Term s)]] ++ (if (length prods > 0 && r3 < ignorableFactor) then ([fst (prods !! index1)]) else [])) initial  productions rs n min max amin amax ignorableFactor
    where 
        prods = if (Map.member "_" (Map.fromList productions)) then ((Map.fromList productions) Map.! "_") else []
        probs = accumulatedProbability (map (\x-> (snd x)) prods)
        el = elemIndex ((filter(\x -> x > r) probs) !! 0) probs
        el1 = elemIndex ((filter(\x -> x > r1) probs) !! 0) probs
        index = case el of (Just x) -> x
        index1 = case el1 of (Just x) -> x
genRandomString ((NoTerm nt):ss) lvls remaining initial productions (r:rs) n min max amin amax ignorableFactor = genRandomString ss lvls (remaining ++ [(fst (usedProds !! index))]) initial productions rs n min max amin amax ignorableFactor
    where 
        prods = (Map.fromList productions) Map.! nt
        desirableProds = normalizeProd (getProductionsByHeight amin amax prods)
        usedProds = if (length desirableProds) == 0 then prods else desirableProds
        probs = accumulatedProbability (map (\x-> (snd x)) usedProds)
        el = elemIndex ((filter(\x -> x > r) probs) !! 0) probs
        index = case el of (Just x) -> x

getProductionsByHeight :: Int ->  Int -> [([Symbol],Double)] -> [([Symbol],Double)]
getProductionsByHeight min max prods
    |min >= 1 = filter(\x -> not (isAllTerminal x)) prods
    |min < 1 && max >= 1 = prods
    |max < 1 = if (length terminals) == 0 then filter (\x -> not (isAllNoTerminal x)) prods else terminals
    where terminals = filter (\x -> (isAllTerminal x)) prods


isAllTerminal :: ([Symbol],Double) -> Bool
isAllTerminal (symbols, _)
    | length(filter (\x -> isTerminal(x)) symbols) == (length symbols) = True
    | otherwise = False
isAllNoTerminal :: ([Symbol], Double) -> Bool
isAllNoTerminal (symbols, _)
    | length(filter(\x -> not (isTerminal(x))), symbols) == (length symbols) = True
    | otherwise = False

isTerminal :: Symbol -> Bool
isTerminal (NoTerm _) = False
isTerminal _ = True

accumulatedProbability:: [Double] -> [Double]
accumulatedProbability [] = []
accumulatedProbability l@(x:xs) = [1 - sum(xs)] ++  accumulatedProbability(xs)

updateGrammar ::BabbleGrammar -> [Prod] -> BabbleGrammar
updateGrammar grammar [] = grammar
updateGrammar grammar ((nt, []):xs) = updateGrammar grammar xs
updateGrammar grammar@(initial, productions) ((nt, symbols):xs)
        |Map.member nt prods = updateGrammar ( initial,
            (Map.toList 
            (Map.insert nt 
            (map (\x -> if (Map.member (fst x) sym) then (fst x, sym Map.! (fst x)) else x)
            (prods Map.! nt))
            prods))) xs
        |otherwise = updateGrammar grammar xs 
        where 
            prods = Map.fromList productions
            sym = Map.fromList symbols



normalizeGrammar::BabbleGrammar->BabbleGrammar
normalizeGrammar  (a,[])=  (a,[])
normalizeGrammar (a,x)= ( a,(map (\(y,z)-> (y,normalizeProd z)) x))

normalizeProd:: [([Symbol],Double)] -> [([Symbol],Double)]
normalizeProd ts = [(a,(b/total)) | (a,b)<- ts]
    where total = foldl (\z y -> z +( snd y)) 0 ts

test1::BabbleGrammar
test1 = ("Exp" ,[( "Exp",[
                          ([(NoTerm "Exp"),(Term "+"),(NoTerm "Exp")],1),
                          ([(NoTerm "Exp"),(Term "-"),(NoTerm "Exp")],1),
                          ([(Term "3")], 1),
                          ([(Term "7")], 1),
                          ([(Term "5")], 1)]
                           
                 ),
                 ("_", [
                    ([(Term "#")], 1),
                    ([(Term "|")], 2)
                 ])
                ]
        )

grammar1="Exp : Exp '+' Exp | Exp '*' Exp | '(' Exp ')' | NUM ; NUM : '0' | '1' | '2' | '3' | '4' | '100' | '1000' ; _ : ' ' | '\n' | '\t' ;"
grammar2="Exp : Exp '+' Exp %prob 0.4 ; Exp : Exp '*' Exp %prob 0.4 ; Exp : '(' Exp ')' %prob 0.1 | NUM %prob 0.1 ;"
grammar3="A : BC %prob 0.1| ABC %prob 0.2; A : CB ; C: '3' | B %prob 0.3; B : '1' '|' '2' '|' '3' %prob 0.3 | '1' '|' B '2' B '|' '3' %prob 0.3 ; _: ' ' | '7'; "
grammar4="S: 'a';"
grammar5="Binas : '1' Binas; Binas : '0' Binas; Binas : '0' | '1';"
grammar6="COM : 'a'COM'b' %prob 0.75; COM : 'a''b' %prob 0.25; _ : ' ' | '\t' | '\n';"
grammar7="Exp : Exp '*' Exp %prob 0.5; Exp : Exp '+' Exp | Num; Num : '0' | '1';"
grammar8="J : P R M; P : 'a' 'b'; P : 'a' P 'b'; R : 'c' 'd'; R : 'c' R 'd'; M : 'e' 'f'; M : 'e' M 'f'; _ : ' ';"
grammar9="Ini : 'v''a''m''o''s''!'' ' Ini; Ini : 'U''r''u''g''u''a''y''!'' ';"
grammar10="Sal : A B; A : '0' %prob 0.33; B : C '+' D %prob 0.2 | '3' %prob 0.07; C : '1'; D : '4'; _ : ' ' | '\n';"

grammars = [grammar1,grammar2,grammar3,grammar4,grammar5,grammar6,grammar7,grammar8,grammar9,grammar10]

testGrammar::[BabbleGrammar]
testGrammar = map (Grammar.parseCalc.Tokens.alexScanTokens) grammars

testParseUnParse::[BabbleGrammar]
testParseUnParse = map (Grammar.parseCalc.Tokens.alexScanTokens.unparseGrammar) testGrammar