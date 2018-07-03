{
module Grammar where
import Tokens
import Data.Fixed
import Data.List
}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
 T {ChainTerm $$}
 NT {ChainNTerm $$}
 ':' {Colon} 
 ';' {SemiColon}
 prob {Prob}
 nprob {Nprob $$}
 '|' {Pipe}
 '_' {UnderScore}

%%

BabbleG: NT ':' Elems ';' { ($1,[($1,$3)]) }
    | NT ':' Elems ';' List_Prod { ($1, groupProductions ([($1,$3)]++$5)) }

List_Prod: Prod { [$1] }
    | Prod List_Prod { [$1] ++ $2 }

Prod: NT ':' Elems ';' { ($1,$3) }
    | '_' ':' Terms ';' { ("_",$3) }

Terms: T {[([Term $1],1.0)]}
    | T '|' Terms {[([Term $1],1.0)]++$3}

Elems : Elem {[$1]}
    | Elem '|' Elems {[$1]++$3}

Elem : L prob nprob {($1,$3::Double)}
    | L {($1,1.0)}

L :  NT L {[(NoTerm $1)]++$2}
    |T L {[(Term $1)]++$2}
    |T {[(Term $1)]}
    |NT {[(NoTerm $1)]}
{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Symbol =NoTerm String | Term String
    deriving(Show,Eq, Ord)
type Prod = (String , [([Symbol],Double)])
type BabbleGrammar = (String, [Prod])
data DerivationTree = Leaf Symbol | Node Symbol [DerivationTree] | Empty

groupProductions:: [Prod] -> [Prod]
groupProductions prods = [ foldl (\(a1,a2) (_,b2) -> (x,b2++a2)) (x,[]) (filter (\a -> (fst a) == x) prods) | x<-heads ]
    where
        heads = Data.List.nub (map (fst) prods)

main = do 
    contents <- getLine
    putStrLn (show (parseCalc (alexScanTokens  contents)))
    main

grammar1="Exp : Exp '+' Exp | Exp '*' Exp | '(' Exp ')' | NUM ; NUM : '0' | '1' | '2' | '3' | '4' | '100' | '1000' ; _ : ' ' | '\n' | '\t' ;"
--Ejemplo 2
grammar2="Exp : Exp '+' Exp %prob 0.4 ; Exp : Exp '*' Exp %prob 0.4 ; Exp : '(' Exp ')' %prob 0.1 | NUM %prob 0.1 ;"
--Otros ejemplos
grammar3="A : BC %prob 0.1| ABC %prob 0.2; A : CB ; C: '3' | B %prob 0.3; B : '1' '|' '2' '|' '3' %prob 0.3 | '1' '|' B '2' B '|' '3' %prob 0.3 ; _: ' ' | '7'; "

grammar4="S: 'a'; "
grammar5="Binas : '1' Binas; Binas : '0' Binas; Binas : '0' | '1';"
}