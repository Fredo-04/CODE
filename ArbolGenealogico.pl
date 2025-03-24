hombre(fredy).
hombre(davidyo).
hombre(adri).
hombre(luis).
hombre(beto).

hombre(angel).
hombre(roberto).

hombre(joel).
hombre(elias).
hombre(diego).
hombre(abid).
hombre(angelito).

mujer(paty).
mujer(faustina).
mujer(glenda).

mujer(yola).
mujer(mary).
mujer(areli).

mujer(luz).
mujer(loana).


casados(fredy,paty). casados(luis,faustina).  casados(beto,glenda).
casados(angel,mary). casados(roberto,yola).

es_papa_de(luis,fredy). es_papa_de(luis,mary). es_papa_de(luis,yola).
es_papa_de(beto,paty). es_papa_de(beto,areli).
es_papa_de(fredy,davidyo). es_papa_de(fredy,adri).
es_papa_de(angel,luz). es_papa_de(angel,angelito).
es_papa_de(roberto,joel). es_papa_de(roberto,elias). es_papa_de(roberto,diego).

es_mama_de(faustina,fredy). es_mama_de(faustina,mary). es_mama_de(faustina,yola).
es_mama_de(glenda,paty). es_mama_de(glenda,areli).
es_mama_de(paty,davidyo). es_mama_de(paty,adri).
es_mama_de(mary,luz). es_mama_de(mary,angelito).
es_mama_de(yola,joel). es_mama_de(yola,elias). es_mama_de(yola,diego).
es_mama_de(areli,abid). es_mama_de(areli,loana).

es_hijo_de(X,Y) :- hombre(X), (es_papa_de(Y,X);es_mama_de(Y,X)).
es_hija_de(X,Y) :- mujer(X), (es_papa_de(Y,X);es_mama_de(Y,X)).

es_hermano_de(X,Y) :- hombre(X), es_papa_de(Z,X), es_papa_de(Z,Y), X \= Y,
    write(X), write(' y '), write(Y), write(' son hermanos.').
es_hermano_de(X,Y) :- hombre(X), es_mama_de(Z,X), es_mama_de(Z,Y), X \= Y,
    write(X), write(' y '), write(Y), write(' son hermanos.').

es_hermana_de(X,Y) :- mujer(X), es_papa_de(Z,X), es_papa_de(Z,Y), X \= Y,
    write(X), write(' y '), write(Y), write(' son hermanos.').
es_hermana_de(X,Y) :- mujer(X), es_mama_de(Z,X), es_mama_de(Z,Y), X \= Y,
    write(X), write(' y '), write(Y), write(' son hermanos.').

es_abuelo_de(X, Y) :- hombre(X), es_papa_de(X, Z),
    (es_papa_de(Z, Y); es_mama_de(Z, Y)).
es_abuela_de(X, Y) :- mujer(X), es_mama_de(X, Z),
    (es_papa_de(Z, Y); es_mama_de(Z, Y)).

es_tio_de(X, Y) :- hombre(X), es_papa_de(Z, Y),
    (es_hermano_de(X, Z); es_hermano_de(X, Z)).
es_tia_de(X, Y) :- mujer(X), es_papa_de(Z, Y),
    (es_hermana_de(X, Z); es_hermana_de(X, Z)).

es_primo_de(X, Y) :-
    hombre(X),
    es_papa_de(P1, X), es_papa_de(P2, Y), es_hermano_de(P1, P2).
es_primo_de(X, Y) :-
    hombre(X),
    es_mama_de(M1, X), es_mama_de(M2, Y), es_hermana_de(M1, M2).
es_primo_de(X, Y) :-
    hombre(X),
    es_papa_de(P1, X), es_mama_de(M2, Y), es_hermano_de(P1, M2).
es_primo_de(X, Y) :-
    hombre(X),
    es_mama_de(M1, X), es_papa_de(P2, Y), es_hermana_de(M1, P2).

es_prima_de(X, Y) :-
    mujer(X),
    es_papa_de(P1, X), es_papa_de(P2, Y), es_hermano_de(P1, P2).
es_prima_de(X, Y) :-
    mujer(X),
    es_mama_de(M1, X), es_mama_de(M2, Y), es_hermana_de(M1, M2).
es_prima_de(X, Y) :-
    mujer(X),
    es_papa_de(P1, X), es_mama_de(M2, Y), es_hermano_de(P1, M2).
es_prima_de(X, Y) :-
    mujer(X),
    es_mama_de(M1, X), es_papa_de(P2, Y), es_hermana_de(M1, P2).
