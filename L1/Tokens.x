{
module Tokens where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-
  $white+				;
  (([0-9]+(\.[0-9]+)?(e(\+|\-)?[0-9]+)?) | (0x[A-Fa-f0-9]+)) {\s -> (Num s)}
  (true) {\s -> Truel}
  (false) {\s -> Falsel}
  (\*) {\s -> (Mul)}
  (\/\/) {\s -> (IDiv)}
  (\/) {\s -> (Div)}
  (\%) {\s -> (Mod)}
  (\+) {\s -> (Suml)}
  (\-) {\s -> (Diffl)}
  (\^) {\s -> (Pot)}
  (\=\=) {\s -> (Equals)}
  (\/\=) {\s -> (Different)}
  (\<) {\s -> (Minor)}
  (\>) {\s -> (Greater)}
  (\<\=) {\s -> (MinorE)}
  (\>\=) {\s -> (GreaterE)}
  (\!) {\s -> Notl}
  (\&\&) {\s -> Andl}
  (\|\|) {\s -> Orl}
  (\(){\s -> OBrace}
  (\)){\s -> CBrace}
  (\[){\s -> LSquare}
  (\]){\s -> RSquare}
  (\,){\s -> Coma}
  (\#){\s -> HashTag}
  (\<\-){\s -> Exists}
{

{-
  Tipo de Dato Algebraico para token.
-}
data Token =
  Num String|
  LSquare|
  RSquare|
  Coma|
  Truel|
  Falsel|
  HashTag|
  Exists|
  Mul |
  Div |
  IDiv|
  Mod |
  Suml |
  Diffl|
  Equals|
  Different |
  Minor|
  Pot|
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