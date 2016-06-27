%%\

entre(X,Y,X) :- X=<Y.
entre(X,Y,Z) :- X=<Y, N is X+1, entre(N,Y,Z).

padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).
hijo(X,Y) :- padre(Y,X).
hermano(X,Y) :- padre(Z,X), padre(Z,Y).
descendiente(X,Y) :- padre(Y,X).
descendiente(X,Y) :- padre(Z,X), descendiente(Z,Y).

vecino(X, Y, [X|[Y|Ls]]).
vecino(X, Y, [W|Ls]) :- vecino(X,Y,Ls).

natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X,X) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X,Y).

concat([],Xs,Xs).
concat([X|Xs],Y,[X|Z]) :- concat(Xs,Y,Z).

last([X],X).
last([X|Xs],Y) :- last(Xs,Y).

list([]).
list([X|Xs]).

sincola([X],[]).
sincola([X|Xs],[X|Ys]) :- sincola(Xs, Ys).

reverse([],[]).
reverse([X|Xs], L) :- reverse(Xs,N), sincola(L,N), last(L,X).

maxlista([X],X).
maxlista([X|Xs], Y) :- maxlista(Xs,Y), Y>=X.

prefijo(P,L) :- append(P,X,L).
sufijo(S,L) :- append(X,S,L).
sublista(S,L) :- sufijo(X,L), prefijo(S,X).

pertenece(X,[X|Xs]).
pertenece(X,[Y|Ys]) :- pertenece(X,Ys).

aplanar([],[]).
aplanar([X|Xs],[X|Ys]) :- not(list(X)), aplanar(Xs,Ys).
aplanar([X|Xs],Y) :- list(X), aplanar(X,L), append(L,Xs,N), aplanar(N,Y).
 
palindromo(L,P) :- reverse(L,L1), append(L,L1,P).

doble([],[]).
doble([X|Xs], [X|[X|Ys]]) :- doble(Xs,Ys).

iesimo(1,[X|Xs],X).
iesimo(N,[X|Xs],Y) :- J is N-1, iesimo(J,Xs,Y).

interseccion(L1,L2,L3) :- setof(X,(member(X,L1), member(X,L2)),L3).

split(N,L,L1,L2):- append(L1,L2,L), length(L2,N).

intercalar([],L,L).
intercalar(L,[],L).
intercalar([X|Xs],[Y|Ys],[X|[Y|R]]) :- intercalar(Xs,Ys,R).

inorder(nil,[]).
inorder((bin(I,R,D)),L):- inorder(I,Li), inorder(D,Ld), append(Li,[R],H), append(H,Ld,L).

arbolconInorder(nil,[]).
arbolconInorder(bin(I,R,D),L):- append(S,Ld,L), append(Li,[R],S), arbolconInorder(I,Li), arbolconInorder(D,Ld).
