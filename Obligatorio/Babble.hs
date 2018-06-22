data Symbol =NoTerm String | Term String
    deriving(Show,Eq)
type Prod = (String , [([Symbol],Double)])
type BabbleGrammar = (String, [Prod])


parseGrammar::String -> BabbleGrammar
parseGrammarFile _ = error"No implementado"

parseGrammarFile::String->BabbleGrammar
parseGrammarFile _ =error"No implementado"

unparseGrammar:: BabbleGrammar -> String
unparseGrammar (a,

generateValidStrings::BabbleGrammar-> Int -> (Int,Int,[Prod]) ->[String]
generateValidStrings _ _ _ = error"No implementado"




normalizeGrammar::BabbleGrammar->BabbleGrammar
normalizeGrammar  (a,[])=  (a,[])
normalizeGrammar (a,x)= ( a,(map (\(y,z)-> (y,normalizeProd z)) x))

normalizeProd:: [([Symbol],Double)] -> [([Symbol],Double)]
normalizeProd ts = [(a,(b/total)) | (a,b)<- ts]
    where total = foldl (\z y -> z +( snd y)) 0 ts

test1::BabbleGrammar
test1 = ("Exp" ,[( "Exp",[([(NoTerm "Exp"),(Term "+"),(NoTerm "Exp")],0.9),
    ([(NoTerm "Exp"),(Term "+"),(NoTerm "Exp")],0.91)])])

