data BabbleGrammar = BabbleGrammar String [Prod]
    deriving(Show,Eq)
data Prod = Prod NoTerm [([Sym],Prob)]
    deriving(Show,Eq)
data Symbol = NoTerm String | Term String
    deriving(Show,Eq)
