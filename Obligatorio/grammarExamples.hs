--Ejemplo 1
grammar1="Exp : Exp '+' Exp | Exp '*' Exp | '(' Exp ')' | NUM ; NUM : '0' | '1' | '2' | '3' | '4' | '100' | '1000' ; _ : '' | '\n' | '\t' ;"
--Ejemplo 2
grammar2="Exp : Exp '+' Exp %prob 0.4 ; Exp : Exp '*' Exp %prob 0.4 ; Exp : '(' Exp ')' %prob 0.1 | NUM %prob 0.1 ;"
--Otros ejemplos
grammar3="A : BC %prob 0.1| ABC %prob 0.2; A : CB ; C: '3' | B %prob 3.0; B : '1' '|' '2' '|' '3' %prob 0.3 | '1' '|' B '2' B '|' '3' %prob 0.3 ; _: ' ' | '7'; "


grammarList = [grammar1,grammar2,grammar3,grammar4,grammar5,grammar6,grammar7,grammar8,grammar9,grammar10]