%Problema de Busqueda No Informada

sol(A):- siguiente(e(0,0,0,0,3,1,0,0,2),[e(0,0,0,0,3,1,0,0,2)],_,[], A),
          procesar(A).

procesar([]).
procesar([H|R]):- write(H), write(" "),
procesar(R).

%Verifica si es estado final
siguiente(e(0,0,0,1,2,3,0,0,0),V,V,A,A):- !.
%Busca el siguiente estado
siguiente(e(E,F,G,H,I,J,K,L,M),Lv,V,La,A):-
    accion(e(E,F,G,H,I,J,K,L,M),e(Es,Fs,Gs,Hs,Is,Js,Ks,Ls,Ms),Acc),
    not(pertenece(e(Es,Fs,Gs,Hs,Is,Js,Ks,Ls,Ms),Lv)),
    siguiente(e(Es,Fs,Gs,Hs,Is,Js,Ks,Ls,Ms),[e(Es,Fs,Gs,Hs,Is,Js,Ks,Ls,Ms)|Lv],V,[Acc|La],A).

pertenece(X,[X|_]).
pertenece(X,[_|Q]):- pertenece(X,Q).

%1) 3 lad izq 1
accion(e(E,F,G,H,I,J,K,L,M), e(E,F,I,H,G,J,K,L,M), 'a'):- G =:= 0, I =:= 3.
        %0,0,0,0,3,1,0,0,2     0,0,3,0,0,1,0,0,2
%2) 1 encima 2
accion(e(E,F,G,H,I,J,K,L,M), e(E,F,G,H,I,L,K,J,M), 'b'):- J =:= 1, L =:= 0.
        %0,0,3,0,0,1,0,0,2     0,0,3,0,0,0,0,1,2
%3) 3 lad izq 2
accion(e(E,F,G,H,I,J,K,L,M), e(E,F,J,H,I,G,K,L,M), 'c'):- G =:= 3, J =:= 0.
        %0,0,3,0,0,0,0,1,2     0,0,0,0,0,3,0,1,2
%4) 1 lad izq 3
accion(e(E,F,G,H,I,J,K,L,M), e(E,F,L,H,I,J,K,G,M), 'd'):- G =:= 0, L =:= 1.
        %0,0,0,0,0,3,0,1,2     0,0,1,0,0,3,0,0,2
%5) 2 sobre 3
accion(e(E,F,G,H,I,J,K,L,M), e(E,F,G,H,M,J,K,L,I), 'e'):- M =:= 2, I =:= 0.
        %0,0,1,0,0,3,0,0,2     0,0,1,0,2,3,0,0,0
%6) 1 sobre 2
accion(e(E,F,G,H,I,J,K,L,M), e(E,F,H,G,I,J,K,L,M), 'f'):- H =:= 0, G =:= 1.
        %0,0,1,0,2,3,0,0,0     0,0,0,1,2,3,0,0,0


