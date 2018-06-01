{
module Grammar where
import Tokens
import Data.Fixed
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


%nonassoc '>' '<' '<=' '>=' '==' '!='
%left '||'
%left '&&'
%right '!'
%left '+' '-'
%left '*' '/' '%' '//'
%left NEG
%%

Expresion : BExpresion {(Left $1)}
    | AExpresion {(Right $1)}

BExpresion : 'T'            { True }
    | 'F'           { False }
    | AExpresion '==' AExpresion {$1 == $3}
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
    | AExpresion '//' AExpresion {fromIntegral ($1 `div'` $3)}
    | AExpresion '%' AExpresion {$1 `mod'` $3}
    | AExpresion '+' AExpresion {$1 + $3 }
    | AExpresion '-' AExpresion {$1 - $3}
    | '-' AExpresion %prec NEG { -$2 }
    | '(' AExpresion ')' {$2}


{
parseError :: [Token] -> a
parseError _ = error "Parse error"


main = do 
    contents <- getLine
    putStrLn (show (parseCalc (alexScanTokens  contents)))
    main
}