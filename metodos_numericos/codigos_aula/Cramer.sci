function x=Cramer(A,b)
//Saída- x(N) com solução para A(N,N)*x(N)=b(N).
    [N N]=size(A);
    C=[A b];
    D=det(A)
    printf("Matriz Aumentada [C=A|b]\n")
    printf("det(A)=%f",D)
    disp(C)
    for(k=1:N)
        Ak=A;
        Ak(:,k)=b(:,1) //substitui coluna k por vetor b
        Dk=det(Ak)
        x(k)=Dk/D
        printf("Matriz A%d   det(A%1d)=%f\n",k,k,Dk)
        printf("x(%d)=%f/%f=%f",k,Dk,D,x(k))
        disp(Ak)
    end
    printf("x=")
    disp(x)
endfunction
