function [F] = Deb513(x)
%
%   As described by K. Deb in "Multi-objective Genetic Algorithms: Problem
%   Difficulties and Construction of Test Problems", Evolutionary Computation 
%   7(3): 205-230, 1999.
%
%   Example 5.1.3 (Discontinuous Pareto-optimal Front).
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
alpha = 2;
q     = 4;
%
ff1 = x(1);
gx  = 1+10*x(2);
h   = 1-(ff1/gx)^alpha-(ff1/gx)*sin(2*pi*q*ff1);
%
f(1)   = ff1;
f(2)   = gx*h;
F      = f';
%
% End of Deb513.