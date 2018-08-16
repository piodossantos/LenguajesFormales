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
  num {Num $$}
  'T' {Truel}
  'F' {Falsel} 
  '*' {Mul} 
  '/' {Div} 
  '//' {IDiv}
  '%' {Mod} 
  '+' {Suml} 
  '-' {Diffl}
  '==' {Equals}
  '!=' {Different}
  '<' {Minor}
  '>' {Greater}
  '<=' {MinorE}
  '>=' {GreaterE}
  '!' {Notl}
  '&&' {Andl}
  '||' {Orl}
  '(' {OBrace}
  ')' {CBrace}
  '^' {Pot}
  '[' {LSquare}
  ']' {RSquare}
  ',' {Coma}
  '#' {HashTag}
  'e' {Exists}




%nonassoc '>' '<' '<=' '>=' '==' '!='
%left '||'
%left '&&'
%right '!'
%left '+' '-'
%left '*' '/' '%' '//'
%left '^'
%left NEG
%left COUNT

%%


Expresion : BExpresion {(Boolean $1)}
    | AExpresion {(Numerical $1)}
    | List {Listing $1}
    |List '+' List { Listing (( $1) ++ ( $3))}
    |List '!=' List { Listing (( $1) ++ ( $3))}
    |List '==' List { Boolean ($1 == $3)}



  

List : '['']' {[]}
    | '[' ElementList ']' {$2}

ElementList :
    List {[(Listing $1)]}
    |AExpresion {[(Numerical $1)]}
    |BExpresion {[(Boolean $1)]}
    |ElementList ',' List {$1 ++ [(Listing $3)]}
    |ElementList ',' AExpresion {$1 ++ [(Numerical $3)]}
    |ElementList ',' BExpresion {$1 ++ [(Boolean $3)]}

BExpresion :
    'T' {True}
    |'F'{False}
    |AExpresion '==' AExpresion {$1 == $3}
    | AExpresion '!=' AExpresion {$1 /= $3}
    | BExpresion '==' BExpresion {$1 == $3}
    | BExpresion '!=' BExpresion {$1 /= $3}
    | AExpresion '<' AExpresion {$1 < $3 }
    | AExpresion '>' AExpresion {$1 > $3}
    | AExpresion '<=' AExpresion {$1 <= $3 }
    | AExpresion '>=' AExpresion {$1 >= $3}
    | '!' BExpresion {not $2}
    | BExpresion '&&' BExpresion { $1 && $3}
    | BExpresion '||' BExpresion { $1 || $3}
    | '(' BExpresion ')' {$2}

AExpresion : num { read $1::Double}
    | AExpresion '*' AExpresion {$1 * $3}
    | AExpresion '/' AExpresion {$1 / $3}
    | AExpresion '^' AExpresion {$1 ^ (round $3 ::Int)}
    | AExpresion '//' AExpresion {fromIntegral ($1 `div'` $3)}
    | AExpresion '%' AExpresion {$1 `mod'` $3}
    | AExpresion '+' AExpresion {$1 + $3 }
    | AExpresion '-' AExpresion {$1 - $3}
    | '-' AExpresion %prec NEG { -$2 }
    | '(' AExpresion ')' {$2}


{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data EvaluationResult = Boolean Bool | Numerical Double | Listing {conj :: [EvaluationResult]}
    deriving(Show,Eq,Ord)
main = do 
    contents <- getLine
    putStrLn (show (parseCalc (alexScanTokens  contents)))
    main
}