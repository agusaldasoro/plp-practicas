desde(X, X).
desde(X, Y) :- N is X + 1, desde(N, Y).

% Parte I %
% desde(+X, -Y)

% Parte II %
% desde(+X, ?Y)

desde2(X, X).
desde2(X, Y) :- nonvar(Y), Y > X, N is X + 1, desde2(N, Y).
desde2(X, Y) :- var(Y), N is X + 1, desde2(N, Y).
