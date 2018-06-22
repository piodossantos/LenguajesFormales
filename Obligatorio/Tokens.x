{
module Tokens where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-
  $white+				;
  (\:) {\s -> (Colon)}
  (\;) {\s -> (SemiColon)}
  (\|) {\s -> (Pipe)}
  (\'([^\"\\\n\r]|\\(\"|\\|\/|b|f|n|r|t))*\') {\s -> (ChainTerm s)}
  (([^\"\\\n\r]|\\(\"|\\|\/|b|f|n|r|t))*) {\s -> (ChainNTerm s)}

{

{-
  Tipo de Dato Algebraico para token.
-}
data Token =
  ChainTerm String |
  ChainNTerm String |
  Colon | 
  SemiColon |
  Pipe
  deriving (Eq,Show)

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
    print (alexScanTokens s)

}
