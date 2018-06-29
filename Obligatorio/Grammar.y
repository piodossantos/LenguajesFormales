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
 ';' {SemiColon}
 prob {Prob }
 nprob {Nprob $$}
 '|' {Pipe}
 '_' {UnderScore}

%%

BabbleG : NT ':' Elems ';' {($1, $3)}
    |'_' ':' Terms ';' { ($1,$3)}

Terms: T {[([Term $1],1.0)]}
    | T '|' Terms {[([Term $1])]++$3}

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
    deriving(Show,Eq)
type Prod = (String , [([Symbol],Double)])
type BabbleGrammar = (String, [Prod])

}