{
module Tokens where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-
  $white+				;
  ([0-9]+(\.[0-9]+)?) {\s -> (Num s)}
  (true) {\s -> (Truel)}
  (false) {\s -> (Falsel)}
  (\*) {\s -> (Mul)}
  (\/\/) {\s -> (IDiv)}
  (\/) {\s -> (Div)}
  (\%) {\s -> (Mod)}
  (\+) {\s -> (Suml)}
  (\-) {\s -> (Diffl)}
  (\=\=) {\s -> (Equals)}
  (\!\=) {\s -> (Different)}
  (\<) {\s -> (Minor)}
  (\>) {\s -> (Greater)}
  (\<\=) {\s -> (MinorE)}
  (\>\=) {\s -> (GreaterE)}
  (\!) {\s -> Notl}
  (\&\&) {\s -> Andl}
  (\|\|) {\s -> Orl}
  (\(){\s -> OBrace}
  (\)){\s -> CBrace}
{

{-
  Tipo de Dato Algebraico para token.
-}
data Token =
  Num String|
  Truel |
  Falsel |
  Mul |
  Div |
  IDiv|
  Mod |
  Suml |
  Diffl|
  Equals|
  Different |
  Minor|
  Greater|
  MinorE|
  GreaterE|
  Notl|
  Andl|
  Orl|
  OBrace|
  CBrace 
  deriving (Eq,Show)
}