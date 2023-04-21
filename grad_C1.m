function [grad_C1] = grad_C1(x)
%
%   Gradient of the function Modification of Broyden tridiagonal constraint
%   I - case 1, as described by N. Karmitsa, Test Problems for Large-Scale
%   Nonsmooth Minimization, Technical report No., B. 4/2007, Department of 
%   Mathematical Information Technology, University of Jyvaskyla,
%   Jyvaskyla, Finland, 2007.
%
%
%   This file is part of a collection of problems developed for
%   derivative-free multiobjective optimization
%
% Written by E. J. Silva
%
% Version January 2022.
%
%
% Input:  
%
%         x (Point given by the optimizer.)
%
% Output: 
%
%         grad_C1 (Matrix storing columnwise the gradients of the functions
%                 c_j defining the constraints at the given point.)
%
%
n       = length(x);
p       = n-2;
grad_C1 = zeros(n,p);
for j=1:p
    grad_C1(j,j)   = -1;
    grad_C1(j+1,j) = 3-4*x(j+1);
    grad_C1(j+2,j) = -2;
end
%
% End of grad_C1.