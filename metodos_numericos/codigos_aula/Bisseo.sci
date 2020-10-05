function Bisseção(f,a,b,tol)
// erro  - tolerância máxima para a raiz
// Saída - raiz da função f no intervalo [a,b].
// a - início do intervalo
// b - fim do intervalo
// deff ( 'y=f ( x )' , 'y=x^2-8*x+6' )
// Bisseção(f,0,1,1e-4)
    if (f(a)*f(b)>0) then
       printf("não há raiz no intervalo [%f,%f]]",a,b)
       return
    end
    printf ('i \ta\t\t\tb\t\t\tx1\t\t\terro\n')
    for (k=1:500)
        erro=abs(b-a)
        x1=(a+b)/2     // Bisseção
        printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',k,a,sign(f(a)),b,sign(f(b)),x1,sign(f(x1)),erro)
        if f(x1)*f(a) < 0 then
             b=x1
        else
             a=x1
        end
        if  erro<tol then
            raiz = x1
            break
        end
    end
    printf ( '\nraiz = %.10f após %i iterações',raiz,k)
endfunction

function Bisseção1(f,a,b,tol)
// erro linear |b-a| - tolerância máxima para a raiz
// Saída - raiz da função f no intervalo [a,b] com tolerância.
// deff ( 'y=f ( x )' , 'y=x^2-8*x+6' )
// Bisseção(f,0,1,1e-4)
    if (f(a)*f(b)>0) then
       printf("não há raiz no intervalo [%f,%f]]",a,b)
       return
    end
    printf ('i \ta\t\t\tb\t\t\tx1\t\t\terro\n')
    for (k=1:500)
        x1=(a+b)/2     // Bisseção
        erro=abs(b-a)
        printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',k,a,sign(f(a)),b,sign(f(b)),x1,sign(f(x1)),erro)
        if f(x1)*f(a) < 0 then
             b=x1
        else
             a=x1
        end
        if  erro<tol then
            raiz = round(10*x1/tol)*tol/10  // casas decimais de tol+1
            break
        end
    end
    printf ( '\napós %i iterações raiz com tolerância %.1e = ',k,tol)
    disp(raiz)
endfunction


function Bisseção2(f,a,b,tol)
// erro relativo |(x1-x0)/x1| - tolerância máxima para a raiz
// Saída - raiz da função f no intervalo [a,b] com tolerância tol.
// deff ( 'y=f ( x )' , 'y=x^2-8*x+6' )
// Bisseção(f,0,1,1e-4)
    if (f(a)*f(b)>0) then
       printf("não há raiz no intervalo [%f,%f]]",a,b)
       return
    end
    printf ('i \ta\t\t\tb\t\t\tx1\t\t\terro\n')
    x1=a;
    erro=  1;
    for (k=1:500)
        x0=x1
        x1=(a+b)/2     // Bisseção
        if(x1<>0) then
             erro =abs((x1-x0)/x1)
        end
        printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',k,a,sign(f(a)),b,sign(f(b)),x1,sign(f(x1)),erro)
        if f(x1)*f(a) < 0 then
             b=x1
        else
             a=x1
        end
        if  erro<tol then
            raiz = round(10*x1/tol)*tol/10  // casas decimais de tol+1
            break
        end
    end
    printf ( '\napós %i iterações raiz com tolerância %.1e = ',k,tol)
    disp(raiz)
endfunction
