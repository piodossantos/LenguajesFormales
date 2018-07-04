{
module Tokens where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-
  $white+				;
  (\%prob ) {\s -> (Prob)}
  ([0-9]+(\.[0-9]+)?(e(\+|\-)?[0-9]+)?) {\s -> Nprob (read s)}
  (\:) {\s -> (Colon)}
  (\_) {\s -> (UnderScore)}
  (\;) {\s -> (SemiColon)}
  (\|) {\s -> (Pipe)}
  (\'([^\"\']|\\\"|\\\'|$white)*\') {\s -> (ChainTerm (take ((length s) - 2) (drop 1 s)))}
  ([a-zA-Z]+) {\s -> (ChainNTerm s)}

{

{-
  Tipo de Dato Algebraico para token.
-}
data Token =
  ChainTerm String |
  ChainNTerm String |
  Colon | 
  SemiColon |
  Prob |
  Nprob Double |
  Pipe |
  UnderScore 
  deriving (Eq,Show)

}