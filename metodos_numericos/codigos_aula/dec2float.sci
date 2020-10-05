function [e,a2]=dec2float(a,n,m)
    sinal = 0
    if (a<0) then sinal = 1 end
    Emin = -2^(n-1)  
    Emax = +2^(n-1)  
    E = floor(log2(abs(a)))
    if (E<Emin) then
        e= [sinal zeros(2:n+m)]
        a2=sign(a)*0
        printf("underflow\n")
    elseif (E>=Emax) then
        e= [sinal ones(1:n+m) ]
        a2 = float2dec(e,n,m) // a2 = maior decimal!
        printf("overflow\n")
    else
        expoente = dec2binario(E-Emin,n) 
        m_d= floor((abs(a)*2^(m-E-1))) //mantissa decimal
        mantissa = dec2binario(m_d,m);
        mantissa = mantissa(2:m)  // descarta o bit mais significativo
        e = [sinal expoente mantissa] // e = float binário
        a2 = float2dec(e,n,m) // a2 = decimal reconstituido
    end 
endfunction               
        
function [e,a2]=dec2float1(a,n,m)
    sinal = 0
    if (a<0) then sinal = 1 end
    Emin = -2^(n-1)  
    Emax = +2^(n-1)  
    E = floor(log2(abs(a)))
    if (E<Emin) then
        e= [sinal zeros(2:n+m)]
        a2=sign(a)*0
        printf("underflow\n")
    elseif (E>=Emax) then
        e= [sinal ones(1:n+m) ]
        a2 = float2dec(e,n,m) // a2 = maior decimal!
        printf("overflow\n")
    else
        expoente = dec2binario(E-Emin,n) 
        m_d= floor((abs(a)*2^(m-E-1))) //mantissa decimal
        mantissa = dec2binario(m_d,m);
        mantissa = mantissa(2:m)  // descarta o bit mais significativo
        e = [sinal expoente mantissa] // e = float binário
        printf("decimal original = %f\n",a)
        a2 = float2dec(e,n,m) // a2 = decimal reconstituido
    end 
    printfloat(e,n,m)
    printf("float  (%d,%d)    = %f\n",n,m,a2)
endfunction               
        
function a2=decimal2float2(a,m,n)  
    function a=float2dec(e,m,n)
      // Conversão de float para decimal
      sinal     = e(1)
      mantissa  = e(2:m)
      expoente  = e(m+1:n)
      Emin      = -2^(n-1)+1
      a_m = binario2dec([1 e(2:m)],m) // reconstitui o bit mais significativo
      a_e = binario2dec(e(m+1:m+n),n) + Emin
      a = (-1)^sinal * (a_m) * 2^(a_e-m)
    endfunction
  
    function a=binario2dec(b,n)
            p= 2^(n-1:-1:0);
            a= b*p';  // conversão do binário 'b' para decimal 'a'
    endfunction
    
    function b=dec2binario(a,n) 
      p= 2^(n-1:-1:0);
      r=int(a./p)
      b = rem(r,2) //conversão do decimal 'a' para o binário 'b'
    endfunction
      
    Emin = -2^(n-1)  
    Emax = 2^(n-1)  // 0000 0001 a 1111 1110 
    if (a>1) then
        E = int(log2(abs(a))) 
    else
        E = floor(log2(abs(a)))
    end
    E = floor(log2(abs(a)))
    
    if (E<Emin) then
        e=zeros(1:n+m)
        a2=sign(a)*0
        printf("underflow\n")
    elseif (E>=Emax) then
        e=ones(1:n+m)
        a2=sign(a)*2^(n+1)
        printf("overflow\n")
    else
        sinal = 0
        if (a<0) then sinal = 1 end
        expoente = dec2binario(E-Emin,n) 
        m_d= floor((abs(a)*2^(m-E-1))) //mantissa decimal
        mantissa = dec2binario(m_d,m);
        mantissa = mantissa(2:m)  // descarta o bit mais significativo
        e = [sinal mantissa expoente]
        
        printf("decimal original = %f\n",a)
        printf("float binário = [%1d] [",sinal)
        for (i=1:m-1) printf("%1d",mantissa(i)) end 
        printf("] [")
        for (i=1:n)  printf("%1d",expoente(i)) end
        printf("]\n")
        a2 = float2dec(e,m,n) // conversão do float e  para decimal a2
    end
    printf("decimal reconstituído = %f\n",a2) 
endfunction               
         function a=float2dec(e,n,m)  
      sinal     = e(1)
      expoente  = e(2:n+1)
      mantissa  = e(n+2:n+m)
      Emin      = -2^(n-1)
      a_e = binario2dec(expoente,n) + Emin +1
      a_m = binario2dec([1 mantissa],m) //  + 1 bit 
      a = (-1)^sinal * (a_m) * 2^(a_e-m)
 endfunction

 function a=float2dec1(e,n,m)  
      sinal     = e(1)
      expoente  = e(2:n+1)
      mantissa  = e(n+2:n+m)
      Emin      = -2^(n-1)
      a_e = binario2dec(expoente,n) + Emin +1
      a_m = binario2dec([1 mantissa],m) //  + 1 bit 
      a = (-1)^sinal * (a_m) * 2^(a_e-m)
      printfloat(e,n,m)
      printf("float (%d,%d) = %10f\n",n,m,a) 
 endfunction
