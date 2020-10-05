function Bisseção(f,a,b,tol)
    if (f(a)*f(b)>0) then
       printf("não há raiz no intervalo [%f,%f]]",a,b)
       return
    end
    printf ('i \ta\t\t\tx1\t\t\tb\t\t\terro\n')
    for (k=1:500)
        erro=abs(b-a)
        x1=(a+b)/2     // Bisseção
        printf ("%d\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n",...
        k,a,sign(f(a)),x1,sign(f(x1)),b,sign(f(b)),erro)
        if  ( (erro<tol) | (f(x1)==0) )  break  end
        if f(x1)*f(a) < 0 
             b=x1
        else
             a=x1
        end   
    end
    printf ("\nraiz = %.10f(%2d) após %i iterações",x1,sign(f(x1)),k)
endfunction

function Bisseção2(f,a,b,tol)
    if (f(a)*f(b)>0) then
       printf("não há raiz no intervalo [%f,%f]]",a,b)
       return
    end
    printf ('i \ta\t\t\tx1\t\t\tb\t\t\terro\n')
    x1=a;
    erro=  1;
    for (k=1:500)
        x0=x1
        x1=(a+b)/2     // Bisseção
        if(x1<>0)  erro =abs((x1-x0)/x1)  end
        printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',k,...
        a,sign(f(a)),x1,sign(f(x1)),b,sign(f(b)),erro)
        if  ( (erro<tol) | (f(x1)==0) )  break  end
        if f(x1)*f(a) < 0 then
             b=x1
        else
             a=x1
        end
    end
    printf ("\nraiz = %.10f(%2d) após %i iterações",x1,sign(f(x1)),k)
endfunction

function FalsaPosição(f,a,b,tol)
    if (f(a)*f(b)>0) then
       printf("não há raiz no intervalo [%f,%f]]",a,b)
       return
    end
    printf ('i \ta\t\t\tx1\t\t\tb\t\t\terro\n')
    x1=a;
    erro=  1;
    for (k=1:500)
        x0=x1
        x1=(a*f(b)-b*f(a))/(f(b)-f(a))  // Falsa Posição  ( Bisseção x1=(a+b)/2 )
        if(x1<>0)  erro =abs((x1-x0)/x1)  end
        printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',...
        k,a,sign(f(a)),x1,sign(f(x1)),b,sign(f(b)),erro)
        if  ( (erro<tol) | (f(x1)==0) )  break  end
        if f(x1)*f(a) < 0 then
             b=x1
        else
             a=x1
        end
    end
    printf ("\nraiz = %.10f(%2d) após %i iterações",x1,sign(f(x1)),k)
endfunction

function FalsaPosiçãoModificado(f,a,b,tol)
    if (f(a)*f(b)>0) then
       printf("não há raiz no intervalo [%f,%f]]",a,b)
       return
    end
    printf ('i \ta\t\t\tx1\t\t\tb\t\t\terro\n')
    x1=a; 
    fa = f(a);
    fb = f(b); 
    na=0; 
    nb=0; 
    for(k=1:500)
        x0=x1;
        x1=(a*fb-b*fa)/(fb-fa) // falsa posição modificado
        fx1 = f(x1)
        if(x1<>0)  erro =abs((x1-x0)/x1)  end
        printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',...
        k,a,sign(f(a)),x1,sign(f(x1)),b,sign(f(b)),erro)
        if  ( (erro<tol) | (f(x1)==0) )  break  end
        if fx1*fa < 0 then
            b=x1
            fb = fx1;
            nb=0;
            na=na+1
            if (na>=2)  fa = fa/2;  end
        else
            a=x1;
            fa = fx1;
            na=0;
            nb=nb+1
            if (nb>=2)  fb = fb/2;   end;
        end
    end
    printf ("\nraiz = %.10f(%2d) após %i iterações",x1,sign(f(x1)),k)
endfunction

function Bisseção3(f,a,b,tol)
    if (f(a)*f(b)>0) then
       printf("Escolha outro intervalo pois f(a) e f(b) possuem o mesmo sinal")
       return
    end
    n=ceil(log((b-a)/tol)/log(2))
    printf("Previsão de %d iterações\n",n)
    printf ('i \ta\t\t\tx1\t\t\tb\t\t\terro\n')
    for (k=1:n)
        x1=(a+b)/2    // Bisseção
        printf ("%d\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n",...
        k,a,sign(f(a)),x1,sign(f(x1)),b,sign(f(b)),abs(b-a))
        if  ( f(x1)==0 )  break  end
        if f(x1)*f(a) < 0 
             b=x1
        else
             a=x1
        end   
    end
    printf ("\nraiz = %.10f(%2d) após %i iterações",x1,sign(f(x1)),k)
endfunction

function Multisseção(f,a,b,tol,N)
    if (f(a)*f(b)>0) then
       printf("não há raiz no intervalo [%f,%f]]",a,b)
       return
    end
    n=ceil(log((b-a)/tol)/log(N))
    printf("Previsão de %d iterações\n",n)
    printf ('i \ta\t\t\tb\t\t\tx1\t\t\terro\n')
    for (k=1:n)
        x=linspace(a,b,N)
        fx1 = f(x)
        [f_min,index]=min(abs(fx1))
        erro=abs(b-a)/(N-1)
        printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',...
        k,a,sign(f(a)),b,sign(f(b)),x(index),sign(f(x(index))),erro)
        if  (f(x(index))==0)  break  end 
        if f(x(index))*f(x(index+1)) < 0 
             a=x(index)
             b=x(index+1)
        else
             a=x(index-1)
             b=x(index)  
        end
    end
    printf ( '\nraiz = %.10f após %i iterações',x(index),k)
endfunction
