{
module Main (main) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-
  $white+				;
  (\[) {\s -> (LBraces s)}
  (\]) {\s -> (RBraces s)}
  (\,) {\s -> (Comma s)}
  (\:) {\s -> (Colon s)}
  (\{) {\s -> (LCurly s)}
  (\}) {\s -> (RCurly s)}
  (true|false|null) {\s -> (Special s)}
  (\-)?([0-9]+(\.[0-9]+)?([eE](\+|\-)?[0-9]+)?) {\s -> (Literal s)}
 (\"([^\"\\\n\r]|\\(\"|\\|\/|b|f|n|r|t))*\"){\s -> (Chain s)}

{

{-
  Tipo de Dato Algebraico para token.
-}
data Token =
  Special String|
  Literal String|
  Chain String |
  LBraces String|
  RBraces String|
  Comma String|
  RCurly String|
  LCurly String|
  Colon String
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
main = do
  s <- getContents
  return (alexScanTokens s)
}
