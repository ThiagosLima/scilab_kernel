function a=binario2dec(b,n)
    p= 2^(n-1:-1:0);
    a= b*p';  // bin 'b' para dec 'a'
endfunction

function a=binario2dec1(b,n)
   // b binario INTEIRO E POSITIVO
    p= 2^(n-1:-1:0);
    a= b*p';  // decimal 'a'
endfunction

function a=binario2dec2(b,n)
  // b INTEIRO POSITIVO OU NEGATIVO 
  // com 1 BIT PARA SINAL
   p= 2^(n-2:-1:0);
   a2= (-1)^b(1)* b(2:n)*p';  
 endfunction
    
function a=binario2dec3(b_c2,n)
   // b INTEIRO POSITIVO OU NEGATIVO
   // com COMPLEMENTO 2  
    b=b_c2
    if(b(1)==1) then   //complemento 2  
        b=bitcmp(b_c2,1)   // inverter bits
        b=SomaBinaria(b,[zeros(1:n-1) 1]) // somar 1
    end
    p= 2^(n-1:-1:0);
    a= (-1)^b_c2(1) * (b*p');  
endfunction

function a=binario2dec4(b,n,m)
   // b para decimal REAL POSITIVO
   p= 2^(n-1:-1:-m);
   a= b*p';  // de 'b' para decimal 'a'
endfunction
