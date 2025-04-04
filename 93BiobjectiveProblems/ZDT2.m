function [F] = ZDT2(x)
%
%   As described by E. Zitzler, K. Deb, and L. Thiele in "Comparison of
%   Multiobjective Evolutionary Algorithms: Empirical Results", Evolutionary 
%   Computation 8(2): 173-195, 2000.
%
%   Example T2.
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
n = length(x);
ff1    = x(1);
gx     = 1 + 9/(n-1)*sum(x(2:n));
h      = 1-(ff1/gx)^2;
%
f(1) = ff1;
f(2) = gx*h;
F    = f';
%
% End of ZDT2.