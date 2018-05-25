{
module Grammar where
import Tokens
import Data.Map
}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
    str { Chain }
    number  {Literal }
    boolean { Truthy }
    ',' { Comma }
    ':' { Colon }
    '{' { LCurly }
    '}' { RCurly }
    '[' { LBraces }
    ']' { RBraces }
    null {NullB}


JsonG : null { GNull }
    | str            { GString $1 }
    | number           { GNumber $1::Double }
    | boolean            { GBoolean $1::Bool }
    | '[' Elem ']' {GList $2}
    | '['']' {GList []}
    | '{''}' {GObject empty}
    | '{' Obj '}' {GObject $2}


Elem : JsonG  { [$1] }
    | Elem ',' JsonG {$1 ++ [$3]}

 
Obj : str ':' JsonG {(Map $1 $3)}
    | Obj ',' str ':' JsonG { insert $3 $5 $1 }


parseError :: [Token] -> a
parseError _ = error "Parse error"


data JSON= GString String|
    GNumber Double|
    GBoolean Bool|
    GList [JSON] |
    GNull|
    GObject (Map String JSON)
    deriving (Show,Eq)
}
