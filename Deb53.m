function [F] = Deb53(x)
%
%   As described by K. Deb in "Multi-objective Genetic Algorithms: Problem
%   Difficulties and Construction of Test Problems", Evolutionary Computation 
%   7(3): 205-230, 1999.
%
%   Example 5.1.3 (Non-uniformly Represented Pareto-optimal Front).
%
%   In the above paper the variables bounds were not set.
%   We considered 0.0 <= x[i] <= 1.0, i=1,2. The function f1 corresponds
%   to equation (16) and gx to equation (10).
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
beta  = 1;
alpha = 4;
%
ff1 = 1-exp(-4*x(1))*sin(5*pi*x(1))^4;
%
if (x(2)<=0.4) 
    gx = 4-3*exp(-((x(2)-0.2)/0.02)^2);
else
    gx = 4-2*exp(-((x(2)-0.7)/0.2)^2);
end
%
if (ff1<beta*gx)
    h = (1-(ff1/(beta*gx))^alpha);
else
    h = 0;
end
%
f(1)   = ff1;
f(2)   = gx*h;
F      = f';
%
% End of Deb53.