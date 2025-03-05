function C = MW3_C(x)
%
%   As described by Z. Ma and Y. Wang, Evolutionary constrained
%   multiobjective optimization: Test suite construction and performance
%   comparisons. IEEE Transactions on Evolutionary Computation, 2019,
%   23(6): 972-986.
%
%   Problem MW3
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
m  = 2;
n  = length(x);
z  = zeros(n,1);
g3 = 1+sum(2*(x(m:n)+(x(m-1:n-1)-0.5).^2-1).^2);

F(1) = x(1);
F(2) = g3.*(1 - F(1)./g3);
l    = sqrt(2)*F(2) - sqrt(2)*F(1);
C    = zeros(2,1);
C(1) = sum(F) - 1.05 - 0.45*sin(0.75*pi*l).^6;
C(2) = 0.85 - sum(F) + 0.3*sin(0.75*pi*l).^2;


end