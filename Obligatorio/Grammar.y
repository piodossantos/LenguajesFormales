{
module Grammar where
import Tokens
import Data.Fixed
}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
 T {ChainTerm $$}
 NT {ChainNTerm $$}
 ':' {Colon} 
 ';' {SemiColon }
 prob {Prob }
 nprob {Nprob $$}
 '|' {Pipe}
 '_' {UnderScore}

%%

BabbleG : NT ':' Elems ';' {Prod }
Elems : Elem {[$1]}
    | Elems '|' Elem {$1++$3}
Elem : L prob nprob (($1,$3::Double))
    | L {($1,1)}
L : L NT {$1 ++[NTerm $2]}
    |L T {$1 ++[Term $2]}
    |T {[Term $1]}
    |NT {[NTerm $1]}
{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Symbol =NoTerm String | Term String
    deriving(Show,Eq)
type Prod = (String , [([Symbol],Double)])
type BabbleGrammar = (String, [Prod])



main = do 
    contents <- getLine
    putStrLn (show (parseCalc (alexScanTokens  contents)))
    main
}