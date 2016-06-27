--Elimina todas las apariciones de cualquier caracter de la primera cadena en la segunda.
limpiar :: String -> String -> String
limpiar [] bs     = bs
limpiar _  []     = []
limpiar (a:as) bs = limpiar as (quitar a bs)

quitar :: Char -> String -> String
quitar _ [] = []
quitar a (b:bs)
                | a == b    = quitar a bs
                | otherwise = b:(quitar a bs)

--Elimina todas las apariciones del primer parametro como subcadena del segundo.
quitarApariciones :: String -> String -> String
quitarApariciones [] s  = s
quitarApariciones as [] = []
quitarApariciones as bs
            | length bs < length as = bs
            | esPrefijo as bs = quitarApariciones as (quitarPrefijo (length as) bs)
            | otherwise       = (head bs):(quitarApariciones as (tail bs))

esPrefijo :: String -> String -> Bool
esPrefijo []   _    = True
esPrefijo _    []   = False
esPrefijo (a:as) (b:bs)
                    | a == b    = esPrefijo as bs
                    | otherwise = False

quitarPrefijo :: Int -> String -> String
quitarPrefijo 0 s      = s
quitarPrefijo n []     = []
quitarPrefijo n (x:xs) = quitarPrefijo (n-1) xs

--Dada una lista de numeros, devuelve la diferencia de cada uno con el promedio general.
difPromedio :: [Float] -> [Float]
difPromedio as = map (\x -> x - (promedio as)) as

promedio :: [Float] -> Float
promedio [] = 0
promedio as = (sumatoria as) / (fromIntegral (length as))

sumatoria :: [Float] -> Float
sumatoria [] = 0
sumatoria (a:as) = a + sumatoria as

--Indica si una lista de enteros tiene todos sus elementos iguales.
todosIguales :: [Int] -> Bool
todosIguales []     = True
todosIguales (a:[]) = True
todosIguales (a:b:xs)
                    | a == b    = todosIguales (b:xs) 
                    | otherwise = False 
