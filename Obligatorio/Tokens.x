{
module Tokens where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-
  $white+				;
  (\%prob ) {\s -> (Prob)}
  ($digit+\.$digit+) {\s -> Nprob (read s)}
  (\:) {\s -> (Colon)}
  (\_) {\s -> (UnderScore)}
  (\;) {\s -> (SemiColon)}
  (\|) {\s -> (Pipe)}
  (\'([^\"\']|\\\"|\\\'|$white)*\') {\s -> (ChainTerm s)}
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