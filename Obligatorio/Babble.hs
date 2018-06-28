import qualified Data.Map as Map
import System.Random
import Data.List
data Symbol =NoTerm String | Term String
    deriving(Show,Eq, Ord)
type Prod = (String , [([Symbol],Double)])
type BabbleGrammar = (String, [Prod])


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
unparseProduction ( "", [x]) = (concat (map (\s -> case s of
    (NoTerm nt) -> nt
    (Term t) -> "\"" ++ t ++ "\"")
    (fst x))) ++ "%" ++ (show (snd x)) ++ ";\n"
unparseProduction ("" ,(x:xs)) = (concat (map (\s -> case s of
    (NoTerm nt) -> nt
    (Term t) -> "\"" ++ t ++ "\"")
    (fst x))) ++ "%" ++ (show (snd x)) ++ "|" ++ unparseProduction ( "" , xs)
unparseProduction (a, l) = a ++ ":" ++ unparseProduction( "", l)

generateValidStrings::BabbleGrammar-> Int -> (Int,Int,[Prod])  ->IO [String]
generateValidStrings x y z = do
    gen <- newStdGen
    return (generateRandomStrings x y z (randomRs (0.0,1.0) gen))

generateRandomStrings:: BabbleGrammar-> Int -> (Int,Int,[Prod]) -> [Double] ->[String]
generateRandomStrings (initial, productions) , n, (min, max, []) (r:rs) =
    | n == 0 = initial
    | 

    where 
        prods = (Map.fromList productions) Map.! initial
        probs = accumulatedProbability (map \x (snd x) prods)
        index = elemIndex (take 1 (filter(\x -> x > r) probs))
        elem = fst(productions !! index)

generateRandomStrings g@(intial, productions)  n  (min, max, newProductions)  rnn = generateRandomStrings (normalizeGrammar (updateGrammar g newProductions)) n (min, max, []) rnn 

accumulatedProbability:: [Double] -> [Double]
accumulatedProbability [] = []
accumulatedProbability l@(x:xs) = [1 - sum(xs)] ++  accumulatedProbability(xs)

updateGrammar ::BabbleGrammar -> [Prod] -> BabbleGrammar
updateGrammar grammar [] = grammar
updateGrammar grammar ((nt, []):xs) = updateGrammar grammar xs
updateGrammar grammar@(initial, productions) ((nt, symbols):xs)
        |Map.member nt prods = updateGrammar ( initial, (Map.toList (Map.insert nt (map 
            (\x -> if (Map.member (fst x) sym) then (fst x, sym Map.! (fst x)) else x)
            (prods Map.! nt)) prods))) xs
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
test1 = ("Exp" ,[( "Exp",[([(NoTerm "Exp"),(NoTerm "Exp")],0.9),
    ([(NoTerm "Exp"),(Term "+"),(NoTerm "Exp")],0.91)])])

