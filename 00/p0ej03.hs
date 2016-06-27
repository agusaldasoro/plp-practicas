--data Maybe  a   = Nothing | Just a
--data Either a b = Left a  | Right b


--dado un numero devuelve su inverso multiplicativo si esta definido, o Nothing en caso contrario.
inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso n = Just (1 / n)

{-Convierte a entero una expresion que puede ser booleana o entera.
En el caso de los booleanos, el entero que corresponde es 0 para False y 1 para True.-}
aEntero :: Either Int Bool -> Int
aEntero (Left i)  = i
aEntero (Right b)
              | b == False = 0
              | otherwise  = 1
