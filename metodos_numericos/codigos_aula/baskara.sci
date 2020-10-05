function [r1,r2]=baskara(ps);
    a = coeff(ps); //a(1)+a(2)*x+a(3)*x^2= 0
    delta=a(2)^2-4*a(3)*a(1);
    r1=(-a(2) + sqrt(delta))/(2*a(3))
    r2=(-a(2) - sqrt(delta))/(2*a(3))
 endfunction
