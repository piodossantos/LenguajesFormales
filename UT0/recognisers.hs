
{--
	Usar para testear
--}

testRecogniser::IO()
testRecogniser = putStr $ concat $ map (\x -> show(x) ++ "\t=  " ++ show(recogniser x) ++ "\n") input
  where
    input = ["-9","4--3","(-9)*-16*(-6+3)","+9","9-","((9)",".","()","1","+",")()","(1(2))","1*2*3+8+7-(8*8/2-(2*2))"]


-- Devuelve True si es valido, False si no.
recogniser::String->Bool
recogniser s = if (elem (head s) elems) then False else aux (removeBlanks s) 0 -- chequea el comienzo del string y quita espacios para facilitar validacion
  where
    elems = ['+','*','/',')']
-- Funcion para recorrer  recursivamente la entrada
aux::String->Int->Bool

--Chequea que la cantidad de parentesis abiertos es igual a la de cerrados.
aux [] n = (n==0)

--Paso para considerar un elemento y su siguiente.
aux (x:xs:xss) n
	|no_lenguaje = False -- x o xs no son del lenguaje
  |x == '-' = if (xs ==')') then False else aux (xs:xss) n -- aceptar numeros negativos
	|(elem x operator) && (elem xs (['(','-']++['0'..'9'])) = aux (xs:xss) n -- si hay un operador que no es - , entonces verifica que lo que le sigue sea valido
	|(x == '(') && (notElem xs ((tail operator)++[')'])) = aux (xs:xss) (n+1) -- verifica que venga despues de '(' venga algo que no sea + * / )
	|(x == ')') = aux (xs:xss) (n-1) -- si viene ) no pasa nada solo resta parentesis
	|(elem x ['0'..'9']) && (xs/='(') = aux (xs:xss) n
	|otherwise = False
		where
			no_lenguaje = not ((elem x alphabet) && (elem xs alphabet))
			operator = ['-','+','*','/']
			alphabet = ['0'..'9'] ++ operator ++ ['(',')']

--valida que el ultimo elemento sea un numero o un parentesis
aux (x:[]) n
	|(elem x ['0'..'9']) = aux [] n
	|(x==')') = aux [] (n-1)

--si no encaja en el patron
aux _ _ = False




removeBlanks::String->String
removeBlanks a = [x | x <- a, x/=' ']
