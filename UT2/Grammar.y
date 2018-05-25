{
module Grammar where
import Tokens
import Data.Map
}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
    'str' { Chain }
    'number'  {Literal} }
    'boolean' { Truthy }
    ','' { Comma }
    ':' { Colon }
    '{' { LCurly }
    '}' { RCurly }
    '[' { LBraces }
    ']' { RBraces }
    'null' {NullB}



Json : let var '=' Exp in Exp { Let $2 $4 $6 }
    | Exp '+' Exp            { Plus $1 $3 }
    | Exp '-' Exp            { Minus $1 $3 }
    | Exp '*' Exp            { Times $1 $3 }
    | Exp '/' Exp            { Div $1 $3 }
    | '(' Exp ')'            { $2 }
    | '-' Exp %prec NEG      { Negate $2 }
    | int                    { Int $1 }
    | var                    { Var $1 }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"


data JSON= GString String|
    GNumber Double|
    GBoolean Bool|
    GList [JSON] |
    GNull|
    GObject (Map String JSON)
    deriving (Show,Eq)
