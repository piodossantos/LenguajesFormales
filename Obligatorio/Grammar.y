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
 prob {Prob $$ }
 '|' {Pipe}


%nonassoc '>' '<' '<=' '>=' '==' '!='
%left '||'
%left '&&'
%right '!'
%left '+' '-'
%left '*' '/' '%' '//'
%left NEG
%%


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