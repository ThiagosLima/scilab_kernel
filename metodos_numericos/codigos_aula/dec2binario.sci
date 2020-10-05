function b=dec2binario(a,n) 
   p= 2^(n-1:-1:0);
   r=int(a./p)
   b = rem(r,2) //dec 'a' para o bin'b'
endfunction
    

function b=dec2binario1(a,n) 
  // Conversão de decimal INTEIRO E POSITIVO para binário 
  b=[]
  if(a>(2^n)-1) then
      printf("%d não pode ser reprentado com %d bits",a,n)
      return
  end
  if(a<0) then
      printf("Utilize inteiros positivos\n")
      return
  end
  p= 2^(n-1:-1:0);
  r=int(a./p)
  b = rem(r,2) //conversão do decimal 'a' para o binário 'b'
  s=""
  for i=1:n
    s=s+string(b(i))
  end
  printf("%f (B10) = %s (B2)\n",a,s)
  a2=binario2dec1(b,n)
  printf("%s (B2) = %f (B10)\n",s,a2)
endfunction
    
    
function b=dec2binario2(a,n) 
  // Conversão de decimal INTEIRO POSITIVO OU NEGATIVO para binário
  // com 1 BIT PARA SINAL
  b=[]
  if(  a<(-2^(n-1)-1) |  a>(2^(n-1)-1)  ) then
      printf("%d não pode ser reprentado com %d bits",a,n)
      return
  end
  p= 2^(n-2:-1:0);
  r=int(abs(a)./p)
  b = rem(r,2) //conversão do decimal 'a' para o binário 'b' com n-1 bits
  if (a>=0) then
     b=[0 b] // acrescentar o bit de sinal
  else
     b=[1 b] // acrescentar o bit de sinal
  end
  s=""
  for i=1:n
    s=s+string(b(i))
  end
  printf("%f (B10) = %s (B2)\n",a,s)
  //a2= (-1)^b(1)* b(2:n)*p';  // conversão do binário 'b' para decimal 'a2'
  a2=binario2dec2(b,n)
  printf("%s (B2) = %f (B10)\n",s,a2)
endfunction
    
    
function b_c2=dec2binario3(a,n) 
    // Conversão de decimal INTEIRO POSITIVO OU NEGATIVO para binário
    // com COMPLEMENTO 2  -  Inverter bits e somar 1
  b=[]
  if(  a<(-2^(n-1)) |  a>(2^(n-1)-1)  ) then
      printf("%d não pode ser reprentado com %d bits",a,n)
      return
  end
  p= 2^(n-1:-1:0);
  r=int(abs(a)./p)
  b = rem(r,2) //conversão do decimal 'a' para o binário 'b' com n bits
  b_c2=b
  if(a<0) then   //complemento 2  
      b_c2=bitcmp(b,1)   // inverter bits
      b_c2=SomaBinaria(b_c2,[zeros(1:n-1) 1])  // somar 1
  end
  s=""
  for i=1:n
    s=s+string(b_c2(i))
  end
  printf("%f (B10) = %s (B2)\n",a,s)
  a2=binario2dec3(b_c2) // conversão do binário b_ce para decimal a2
  printf("%s (B2) = %f (B10)\n",s,a2)
endfunction

function b_c2=dec2binario3b(a,n) 
    // Conversão decimal INTEIRO POSITIVO OU NEGATIVO para binário
    // com COMPLEMENTO 2  -  Inverter bits e somar 1
  if(  a<(-2^(n-1)) |  a>(2^(n-1)-1)  ) then
      printf("%d não pode ser reprentado com %d bits",a,n)
      return
  end
  p= 2^(n-1:-1:0);
  r=int(abs(a)./p)
  b = rem(r,2) //conversão do decimal 'a' para o binário 'b' com n bits
  b_c2=b
  if(a<0) then   //complemento 2  
      b_c2=bitcmp(b,1)   // inverter bits
      b_c2=SomaBinaria(b_c2,[zeros(1:n-1) 1])  // somar 1
  end
  s=""
  for i=1:n
    s=s+string(b_c2(i))
  end
  printf("%f (B10) = %s (B2)\n",a,s)
  a2= b(1:n)*p';  // conversão do binário b para decimal a2
  if (a<0)   then a2= -a2;  end
  printf("%s (B2) = %f (B10)\n",s,a2)
endfunction

function b_c2=dec2binario3c(a,n) 
  b=[]
  p= 2^(n-1:-1:0);
  r=int(abs(a)./p)
  b = rem(r,2) //conversão do decimal 'a' para o binário 'b' com n bits
  b_c2=b
  if(a<0) then   //complemento 2  
      b_c2=bitcmp(b,1)   // inverter bits
      b_c2=SomaBinaria(b_c2,[zeros(1:n-1) 1])  // somar 1
  end
endfunction


function b=dec2binario4(a,n,m) 
  // Conversão decimal REAL E POSITIVO para binário 
  // n bits para a parte inteira
  // m bits para a parte fracionária
  b=[]
  if(a>(2^n)-1) then
      printf("%d não pode ser reprentado com %d bits",a,n)
      return
  end
  p= 2^(n-1:-1:-m);
  r=int(a./p)
  b = rem(r,2) //conversão do decimal 'a' para o binário 'b'
  s=""
  for i=1:n
    s=s+string(b(i))
  end
  s=s+"."
  for i=n+1:m+n
    s=s+string(b(i))
  end
  printf("%f (B10) = %s (B2)\n",a,s)
  a2=binario2dec4(b,n,m)  // conversão do binário 'b' para decimal 'a2'
  printf("%s (B2) = %f (B10)\n",s,a2)
endfunction
    
    
function b=dec2binario5(a,n)  // ANTIGO DEC2BINARIO3(A,N)
    // Conversão decimal INTEIRO POSITIVO OU NEGATIVO para binário
    // com COMPLEMENTO 2  (Calculando o complemento 2 na Base 10)
  if(  a<(-2^(n-1)) |  a>(2^(n-1)-1)  ) then
      printf("%d não pode ser reprentado com %d bits",a,n)
      return
  end
  a_c2=a
  if (a<0) then
     a_c2= 2^n + a   // complemento 2 na base 10
  end
  p= 2^(n-1:-1:0);
  r=int(abs(a_c2)./p)
  b = rem(r,2) //conversão do decimal a para o binário b
  s=""
  for i=1:n
    s=s+string(b(i))
  end
  printf("%f (B10) = %s (B2)\n",a,s)
  a2= b(1:n)*p';  // conversão do binário b para decimal a2
  if (a2>2^(n-1)) then a2= a2-2^n;  end
  printf("%s (B2) = %f (B10)\n",s,a2)
endfunction
    
    function b=SomaBinaria(b1,b2)
    // Soma de números binários  b=b1+b2
    if (length(b1)<>length(b2)) then
        disp("b1 e b2 devem ter o mesmo número de bits")
        return
    end
    n=length(b1)
    v1=0
    for(k=n:-1:1)
        b(1,k)=b1(k)+b2(k)+v1
        v1=0
        if b(k)==2 then
            b(k)=0
            v1=1
        elseif b(k)==3 then
            b(k)=1
            v1=1   
        end
    end
endfunction


