concatenar(L1, [], L1).
concatenar([], L2, L2).
concatenar([X | XS], L2, [X | YS]) :- concatenar(XS, L2, YS).
