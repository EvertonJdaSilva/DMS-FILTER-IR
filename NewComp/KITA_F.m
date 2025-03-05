function f = KITA_F(x)

 f = zeros(2,1);
 f(1) = x(1).^2-x(2);
 f(2) = -0.5*x(1)-x(2)-1;
 
end