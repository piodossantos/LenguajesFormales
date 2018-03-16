main = putStrLn("Hello World")

factorial::Int->Int
factorial 1 = 1
factorial x= if x<1 then error "Ta mal" else x * factorial(x-1) 

fib::Int->Int
fib 0 = 0
fib 1 = 1
fib x = fib(x-1) + fib(x-2)