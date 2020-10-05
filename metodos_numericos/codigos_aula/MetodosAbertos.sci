function PontoFixo(f,x1,tol)
// erro  - tolerância máxima para x1
// Saída - x1 raíz da função f.
// x0 solução inicial para a raíz de f
    deff ( ' y=g ( x ) ' , ' y=f(x)+x' )   
    erro = 1;
    printf ( '%i\t%.10f\t%.1e\n',1,x1,erro)
    for (k=1:500)
        x0=x1
        x1 = g(x0);
        if(x1<>0) then
             erro =abs((x1-x0)/x1)
        end
               printf ( '%i\t%.10f\t%.1e\n',k,x1,erro)
        if  erro<tol then
            raiz = round(10*x1/tol)*tol/10  // casas decimais de tol+1
            break
        end
    end
    printf ( '\napós %i iterações raiz com tolerância %.1e = ',k,tol)
    disp(raiz)
endfunction

function NewtonRaphson(f,x1,tol)
// tol- tolerância máxima para a raiz
// x1 - estimativa inicial para a raiz
// Saída - raiz da função f com tolerância tol.
// deff ( 'y=f ( x )' , 'y=x^2-8*x+6' )
// NewtonRaphson(f,0,1e-4)
    iter = 0;
    erro = 1;
    printf ( '%i\t%.10f\t%.1e\n',1,x1,erro)
    for (k=2:500)
        x0=x1
        f0=feval(x0,f)
        df0=numderivative(f,x0)
        x1 = x0 - f0/df0
        if(x1<>0) then
             erro =abs((x1-x0)/x1)
        end
       printf ( '%i\t%.10f\t%.1e\n',k,x1,erro)
        if  erro<tol then
            raiz = round(10*x1/tol)*tol/10  // casas decimais de tol+1
            break
        end
    end
    printf ( '\napós %i iterações raiz com tolerância %.1e = ',k,tol)
    disp(raiz)
endfunction

function x=NewtonRaphson2(f,x1,p,tol)
// tol- tolerância máxima para a raiz
// x1 - estimativa inicial para a raiz
//  p - multiplicidade da raiz
// Saída - x vetor com k estimativas para raiz até tolerância tol.
// deff ( 'y=f ( x )' , 'y=x^2-8*x+6' )
// NewtonRaphson(f,0,1e-4)
    iter = 0;
    erro = 1;
    printf ( '%i\t%.10f\t%.1e\n',1,x1,erro)
    x(1)=x1
    for (k=2:500)
        x0=x1
        f0=feval(x0,f)
        df0=numderivative(f,x0)
        x1 = x0 - p*f0/df0
        x(k)=x1
        if(x1<>0) then
             erro =abs((x1-x0)/x1)
        end
       printf ( '%i\t%.10f\t%.1e\n',k,x1,erro)
        if  erro<tol then
            raiz = round(10*x1/tol)*tol/10  // casas decimais de tol+1
            break
        end
    end
    printf ( '\napós %i iterações raiz com tolerância %.1e = ',k,tol)
    disp(raiz)
endfunction

function Secante(f,x1,x2,tol)
// erro  - tolerância máxima para x1
// Saída - x1 raíz da função f.
// x1 solução inicial para a raíz de f
// x2 segunda solução para a raíz de f
    iter = 0;
    erro = 1;
    printf ( '%i\t%.10f\t%.1e\n',1,x1,erro)
    for(k=1:500)
        x0=x1;
        x1=x2;    
        f0=feval(x0,f)
        f1=feval(x1,f)
        df_x1 = (f1-f0)/(x1-x0);
        x2 = x1 - f(x1)/df_x1;
        if(x2<>0) then
             erro =abs((x2-x1)/x2)
        end
        printf ( '%i\t%.10f\t%.1e\n',k,x1,erro)
        if  erro<tol then
            raiz = round(10*x2/tol)*tol/10  // casas decimais de tol+1
            break
        end
    end
    printf ( '\napós %i iterações raiz com tolerância %.1e = ',k,tol)
    disp(raiz)
endfunction

function SecanteModificado(f,x1,dx,tol)
// erro  - tolerância máxima para x1
// Saída - x1 raíz da função f.
// x1 solução inicial para a raíz de f
    iter = 0;
    erro = 1;
    if(dx==0) 
          then disp("dx deve ser diferente de zero")
          return
    end
    printf ( '%i\t%.10f\t%.1e\n',1,x1,erro)
    for (k=2:500)
        x0=x1
        f0=feval(x0,f)
        f0_dx=feval(x0+dx,f)
        df0=(f0_dx-f0) /dx  // Secante Modificado
        x1 = x0 - f0/df0
        if(x1<>0) then
             erro =abs((x1-x0)/x1)
        end
       printf ( '%i\t%.10f\t%.1e\n',k,x1,erro)
        if  erro<tol then
            raiz = round(10*x1/tol)*tol/10  // casas decimais de tol+1
            break
        end
    end
    printf ( '\napós %i iterações raiz com tolerância %.1e = ',k,tol)
    disp(raiz)
endfunction
