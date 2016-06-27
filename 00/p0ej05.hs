data AB a = Nil | Bin (AB a) a (AB a)

--Indica si un arbol es vacio (i.e. no tiene nodos).
vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _   = False

--Dado un arbol de booleanos construye otro formado por la negacion de cada uno de los nodos.
negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin a1 n a2) = Bin (negacionAB a1) (not n) (negacionAB a2)


--Calcula el producto de todos los nodos del arbol.
productoAB :: AB Int -> Int
productoAB Nil = 1
productoAB (Bin a1 n a2) = (productoAB a1) * n * (productoAB a2)
