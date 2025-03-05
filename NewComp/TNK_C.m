function C = TNK_C(x)

if x(2)==0
    g(1) = inf;
else
    g(1) = -x(1).^2-x(2).^2+1+0.1*cos(16*atan(x(1)/x(2)));
end
g(2) = (x(1)-0.5).^2 + (x(2)-0.5).^2-0.5;


C = g';
end