x       = ones(30,1);
grad_C  = grad_C1(x);
[n1,n2] = size(grad_C);
d       = linsolve(grad_C',zeros(n1,1));