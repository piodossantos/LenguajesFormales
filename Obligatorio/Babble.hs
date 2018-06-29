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
generateValidStrings grammar n (min, max, prods) = do
    let updatedGrammar = normalizeGrammar (updateGrammar grammar prods)
    gen <- newStdGen
    return (generateValidRandomStrings updatedGrammar n min max gen)

generateValidRandomStrings:: BabbleGrammar -> Int -> Int -> Int -> StdGen -> [String]
generateValidRandomStrings _ 0 _ _ _ = []
generateValidRandomStrings grammar n min max generator = (generateValidRandomString grammar min max (randomRs (0.0, 1.0) generator)) : (generateValidRandomStrings grammar (n-1) min max (snd (next generator))) 


generateValidRandomString (initial, productions) min max (r:rs) =
    concat(map (\x -> case x of 
        (n, (Term y)) -> y
        (n, (NoTerm y)) -> (generateValidRandomString  (y ,productions) (min - 1) (max -1) (drop n rs))) (zip [0..] (fst ( usedProds !! index))))
    where 
        prods = (Map.fromList productions) Map.! initial
        desirableProds = normalizeProd (getProductionsByHeight min max prods)
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
test1 = ("Exp" ,[( "Exp",[
                          ([(NoTerm "Exp"),(Term "+"),(NoTerm "Exp")],1),
                          ([(NoTerm "Exp"),(Term "-"),(NoTerm "Exp")],1),
                          ([(Term "3")], 1),
                          ([(Term "7")], 1),
                          ([(Term "5")], 1)]
                           
                 )
                ]
        )

