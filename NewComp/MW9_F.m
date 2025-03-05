function F = MW9_F(x)
%
%   As described by Z. Ma and Y. Wang, Evolutionary constrained
%   multiobjective optimization: Test suite construction and performance
%   comparisons. IEEE Transactions on Evolutionary Computation, 2019,
%   23(6): 972-986.
%
%   Problem MW9
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
m      = 2;
n      = length(x);
z      = zeros(n,1);
z(m:n) = x(m:n).^(n-m);
g1       = 1+sum(1-exp(-10*(z(m:n)-0.5-((m:n)-1)'/(2*n)).^2));
F      = zeros(m,1);
F(1)   = g1*x(1);
F(2)   = g1*(1 - (F(1)/g1).^0.6);


end