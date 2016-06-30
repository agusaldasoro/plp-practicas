padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).

% Ejercicio 1 %

% ?- abuelo(X, manuel).
% X = juan .

% Ejercicio 2 %
hijo(X, Y) :- padre(Y, X).

hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.

descendiente(X, Y) :- hijo(X, Y).
descendiente(X, Y) :- hijo(Z, Y), descendiente(X, Z).

% Ejercicio 4 %

% ?- abuelo(juan, X).

% Ejercicio 5 %
ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).
