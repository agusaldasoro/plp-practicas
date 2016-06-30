% Trabajaremos con árboles binarios, usando nil y bin(AI, V, AD) para representarlos en Prolog.
% i. Implementar un predicado arbol(-A) que genere estructuras
% de árbol binario, dejando los valores de los nodos sin instanciar.
% Deben devolverse todos los árboles posibles (es decir, para
% toda estructura posible, el predicado debe devolverla luego de
% un número finito de pedidos). No debe devolverse dos veces el
% mismo árbol.
% ? arbol(A).
% A = nil ;
% A = bin(nil, _G104, nil) ;
% A = bin(nil, _G107, bin(nil, _G117, nil)) ;
% ...

% arbolDesdeLista(+L, -A)
arbolDesdeLista([], nil).
arbolDesdeLista(L, bin(I, X, D)) :- append(LI, [X | LD], L), arbolDesdeLista(LI, I), arbolDesdeLista(LD, D).

arbol(A) :- desde(0, N), length(L, N), arbolDesdeLista(L, A).

desde(X, X).
desde(X, Y) :- N is X + 1, desde(N, Y).

% ii. Implementar un predicado nodosEn(?A, +L) que es verdadero
% cuando A es un árbol cuyos nodos pertenecen al conjunto conjunto
% de átomos L (representado mediante una lista no vacía, sin orden
% relevante y sin repetidos). Puede asumirse que el árbol se recibe
% instanciado en su estructura, pero no necesariamente en sus nodos.
% ? arbol(A), nodosEn(A, [ka, pow]).
% A = nil ;
% A = bin(nil, ka, nil) ;
% A = bin(nil, pow, nil) ;
% A = bin(nil, ka, bin(nil, ka, nil)) ;
% A = bin(nil, ka, bin(nil, pow, nil)) ;
% ...
nodosEn(A, L1) :- listaDeNodos(A, L2), todosContenidos(L2, L1).

todosContenidos([], _).
todosContenidos([X | XS], L) :- member(X, L), todosContenidos(XS, L).

listaDeNodos(nil, []).
listaDeNodos(bin(I, X, D), L) :- listaDeNodos(I, LI), listaDeNodos(D, LD), append(LI, [X | LD], L).

% iii. Implementar un predicado sinRepEn(-A, +L) que genere todos los
% árboles cuyos nodos pertenezcan al alfabeto L y usando como máximo
% una vez cada símbolo del mismo. En este caso, no hay infinitos árboles
% posibles; es importante que el predicado no devuelva soluciones repetidas
% y que no se quede buscando indefinidamente una vez terminado el
% espacio de soluciones.
% ? arbolSinRepEn(A, [ka, pow]).
% A = nil ;
% A = bin(nil, ka, nil) ; ...
% A = bin(nil, ka, bin(nil, pow, nil)) ;
% ... ;
% No.
arbolSinRepEn(A, L) :- subconjunto(L, XS), arbolDesdeLista(XS, A).

subconjunto([], []).
subconjunto([X | XS], [X | YS]) :- subconjunto(XS, YS).
subconjunto([_ | XS], YS) :- subconjunto(XS, YS).
