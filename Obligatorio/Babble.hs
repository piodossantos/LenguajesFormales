import qualified Data.Map as Map
import System.Random
import Data.List

data Symbol =NoTerm String | Term String
    deriving(Show,Eq, Ord)
type Prod = (String , [([Symbol],Double)])
type BabbleGrammar = (String, [Prod])
data DerivationTree = Leaf Symbol | Node Symbol [DerivationTree] | Empty

parseGrammar::String -> BabbleGrammar
parseGrammar grammar = ("", [])

parseGrammarFile::String->IO BabbleGrammar
parseGrammarFile path = do
    contents <- readFile(path)
    -- parse
    return ("",[])

unparseGrammar:: BabbleGrammar -> String
unparseGrammar (a, productions) = (unparseProduction (a,head)) ++ (concat [(unparseProduction i) | i <- (Map.toList remaining) ])
    where 
        map = Map.fromList productions
        head = map Map.! a
        remaining = Map.delete a map

unparseProduction:: Prod -> String
unparseProduction ( "", [x]) = (concat (map unparseSymbol
    (fst x))) ++ "%" ++ (show (snd x)) ++ ";\n"
unparseProduction ("" ,(x:xs)) = (concat (map unparseSymbol
    (fst x))) ++ "%" ++ (show (snd x)) ++ "|" ++ unparseProduction ( "" , xs)
unparseProduction (a, l) = a ++ ":" ++ unparseProduction( "", l)

unparseSymbol:: Symbol -> String
unparseSymbol (NoTerm nt) = nt
unparseSymbol (Term t) = "\"" ++ t ++ "\""

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

{-
main = do 
    contents <- getLine
    putStrLn (show (Grammar.parseCalc (Grammar.alexScanTokens  contents)))
    main
-}