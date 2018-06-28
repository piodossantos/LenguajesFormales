import qualified Data.Map as Map
import System.Random
data Symbol =NoTerm String | Term String
    deriving(Show,Eq)
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
    (fst x))) ++ " %prob " ++ (show (snd x)) ++ ";\n"
unparseProduction ("" ,(x:xs)) = (concat (map (\s -> case s of
    (NoTerm nt) -> nt
    (Term t) -> "\"" ++ t ++ "\"")
    (fst x))) ++ " %prob " ++ (show (snd x)) ++ "|" ++ unparseProduction ( "" , xs)
unparseProduction (a, l) = a ++ ":" ++ unparseProduction( "", l)

generateValidStrings::BabbleGrammar-> Int -> (Int,Int,[Prod])  ->IO [String]
generateValidStrings x y z = do
    gen <- newStdGen
    return (generateRandomStrings x y z (randomRs (0.0,1.0) gen))

generateRandomStrings:: BabbleGrammar-> Int -> (Int,Int,[Prod]) -> [Double] ->[String]
generateRandomStrings _ _ _ _= ["holi"]

normalizeGrammar::BabbleGrammar->BabbleGrammar
normalizeGrammar  (a,[])=  (a,[])
normalizeGrammar (a,x)= ( a,(map (\(y,z)-> (y,normalizeProd z)) x))

normalizeProd:: [([Symbol],Double)] -> [([Symbol],Double)]
normalizeProd ts = [(a,(b/total)) | (a,b)<- ts]
    where total = foldl (\z y -> z +( snd y)) 0 ts

test1::BabbleGrammar
test1 = ("Exp" ,[( "Exp",[([(NoTerm "Exp"),(Term "+"),(NoTerm "Exp")],0.9),
    ([(NoTerm "Exp"),(Term "+"),(NoTerm "Exp")],0.91)])])

