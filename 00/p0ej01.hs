:t null
null :: Foldable t => t a -> Bool
--Valor vacio

:t head
head :: [a] -> a
--Devuelve el primer elemento de la lista

:t tail
tail :: [a] -> [a]
--Devuelve la lista sin el primer elemento

:t init
init :: [a] -> [a]
--Devuelve la lista sin el ultimo elemento

:t last
last :: [a] -> a
--Devuelve el ultimo elemento de la lista

:t take
take :: Int -> [a] -> [a]
--Toma los primeros n elementos de la lista

:t drop
drop :: Int -> [a] -> [a]
--Elimina los primeros n elementos de la lista

:t (++)
(++) :: [a] -> [a] -> [a]
--Concatena dos listas

:t concat
concat :: Foldable t => t [a] -> [a]
--Aplana las listas dentro de listas

:t (!!)
(!!) :: [a] -> Int -> a
--Devuelve el elemento n de la lista (Indexa en cero)

:t elem
elem :: (Eq a, Foldable t) => a -> t a -> Bool
--Devuelve si pertenece el elemento a la lista
