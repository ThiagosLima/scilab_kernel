function rts=cubic_roots(ps)
// a0+ a1*x + a2x^2 + a3x^3  = 0
   a=coeff(ps);
   [a0, a1, a2, a3] = (a(1), a(2), a(3), a(4))
   D0 = a2^2-3*a3*a1;
   D1 = 2*a2^3-9*a3*a2*a1+27*a3^2*a0;
   C=((D1+sqrt(D1^2-4*D0^3))/2)^(1/3)
   if (C==0 | D0==0)  then // 3 raizes reais iguais
         rts(1:3)= -a2/(3*a3);
   else 
      w(1:3)=exp(%i*2*%pi/3*(1:3))'
      rts= -a2/(3*a3)-(C * w + D0/C./w)/(3*a3)
   end
   rts=clean(rts)
endfunction
