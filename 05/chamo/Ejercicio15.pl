% Un cuadrado semi-latino es una matriz cuadrada de naturales (incluido el cero) donde todas las filas de la matriz
% suman lo mismo. Por ejemplo:
% 1 3 0
% 2 2 0 todas las filas suman 4
% 1 1 2
% Representamos la matriz como una lista de filas, donde cada fila es una lista de naturales. El ejemplo anterior
% se representaría de la siguiente manera: [[1,3,0],[2,2,0],[1,1,2]].
% Se pide definir el predicado cuadradoSemiLatino(+N, -XS). El predicado debe ir devolviendo matrices (utilizando
% la representación antes mencionada), que sean cuadrados semi-latinos de dimensión N*N. Dichas matrices
% deben devolverse de manera ordenada: primero aquellas cuyas filas suman 0, luego 1, luego 2, etc..

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

desde(X, X).
desde(X, Y) :- N is X + 1, desde(N, Y).
