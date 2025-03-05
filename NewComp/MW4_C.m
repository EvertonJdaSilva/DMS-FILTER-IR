function C = MW4_C(x)
%
%   As described by Z. Ma and Y. Wang, Evolutionary constrained
%   multiobjective optimization: Test suite construction and performance
%   comparisons. IEEE Transactions on Evolutionary Computation, 2019,
%   23(6): 972-986.
%
%   Problem MW4
%
%
% Written by E. J. Silva
%
% Version January 2025.
%
%
% Input:  
%
%         x (Point given by the optimizer.)
%
% Output: 
%
%         C (Vector storing the values of the constraints functions g_i)
%
m        = 3;
k        = 2:m-1;
n        = length(x);
z        = zeros(n,1);
z(m:n)   = x(m:n).^(n-m);
g1       = 1+sum(1-exp(-10*(z(m:n)-0.5-((m:n)-1)'/(2*n)).^2));
F        = zeros(m,1);
F(1)     = g1*prod(1-x(1:m-1));
F(2:m-1) = g1*x(m-k+1)+prod(1:m-k);
F(m)     = g1*x(1);
l        = F(end) - sum(F(1:(end-1)));
C        = sum(F) - (1 + 0.4*sin(2.5*pi*l).^8);

end