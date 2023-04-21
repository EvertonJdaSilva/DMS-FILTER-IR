function [F] = SK1(x)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%
%   Example SK1, see the previous cited paper for the original reference.
%   Function f2 differs in the original and in the cited references. The herein 
%   codification follows the original reference.
%
%   In the above paper/papers the variables bounds were not set.
%   We considered -10<=x<=10.
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
%
f(1)   = x^4+3*x^3-10*x^2-10*x-10;
f(2)   = -0.5*x^4-2*x^3-10*x^2+10*x-5;
F      = f';
%
% End of SK1.