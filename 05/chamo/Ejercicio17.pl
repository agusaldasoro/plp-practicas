% En este ejercicio trabajaremos con triángulos. La expresión tri(A,B,C) denotará el triángulo cuyos lados tienen
% longitudes A, B y C respectivamente. Se asume que las longitudes de los lados son siempre números naturales.
% Implementar los siguientes predicados:

% i. esTriángulo(+T) que, dada una estructura de la forma tri(A,B,C), indique si es un triángulo válido.
% En un triángulo válido, cada lado es menor que la suma de los otros dos, y mayor que su diferencia (y
% obviamente mayor que 0).
% Sugerencia: para evitar repetir código, escriba un predicado auxiliar esCompatible(+A,+B,+C), que verifique que el lado A
% cumpla las condiciones necesarias en relación a B y C. Opcionalmente puede ser esCompatible(?A,+B,+C).

esTriangulo(tri(A, B, C)) :- esCompatible(A, B, C), esCompatible(B, A, C), esCompatible(C, A, B).

esCompatible(A, B, C) :- A > 0, A < B + C, A >= B - C.

% ii. perímetro(?T,?P), que es verdadero cuando T es un triángulo (válido) y P es su perímetro. No
% se deben generar resultados repetidos (no tendremos en cuenta la congruencia entre triángulos: si
% dos triángulos tienen las mismas longitudes, pero en diferente orden, se considerarán diferentes entre sí).
% El predicado debe funcionar para cualquier instanciación de T y P (ambas instanciadas, ambas
% sin instanciar, una instanciada y una no; no es necesario que funcione para triángulos parcialmente
% instanciados), debe generar todos los resultados válidos (sean finitos o infinitos), y no debe colgarse
% (es decir, no debe seguir ejecutando infinitamente sin producir nuevos resultados). Por ejemplo:
% ?- perímetro(tri(3,4,5),12). → true.
% ?- perímetro(T,5). → T = tri(1, 2, 2) ; T = tri(2, 1, 2) ; T = tri(2, 2, 1) ; false.
% ?- perímetro(tri(2,2,2),P). → P = 6.
% ?- perímetro(T,P). → T = tri(1, 1, 1), P = 3 ; T = tri(1, 2, 2), P = 5 ; . . .

perimetro(tri(A, B, C), P) :- definido(tri(A, B, C)), esTriangulo(tri(A, B, C)), P is A + B + C.
perimetro(tri(A, B, C), P) :- var(P), nodefinido(tri(A, B, C)), desde(1, P), perimetro(tri(A, B, C), P).
perimetro(tri(A, B, C), P) :- nonvar(P), nodefinido(tri(A, B, C)), between(1, P, A), between(1, P, B), between(1, P, C), P is A + B + C, esTriangulo(tri(A, B, C)).

definido(tri(A, B, C)) :- nonvar(A), nonvar(B), nonvar(C).
nodefinido(tri(A, _, _)) :- var(A). %No importan parcialmente instanciados

% iii. triángulo(-T), que genera todos los triángulos válidos, sin repetir resultados.
triangulo(T) :- perimetro(tri(A, B, C), P), T = tri(A, B, C).

desde(X, X).
desde(X, Y) :- N is X + 1, desde(N, Y).
