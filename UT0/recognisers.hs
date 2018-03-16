
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
recognizer::String->Bool
recognizer _ = error "No implementado"
{--
	recognizer (x:'(':z:xs)

--}
isInAlphabet::Char->Bool
isInAlphabet a = elem a alphabet
	where alphabet = ['0'..'9']++['+','-','*','/']++['(',')']

removeBlanks::String->String
removeBlanks a = [x | x <- a, x/=' ']