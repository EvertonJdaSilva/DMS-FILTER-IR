function [F] = OKA2(x)
%
%   As described by T. Okabe, Y. Jin, M. Olhofer, and B. Sendhoff. "On test
%   functions for evolutionary multi-objective optimization.", Parallel
%   Problem Solving from Nature, VIII, LNCS 3242, Springer, pp.792-802,
%   September 2004.
%
%   Test function OKA2.
%
%   This file is part of a collection of problems developed for
%   derivative-free multiobjective optimization in
%   A. L. Custódio, J. F. A. Madeira, A. I. F. Vaz, and L. N. Vicente,
%   Direct Multisearch for Multiobjective Optimization, 2010.
%
% Written by C. P. Brás and A. L. Custodio
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
f(1) = x(1);
f(2) = 1-(x(1)+pi)^2/(4*pi^2)+abs(x(2)-5*cos(x(1)))^(1/3)+abs(x(3)...
       -5*sin(x(1)))^(1/3);
F    = f';
%
% End of OKA2.