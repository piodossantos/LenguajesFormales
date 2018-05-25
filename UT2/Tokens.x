{
module Tokens where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-
  $white+				;
  (\[) {\s -> (LBraces)}
  (\]) {\s -> (RBraces)}
  (\,) {\s -> (Comma)}
  (\:) {\s -> (Colon)}
  (\{) {\s -> (LCurly)}
  (\}) {\s -> (RCurly)}
  (true) {\s -> (TrueB )}
  (false) {\s -> (FalseB)}
  (null) {\s -> (NullB )}
  (\-)?([0-9]+(\.[0-9]+)?([eE](\+|\-)?[0-9]+)?) {\s -> (Literal s)}
 (\"([^\"\\\n\r]|\\(\"|\\|\/|b|f|n|r|t))*\"){\s -> (Chain s)}

{

{-
  Tipo de Dato Algebraico para token.
-}
data Token =
  Literal String|
  Chain String |
  LBraces |
  RBraces |
  Comma |
  RCurly |
  LCurly |
  TrueB|
  FalseB|
  NullB |
  Colon 
  deriving (Eq,Show)

-- Entradas para testear
test1 = ["true","false","null","{","}","[","]",":",",","73","9.3","9.0","9.0","9e14","\"hola carola\"","\"'ho'\"","\n"]
-- Funcion para testear
test2:: [Token]
test2 = concat $ map (\x -> (alexScanTokens x)) test1

{-
  showInLine
  Recibe una lista de Token y lo muestra en linea
-}

showInLine:: [Token] -> IO()
showInLine y = putStr $ concat $ map (\x-> show(x) ++ "\n") y


{-
  getTokenJSON
  Recibe como entrada un texto.
-}
getTokenJSON::String->IO()
getTokenJSON x = showInLine $ alexScanTokens $ x

{-
  Espera entradas por teclado y devuelve sus tokens.
-}

}
