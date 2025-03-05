function C = MW5_C(x)
%
%   As described by Z. Ma and Y. Wang, Evolutionary constrained
%   multiobjective optimization: Test suite construction and performance
%   comparisons. IEEE Transactions on Evolutionary Computation, 2019,
%   23(6): 972-986.
%
%   Problem MW5
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
m      = 2;
n      = length(x);
z      = zeros(n,1);
z(m:n) = x(m:n).^(n-m);
g1       = 1+sum(1-exp(-10*(z(m:n)-0.5-((m:n)-1)'/(2*n)).^2));
F      = zeros(m,1);
F(1)   = g1*x(1);
F(2)   = g1*sqrt(1 -(F(1)/g1).^2);
l1     = atan(F(2)/F(1));
l2     = 0.5*pi - 2*abs(l1-0.25*pi);
C      = zeros(3,1);
C(1)   = F(1).^2 + F(2).^2 - (1.7-0.2*sin(2*l1)).^2;
C(2)   = (1+0.5*sin(6*l2.^3)).^2 - F(1).^2 - F(2).^2;
C(3)   = (1-0.45*sin(6*l2.^3)).^2 - F(1).^2 - F(2).^2;

end