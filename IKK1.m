function [F] = IKK1(x)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%
%   Example IKK1, see the previous cited paper for the original reference.
%
%   This file is part of a collection of problems developed for
%   derivative-free multiobjective optimization in
%   A. L. Cust�dio, J. F. A. Madeira, A. I. F. Vaz, and L. N. Vicente,
%   Direct Multisearch for Multiobjective Optimization, 2010.
%
% Written by C. P. Br�s and A. L. Custodio
%
% Version June 2020.
%
%
% Input:  
%
%         x (Point given by the optimizer.)
%
% Output: 
%
%         F (Function value at the given point.)    
%
%
f(1)   = x(1)^2;
f(2)   = (x(1)-20)^2;
f(3)   = x(2)^2;
F      = f';
%
% End of IKK1.