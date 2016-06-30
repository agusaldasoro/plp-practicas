% Un árbol binario se representará en Prolog con:
% *   nil, si es vacío.
% *   bin(izq, v, der), donde v es el valor del nodo, izq es el subárbol izquierdo y der es el subárbol derecho.
% Definir los siguientes predicados, utilizando la representaci´on de ´arbol binario definida en el ejercicio 12:

% i. inorder(+AB,-Lista), que tenga éxito si AB es un árbol binario y Lista la lista de sus nodos según el
% recorrido inorder.

inorder(nil, []).
inorder(bin(I, V, D), L) :- inorder(I, IL), inorder(D, DL), append(IL, [V | DL], L).

% ii. arbolConInorder(+Lista,-AB), versión inversa del predicado anterior.
arbolConInOrder([], nil).
arbolConInOrder(L, bin(I, X, D)) :- append(IL, [X | DL], L), arbolConInOrder(IL, I), arbolConInOrder(DL, D).

% iii. aBB(+T), que será verdadero si T es un árbol binario de búsqueda.
aBB(nil).
aBB(A) :- inorder(A, L), sorted(L).

sorted([]).
sorted([_]).
sorted([X1, X2 | XS]) :- X1 < X2, sorted([X2 | XS]).
