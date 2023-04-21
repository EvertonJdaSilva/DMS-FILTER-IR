function [grad_C3] = grad_C3(x)
%
%   Gradient of the function Simple modification of MAD1 II - case 1 as 
%   described by N. Karmitsa, Test Problems for Large-Scale Nonsmooth
%   Minimization, Technical report No., B. 4/2007, Department of 
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
%         grad_C3 (Matrix storing columnwise the gradients of the functions
%                 c_j defining the constraints at the given point.)
%
%
n       = length(x);
p       = n-1;
grad_C3 = zeros(n,p);
for j=1:p
    grad_C3(j,j)   = 2*x(j)+x(j+1)-2;
    grad_C3(j+1,j) = 2*x(j+1)+x(j)-2;
end
%
% End of grad_C3.