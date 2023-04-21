function [grad_C6] = grad_C6(x)
%
%   Gradient of the function Modification of P20 from UFO collection II
%   as described by N. Karmitsa, Test Problems for Large-Scale Nonsmooth
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
%         grad_C6 (Matrix storing columnwise the gradients of the functions
%                 c_j defining the constraints at the given point.)
%
%
n = length(x);
grad_C6(1,1)     = -1;
grad_C6(2,1)     = 2-x(2);
grad_C6(3:n-2,1) = -x(3:n-2);
grad_C6(n-1,1)   = 1-x(n-1);
grad_C6(n,1)     = -2;
%
% End of grad_C6.