% Ejercicio 1
padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
padre(ramiro, pepe).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

hijo(X,Y) :- padre(Y,X).
hermano(X,Y) :- padre(Z,X), padre(Z,Y), X \= Y.
descendiente(X,Y) :- hijo(X,Y).
descendiente(X,Y) :- padre(Y,Z), descendiente(X,Z).

ancestro(X, X).
ancestro(X, Y) :- hijo(Y,X).
ancestro(X, Y) :- hijo(Y,Z), descendiente(Z,X).

% Ejercicio 2
vecino(X, Y, [X|[Y|_]]).
vecino(X, Y, [_|Ls]) :- vecino(X, Y, Ls).

% Ejercicio 3
natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X,X) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).

% Ahora funciona, pero respondiendo al item ii, se cuelga con menorOIgual(?X,-Y)

% Ejercicio 4
concatenar([], L2, L2).
concatenar([X|L1], L2, [X|L3]) :- concatenar(L1, L2, L3).

% Ejercicio 5
% i
last([X],X).
last([_|L], W) :- last(L, W).

% ii
reverse([], []).
reverse([X|L1], L2) :- reverse(L1, Z), concatenar(Z,[X],L2).

% iii
max(X,X).
max(X,Y):- X >= Y.

maxlista([X], X).
maxlista([X|L], Y) :- maxlista(L,Z), Y is max(Z, X).

min(X,X).
min(X,Y):- X =< Y.

minlista([X], X).
minlista([X|L], Y) :- minlista(L,Z), Y is min(Z, X).

% iv
prefijo(S, L) :- append(S,_,L).

% v
sufijo(S,L):- append(_,S,L).

% vi
sublista(S, L) :- sufijo(S,X), prefijo(X,L).

% vii
pertenece(X, [X|_]).
pertenece(X, [_|L]) :- pertenece(X, L).

% Ejercicio 6
aplanar([X|Xs], L) :- aplanar(X,H), aplanar(Xs,T), concatenar(H,T,L), !.
aplanar([],[]).
aplanar(X, [X]).

% Ejercicio 7
% i
palindromo(L, L1) :- reverse(L,T), concatenar(L,T,L1).

% ii
doble([],[]).
doble([X|L], [X|[X|L1]]) :- doble(L, L1).

% iii
iesimo(0,[X|_],X) :- !.
iesimo(I,[_|L],X) :- A is I-1, iesimo(A,L,X).

% Ejercicio 8
% i
siguiente(X,X) :- !.
siguiente(X,Y) :- N is X+1, siguiente(N,Y).

desde(X,X).
desde(X,Y) :- nonvar(Y), X =< Y, !.
desde(X,Y) :- N is X+1, desde(N,Y).

% Ejercicio 9
% i
interseccion([X|L1], L2, L3) :- pertenece(X,L2), interseccion(L1, L2, M), append([X],M,L3), !.
interseccion([], _, []).
interseccion([_|L1], L2, L3) :- interseccion(L1, L2, L3).

% ii
split(N, L, L1, L2) :- append(L1, L2, L), length(L1,N).

% iii
borrar([],_,[]).
borrar([X|L],X,D) :- borrar(L,X,D).
borrar([Y|L],X,[Y|D]) :- X \== Y, borrar(L,X,D).

% iv
sacarDuplicados([],[]).
sacarDuplicados([X|L],D) :- pertenece(X,L), borrar(L,X,M), sacarDuplicados(M,D).
sacarDuplicados([X|L], [X|D]) :- borrar(L,X,L), sacarDuplicados(L,D).

% v
appendearTodas([],[]).
appendearTodas([X|R], L) :- append(X,M,L), appendearTodas(R,M).

reparto(L,N,R) :- length(R,N), appendearTodas(R,L).

% vi
appendearTodasSinVacia([L],L).
appendearTodasSinVacia([[X|N]|R],L) :- append([X|N],[Y|M],L), appendearTodasSinVacia(R,[Y|M]).

repartoSinVacias(L,R) :- appendearTodasSinVacia(R,L).

% Ejercicio 10
intercalar([],L2, L2).
intercalar(L1, [], L1).
intercalar([X|L1],[Y|L2],[X|[Y|L3]]) :- intercalar(L1,L2,L3).

% Ejercicio 12
arbol(1, bin(nil,izq,nil)).
arbol(2, bin(bin(nil,izq,nil),raiz,bin(nil,der,nil))).
vacio(nil).

raiz(bin(_,V,_), V).

altura(nil, 0).
altura(bin(I,_,D), A) :- altura(I, AI), FAI is AI+1, altura(D, AD), 
						FAD is AD+1, A is max(FAI,FAD).

cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(I,_,D), A) :- cantidadDeNodos(I, AI), cantidadDeNodos(D, AD), 
								A is AI + AD + 1.

% Ejercicio 13
inorder(nil,[]).
inorder((bin(I,R,D)),L):- inorder(I,LI), inorder(D,LD), append(LI,[R|LD],L).

arbolConInorder(nil,[]).
arbolConInorder(bin(I,R,D),L):- append(LI,[R|LD],L), arbolConInorder(I,LI), arbolConInorder(D,LD).

% -------------- GENERATE AND TEST ------------------
% Ejercicio 14
coprimos(X, Y) :- desde(2, X), between(2, X, Y), G is gcd(X, Y), G = 1.

% Ejercicio 15
cuadradoSemiLatino(N, M) :- desde(0, SUMA), matriz(N, SUMA, M), sumRows(SUMA, M).

sumRows(_, []).
sumRows(SUM, [R | RS]) :- suma_lista(R, SUM), sumRows(SUM, RS).

suma_lista([], 0).
suma_lista([X | XS], SUM) :- suma_lista(XS, M), SUM is M + X.

matriz(N, SUMA, M) :- length(M, N), fillRows(N, SUMA, M).

fillRows(_, _, []).
fillRows(N, SUMA, [R | RS]) :- length(R, N), fillRow(SUMA, R), fillRows(N, SUMA, RS).

fillRow(SUMA, [X]) :- between(0, SUMA, X).
fillRow(SUMA, [X | XS]) :- between(0, SUMA, X), fillRow(SUMA, XS).

% Ejercicio 17
% i
esTriangulo(tri(A, B, C)) :- esCompatible(A, B, C), esCompatible(B, A, C), esCompatible(C, A, B).

esCompatible(A, B, C) :- A > 0, A < B + C, A >= B - C.

% ii
perimetro(tri(A, B, C), P) :- definido(tri(A, B, C)), esTriangulo(tri(A, B, C)), P is A + B + C.
perimetro(tri(A, B, C), P) :- var(P), nodefinido(tri(A, B, C)), desde(1, P), perimetro(tri(A, B, C), P).
perimetro(tri(A, B, C), P) :- nonvar(P), nodefinido(tri(A, B, C)), between(1, P, A), between(1, P, B), between(1, P, C), P is A + B + C, esTriangulo(tri(A, B, C)).

definido(tri(A, B, C)) :- nonvar(A), nonvar(B), nonvar(C).
nodefinido(tri(A, _, _)) :- var(A). % No importan parcialmente instanciados

% iii
triangulo(T) :- perimetro(tri(A, B, C), P), T = tri(A, B, C).

% Ejercicio 20
corteMasParejo(L, L1, L2) :- append(L1, L2, L), not(existeCorteMasParejo(L, L1, L2)).

existeCorteMasParejo(L, L1, L2) :- append(L3, L4, L), diffSums(L1, L2, D), diffSums(L3, L4, D2), D2 < D.

diffSums(L1, L2, N) :- sum_list(L1, N1), sum_list(L2, N2), D is N2 - N1, N is abs(D).

% -------------- Integradores ----------------
% Ejercicio 22
genNumeros(0).
genNumeros(N) :- genNumeros(M), N is M+1.

genArboles(I,D,N) :- length(L,N), append(LD,LI,L), arbolConInorder(I,LI), arbolConInorder(D,LD).

arbol(nil).
arbol(bin(I,_,D)) :- genNumeros(X), genArboles(I,D,X).

mapeador(P,[]).
mapeador(P,[X|L]) :- call(P,X), mapeador(P,L).

mayorQueUno(X) :- X > 1.