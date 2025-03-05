function F = MW14_F(x)
%
%   As described by Z. Ma and Y. Wang, Evolutionary constrained
%   multiobjective optimization: Test suite construction and performance
%   comparisons. IEEE Transactions on Evolutionary Computation, 2019,
%   23(6): 972-986.
%
%   Problem MW14
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
%         F (Vector storing the values of the objective functions f_l)
%

m        = 3;
n        = length(x);
g3       = 1+sum(2*(x(m:n)+(x(m-1:n-1)-0.5).^2-1).^2);
F        = zeros(m,1);
F(1:m-1) = x(1:m-1);
F(m)     = g3/(m-1)*sum(6 - exp(F(1:m-1)) - 1.5*sin(1.1*pi*F(1:m-1).^2));
end