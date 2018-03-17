
{--
	Usar para testear
--}

testRecogniser::IO()
testRecogniser = putStr $ concat $ map (\x -> show(x) ++ "\t=  " ++ show(recogniser x) ++ "\n") input
  where
    input = [".l.","()","1","+",")()","(1(2))","1*2*3+8+7-(8*8/2-(2*2))"]

{--
	Mi idea es ver primero si la cadena pertenece al lenguaje o no, es decir si todos sus simbolos estan o no.
	Luego quitar los espacio
	Antes de iterar String verificar:
		#parentesis_abiertos = #parentesis cerrado
		#numeros > #operadores
	Despues hacer magia para ver si tiene sentido o no.
	iterar el string y ver en cada caso que cumpla o no, leyendo de derecha a izquierda.
		* si hay ( entonces tiene q seguirle un numero.
		* si hay un numero no importa que venga despues
		* si hay un operador antes y despues tiene q haber un numero
		* si hay ) entonces no importa que venga despues.

--}
-- Devuelve True si es valido, False si no.
recogniser::String->Bool
recogniser s = if (head s)==')' then False else aux (removeBlanks s) 0

aux::String->Int->Bool
aux [] n = (n==0)

aux (x:xs:xss) n
	|no_lenguaje = False
	|(elem x operator) && (elem xs ('(':['0'..'9'])) = aux (xs:xss) n
	|(x == '(') && (notElem xs (operator++[')'])) = aux (xs:xss) (n+1)
	|(x == ')') = aux (xs:xss) (n-1)
	|(elem x ['0'..'9']) && (xs/='(') = aux (xs:xss) n
	|otherwise = False
		where
			no_lenguaje = not ((elem x alphabet) && (elem xs alphabet))
			operator = ['+','*','-','/']
			alphabet = ['0'..'9'] ++ operator ++ ['(',')']

aux (x:[]) n
	|(elem x ['0'..'9']) = aux [] n
	|(x==')') = aux [] (n-1)

aux _ _ = False




removeBlanks::String->String
removeBlanks a = [x | x <- a, x/=' ']
