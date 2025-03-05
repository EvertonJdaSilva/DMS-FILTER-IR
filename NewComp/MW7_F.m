function F = MW7_F(x)
%
%   As described by Z. Ma and Y. Wang, Evolutionary constrained
%   multiobjective optimization: Test suite construction and performance
%   comparisons. IEEE Transactions on Evolutionary Computation, 2019,
%   23(6): 972-986.
%
%   Problem MW7
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
m    = 2;
n    = length(x);
g3   = 1+sum(2*(x(m:n)+(x(m-1:n-1)-0.5).^2-1).^2);
F    = zeros(m,1);
F(1) = g3.*x(1);
F(2) = g3.*sqrt(1 - (F(1)/g3).^2);
l           = atan(F(2)./F(1));
PopCon(:,1) = F(1).^2 + F(2).^2 - (1.2+0.4*sin(4*l).^16).^2;
PopCon(:,2) = (1.15-0.2*sin(4*l).^8).^2 - F(1).^2 - F(2).^2;

end