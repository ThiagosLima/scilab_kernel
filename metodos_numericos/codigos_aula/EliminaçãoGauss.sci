function x=EliminaçãoGauss(A,b)
    [N N]=size(A); //Saída- x(N) com solução para A(N,N)*x(N)=b(N).
    C=[A b];
    printf("Matriz Aumentada [C=A|b]")
    disp(C)
    for p=1:N-1
        [max_linha_p,index]=max(abs(C(p:N,p)));  // pivotamento
        if(index<>1) then  
            printf("Trocando linhas %d e %d",p,index+p-1)
            C([ p, (index+p-1)],:) = C([ (index+p-1) , p ],:) //troca linhas
            disp(C)
        end
        pivot=C(p,p)
        if pivot==0 then  
           printf("Não há solução única pois matriz A é singular")
           return
        end 
        printf("Eliminando coluna %d com Pivô %f\n",p,pivot)
        for lin=p+1:N   //eliminação progressiva
            printf("(L%d)=(L%d)-(%f)/(%f)*L(%d)",lin,lin,C(lin,p),pivot,p)
            m=C(lin,p)/pivot;
            C(lin,p:N+1)=C(lin,p:N+1)-m*C(p,p:N+1);
            if lin<N then printf("\n") end
        end
        disp(C)
     end
     printf("Substituição regressiva");
     x(N)=C(N,N+1)/C(N,N);
     for lin=N-1:-1:1
          x(lin)=(C(lin,N+1)-C(lin,lin+1:N)*x(lin+1:N))/C(lin,lin);
     end
     disp(x)
endfunction

function x=EliminaçãoGauss1(A,b)
//Saída- x(N) com solução para A(N,N)*x(N)=b(N).
    [N N]=size(A); 
    C=[A b];
    printf("Matriz Aumentada [C=A|b]")
    disp(C)
    for p=1:N-1
        pivot=C(p,p)
        if pivot==0 then  
           printf("Não é possível continuar eliminação pois pivot=0")
           return
        end 
        printf("Eliminando coluna %d com Pivô %f\n",p,pivot)
        for lin=p+1:N   //eliminação progressiva
            printf("(L%d)=(L%d)-(%f)/(%f)*L(%d)",lin,lin,C(lin,p),pivot,p)
            m=C(lin,p)/pivot;
            C(lin,p:N+1)=C(lin,p:N+1)-m*C(p,p:N+1);
            if lin<N then printf("\n") end
        end
        disp(C)
     end
     printf("Substituição regressiva");
     x(N)=C(N,N+1)/C(N,N);
     for lin=N-1:-1:1
          x(lin)=(C(lin,N+1)-C(lin,lin+1:N)*x(lin+1:N))/C(lin,lin);
     end
     disp(x)
endfunction

function x=EliminaçãoGauss2(A,b)
    [N N]=size(A); 
    C=[A b];
    for p=1:N-1
        pivot=C(p,p)
        if pivot==0 then  
           printf("Não é possível continuar eliminação pois pivot=0")
           return
        end 
        for lin=p+1:N 
            m=C(lin,p)/pivot;
            C(lin,p:N+1)=C(lin,p:N+1)-m*C(p,p:N+1);
        end
     end
     x(N)=C(N,N+1)/C(N,N);
     for lin=N-1:-1:1
          x(lin)=(C(lin,N+1)-C(lin,lin+1:N)*x(lin+1:N))/C(lin,lin);
     end
endfunction

