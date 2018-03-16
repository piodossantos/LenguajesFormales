import System.Random
data Expr = Literal Int | Op Char Expr Expr | Par Expr

--Para que se vea bien bonito
instance Show Expr where
	show (Literal a) = show(a)
	show (Op a b c) = show(b) ++ [a] ++ show(c)
	show (Par a) = "("++show(a)++")"

-- Genera String con expresiones bien formadas y calcula la altura del arbol de expresion de manera aletoria.
genRandomString:: IO String
genRandomString  = do
	g <- newStdGen
	g1 <- newStdGen
	return (show (fst(gen (fst(randomR(0::Int,20::Int) g)) g g1))) 

{--
	*Recibe la altura que tendra el subarbol, cuando es 0 entonces se esta en una hoja.
	*Recibe dos generadores para evitar la simetria en las operaciones en el caso que la condicion sea 0, porque si se g1 y ya genere un g3 (g1->g2->g3) y paso un g2 el comportamiento sera simetrico
--}
gen::Int->StdGen->StdGen->(Expr,StdGen)
--se esta en una hoja
gen 0 g _= ((Literal n),g2)
	where
		(n,g2) = randomR(0,100) g
--paso recursivo
gen x generator1 generator2 
	|x <0 = error "X debe ser mayor a 0"
	|condition == 0 = ((Op (ops!!numberOperator) (fst(gen (x-1) g3 generator2)) (fst(gen (x-1) generator2 g3))),g3)
	|condition == 1 = gen 0 generator2 g3 --Llamo al paso base
	|otherwise = ((Par (fst(gen (x-1) g3 generator2))),g3)
		where
			(condition,g2) = randomR(0::Int,2::Int) generator1
			(numberOperator,g3) = randomR(0::Int,3::Int) g2
			ops=['+','-','*','/']