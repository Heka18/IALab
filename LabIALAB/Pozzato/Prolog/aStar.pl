heuristic(stazione(_,X1,Y1),stazione(_,X2,Y2),Res):- %usata la distanza di manhattan
    X is abs(X1-X2), Y is abs(Y1-Y2), Res is X+Y.

collegata(Stazione,_):- percorso(_,0,P), member(Stazione,P).


expand(S,[Azione|ListaAzioni],Visitati):-


  collegata(Name,_), \+member(Name, ListaNodiAperti),
  expand(stazione(Name,_,_),[Name|ListaNodiAperti]).



ric_a_star(Nodo):- finale(Nodo).
ric_a_star(Nodo):-
  espandi_nodo(Nodo,ListaNodi), %e aggiungere nodi a lista (nodi nuovi e vecchi)
  scegli_nodo([Nodi]), % restituisce NodoNuovo
  ric_a_star(NodoNuovo).
