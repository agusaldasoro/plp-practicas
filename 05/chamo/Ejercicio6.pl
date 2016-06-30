prefijo(P, L) :- append(P, _, L).

aplanar([], []).
aplanar([X | XS], [X | YS]) :- not(is_list(X)), aplanar(XS, YS).
aplanar([X | XS], YS) :- is_list(X), aplanar(X, Y), append(Y, ZS, YS), aplanar(XS, ZS).
