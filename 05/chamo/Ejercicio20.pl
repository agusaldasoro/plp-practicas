% Definir el predicado corteMásParejo(+L,-L1,-L2) que, dada una lista de números, realiza el corte más parejo
% posible con respecto a la suma de sus elementos (puede haber más de un resultado). Por ejemplo:
% ?- corteMásParejo([1,2,3,4,2],L1,L2). → L1 = [1, 2, 3], L2 = [4, 2] ; false.
% ?- corteMásParejo([1,2,1],L1,L2). → L1 = [1], L2 = [2, 1] ; L1 = [1, 2], L2 = [1] ; false.
corteMasParejo(L, L1, L2) :- append(L1, L2, L), not(existeCorteMasParejo(L, L1, L2)).

existeCorteMasParejo(L, L1, L2) :- append(L3, L4, L), diffSums(L1, L2, D), diffSums(L3, L4, D2), D2 < D.

diffSums(L1, L2, N) :- sum_list(L1, N1), sum_list(L2, N2), D is N2 - N1, N is abs(D).
