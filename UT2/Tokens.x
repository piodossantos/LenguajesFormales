{
module Main (main) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-
  $white+				;
  (\:|\,|\[|\]|\{|\}) {\s -> (Symbol s)}
  (true|false|null) {\s -> (Special s)}
  ([0-9]+(\.[0-9]+)?([eE](\+|\-)?[0-9]+)?) |
  \"([^\"\\\/\b\f\n\r\t\u] |
  \\(\"|\\|\/|b|f|n|r|t|u)*\") {\s -> (Literal s)}

{
data Token =
  Special String|
  Literal String|
  Symbol String
  deriving (Eq,Show)

{-
data Token =
	Let 		|
	In  		|
	Sym Char	|
	Var String	|
	Int Int
	deriving (Eq,Show)
-}

test1 = ["true","false","null","{","}","[","]",":",",","73","9.3","9.0","9.0","9e14","hola carola","'ho'","\n"]
test2:: [Token]
test2 = concat $ map (\x -> (alexScanTokens x)) test1
showInLine:: [Token] -> IO()
showInLine y = putStr $ concat $ map (\x-> show(x) ++ "\n") y
main = do
  s <- getContents
  return (alexScanTokens s)
}
