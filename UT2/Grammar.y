{
module Grammar where
import Tokens
import qualified Data.Map 
}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
    str { Chain $$ }
    number  {Literal $$ }
    true { TrueB }
    false {FalseB}
    ',' { Comma}
    ':' { Colon }
    '{' { LCurly }
    '}' { RCurly }
    '[' { LBraces}
    ']' { RBraces }
    null {NullB }


%%
JsonG : null { GNull }
    | str            { GString $1 }
    | number           { GNumber (read $1::Double) }
    | true            { GBoolean True }
    | false {GBoolean False}
    | '[' Elem ']' {GList $2}
    | '['']' {GList []}
    | '{''}' {GObject Data.Map.empty}
    | '{' Obj '}' {GObject $2}


Elem : JsonG  { [$1] }
    | Elem ',' JsonG {$1 ++ [$3]}

 
Obj : str ':' JsonG {Data.Map.fromList [($1,$3)]}
    | Obj ',' str ':' JsonG { Data.Map.insert $3 $5 $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"


data JSON= GString String|
    GNumber Double|
    GBoolean Bool|
    GList [JSON] |
    GNull|
    GObject (Data.Map.Map String JSON)
    deriving (Eq,Ord)

instance Show JSON where
    show (GString s)=s
    show (GNumber n)=show n
    show (GBoolean b) = if b then "true" else "false"
    show (GNull) = "null"
    show (GList x) = "["++ (tail $ concat $ map (\y-> "," ++ show y) x) ++ "]"
    show (GObject x)
        |Data.Map.size x ==0="{}"
        |otherwise = "{"++ (tail $ concat $ Prelude.map (\y-> "," ++ show ( fst  y) ++ ":" ++ show  (snd y) ) (Data.Map.toList x)) ++"}"

a= GObject (Data.Map.fromList [("esto_anda",GNull),("esto_tmbn",GBoolean True)])

main = getContents >>= print . parseCalc . alexScanTokens

}

