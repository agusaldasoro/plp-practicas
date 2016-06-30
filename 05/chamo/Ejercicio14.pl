% Definir el predicado coprimos(-X,-Y), que genere uno a uno todos los pares de números naturales coprimos (es
% decir, cuyo máximo común divisor es 1), sin repetir resultados. Usar la función gcd del motor aritmético.

coprimos(X, Y) :- desde(2, X), between(2, X, Y), G is gcd(X, Y), G = 1.

desde(X, X).
desde(X, Y) :- N is X + 1, desde(N, Y).
