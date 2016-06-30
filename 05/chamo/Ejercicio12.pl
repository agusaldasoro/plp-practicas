% Un árbol binario se representará en Prolog con:
% *   nil, si es vacío.
% *   bin(izq, v, der), donde v es el valor del nodo, izq es el subárbol izquierdo y der es el subárbol derecho.
% Definir predicados en Prolog para las siguientes operaciones: vacío, raiz, altura y cantidadDeNodos. Asumir
% siempre que el árbol está instanciado.

vacio(nil).

raiz(bin(_, R, _), R).

altura(nil, 0).
altura(bin(I, _, D), A) :- altura(I, IN), altura(D, DN), A is max(IN, DN) + 1.

cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(I, _, D), C) :- cantidadDeNodos(I, IC), cantidadDeNodos(D, DC), C is IC + DC + 1.
