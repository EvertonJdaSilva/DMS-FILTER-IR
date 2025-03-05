function f = GE4_F(x)

f = zeros(3,1);
f(1) = -x(1);
f(2) = -x(2);
f(3) = -x(3).^2;

end