{-EJERCICIO 2A
dado un numero devuelve su valor absoluto.-}
valorAbsoluto :: Float -> Float
valorAbsoluto f = calcularValor f 0

calcularValor :: Float -> Float -> Float
calcularValor f v
                | v + 1 > f = v
                | otherwise = calcularValor f (v+1)


--dado un numero que representa un anio, indica si el mismo es bisiesto.
bisiesto :: Int -> Bool
bisiesto n = divisiblePor 4 n && (not(divisiblePor 100 n) || divisiblePor 400 n)

divisiblePor :: Int -> Int -> Bool
divisiblePor n m = (mod m n) == 0

--Definida unicamente para enteros positivos, que computa el factorial.
factorial :: Int -> Int
factorial n 
        | n == 0    = 1
        | otherwise = factorial (n-1) * n

--Dado un entero positivo devuelve la cantidad de divisores primos.
cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos n = length (divisoresDe n n)

divisoresDe :: Int -> Int -> [Int]
divisoresDe n m 
        | m == 0    = []
        | m == 1    = []
        | (mod n m == 0) && esPrimo m = [m] ++ divisoresDe n (m-1)
        | otherwise = divisoresDe n (m-1)

esPrimo :: Int -> Bool
esPrimo n = esPrimoR n (n-1)

esPrimoR :: Int -> Int -> Bool
esPrimoR 0 _ = False
esPrimoR 1 _ = False
esPrimoR n d 
        | d == 1       = True
        | mod n d == 0 = False
        | otherwise    = esPrimoR n (d-1)
