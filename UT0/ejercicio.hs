import System.Random
data Expression = Literal Int| Op Char Expression Expression | Par Expression

{--instance Show Expression where
	(Literal a) = show(a)
	(Op a b c) = show(b)++show(a)++show(c)
	(Par a) = "(" ++ show(a) ++")"--}
gen::  Expression
gen 
	|randX == 0 = (Literal randY)
	|randX == 1 = (Op (op!!randY) (gen) (gen))
	|otherwise = (Par gen)
	where 
		randX = randomInt 0 2
		op=['+','-','*','/']
		randY = randomInt 0 3

randomInt::Int->Int-> [Int]
randomInt x y = do
	g <- newStdGen
	randomRs (x,y) g



