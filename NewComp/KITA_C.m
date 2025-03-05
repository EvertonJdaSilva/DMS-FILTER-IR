function g = KITA_C(x)

 g = zeros(3,1);
 g(1) = 1/6*x(1)+x(2)-13/2;
 g(2) = 0.5*x(1)+x(2)-15/2;
 g(3) = 5*x(1)+x(2)-30;
end