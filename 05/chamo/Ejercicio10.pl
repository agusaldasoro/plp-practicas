% Definir el predicado intercalar(L1, L2, L3), donde L3 es el resultado de intercalar uno a uno los elementos
% de las listas L1 y L2. Si una lista tiene longitud menor, entonces el resto de la lista más larga es pasado sin
% cambiar. Indicar la reversibilidad, es decir si es posible obtener L3 a partir de L1 y L2, y viceversa.
% Ejemplo: intercalar([a,b,c], [d,e], [a,d,b,e,c]).

intercalar(X, [], X).
intercalar([], X, X).
intercalar([X | XS], [Y | YS], [X, Y | ZS]) :- intercalar(XS, YS, ZS).

% intercalar(?L1, ?L2, ?L3): donde puede estar instanciado solo uno de los 3.
