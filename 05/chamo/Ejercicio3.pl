natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X, X) :- natural(X).

% Parte I %
% El programa se traba

% Parte II %
% El programa se traba xq el caso recursivo se encuentra antes que el caso base, por lo que nunca termina.

% Parte III %
% La solución sería escribirlo así:
% menorOIgual(X, X) :- natural(X).
% menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
