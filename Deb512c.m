function [F] = Deb512c(x)
%
%   As described by K. Deb in "Multi-objective Genetic Algorithms: Problem
%   Difficulties and Construction of Test Problems", Evolutionary Computation 
%   7(3): 205-230, 1999.
%              
%   Example 5.1.2 (Non-convex local and convex global Pareto-optimal Front).
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
beta = 1;
%
ff1 = 4*x(1);
if (x(2)<=0.4) 
    gx = 4-3*exp(-((x(2)-0.2)/0.02)^2);
else
    gx = 4-2*exp(-((x(2)-0.7)/0.2)^2);
end
%
alpha = 0.25+3.75*(gx-1);
%
if (ff1<=beta*gx) 
    h = (1-(ff1/(beta*gx))^alpha);
else
    h = 0;
end
%
f(1)   = ff1;
f(2)   = gx*h;
F      = f';
%
% End of Deb512c.