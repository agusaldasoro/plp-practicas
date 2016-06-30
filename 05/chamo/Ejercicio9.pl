%intersección(+L1, +L2, -L3), tal que L3 es la intersección sin repeticiones de las listas L1 y L2, respetando
%en L3 el orden en que aparecen los elementos en L1.
interseccion([], _, []).
interseccion([X | XS], L2, [X | YS]) :- member(X, L2), interseccion(XS, L2, YS).
interseccion([X | XS], L2, YS) :- not(member(X, L2)), interseccion(XS, L2, YS).

% split(N, L, L1, L2), donde L1 tiene los N primeros elementos de L, y L2 el resto. Si L tiene menos de N
% elementos el predicado debe fallar.
% ¿Cuán reversible es este predicado? Es decir, ¿qué parámetros pueden estar indefinidos al momento de la invocación?
split(N , L, L1, L2) :- append(L1, L2, L), length(L1, N).
% split(+N, +L, ?L1, ?L2)

% borrar(+ListaOriginal, +X, -ListaSinXs), que elimina todas las ocurrencias de X de la lista ListaOriginal.
borrar([], _, []).
borrar([Z | XS], Z, YS) :- borrar(XS, Z, YS).
borrar([X | XS], Z, [X | YS]) :- Z \= X, borrar(XS, Z, YS).

%sacarDuplicados(+L1, -L2), que saca todos los elementos duplicados de la lista L1.
sacarDuplicados([], []).
sacarDuplicados([X | XS], [X | YS]) :- not(member(X, XS)), sacarDuplicados(XS, YS).
sacarDuplicados([X | XS], YS) :- member(X, XS), borrar(XS, X, ZS), sacarDuplicados(ZS, YS).

% reparto(+L, +N, -LListas) que tenga éxito si LListas es una lista de N listas (N ≥ 1) de cualquier
% longitud - incluso vacías - tales que al concatenarlas se obtiene la lista L.
reparto(X, 1, [X]) :- is_list(X).
reparto(L, N, [X | XS]) :- append(X, Y, L), H is N - 1, H > 0, reparto(Y, H, XS).

% repartoSinVacías(+L, -LListas) similar al anterior, pero ninguna de las listas de LListas puede ser
% vacía, y la longitud de LListas puede variar.
repartoSinVacias([], []).
repartoSinVacias(L, [X | XS]) :- append(X, Y, L), not_empty(X), repartoSinVacias(Y, XS).

% AUX %
not_empty(X) :- length(X, N), N > 0.
