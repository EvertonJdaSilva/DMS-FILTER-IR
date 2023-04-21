function [F] = MLF2(x)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%
%   Example MLF2, See the previous cited paper for the original reference.
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
%
y = 2*x;
f(1)   = -5+((x(1)^2+x(2)-11)^2+(x(1)+x(2)^2-7)^2)/200;
f(2)   = -5+((y(1)^2+y(2)-11)^2+(y(1)+y(2)^2-7)^2)/200;
F      = f';
%
% End of MLF2.