% Parte I %
% last(?L, ?U), donde U es el último elemento de la lista L.
last([U], U).
last([_ | LS], U) :- last(LS, U).

% Parte II %
% reverse(+L, -L1),  donde L1 contiene los mismos elementos que L, pero en orden inverso.
reverse([X], [X]).
reverse([X | XS], Y) :- reverse(XS, Z), append(Z, [X], Y).

% Parte III %
% máxlista(+L, -M) y mínlista(+L, -M), donde M es el máximo/mínimo de la lista L.

maxlista([X], X).
maxlista([X | XS], Y) :- maxlista(XS, Z), Y is max(X, Z).

minlista([X], X).
minlista([X | XS], Y) :- minlista(XS, Z), Y is min(X, Z).

% Parte IV %
% prefijo(?P, +L), donde P es prefijo de la lista L.
prefijo(P, L) :- append(P, _, L).

% Parte V %
% sufijo(?S, +L), donde S es sufijo de la lista L.
sufijo(S, L) :- append(_, S, L).

% Parte VI %
% sublista(?S, +L), donde S es sublista de L.
sublista(S, L) :- prefijo(P, L), sufijo(S, P).

% Parte VII %
% pertenece(?X, +L), que es verdadero sii el elemento X se encuentra en la lista L
pertenece(X, L) :- sublista([X], L).
