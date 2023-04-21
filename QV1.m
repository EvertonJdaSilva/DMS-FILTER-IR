function [F] = QV1(x)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%
%   Example QV1, see the previous cited paper for the original reference.
%
%   In the original reference the number of variables was n=16. 
%   We selected n=10 as default.
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
n = length(x);

f(1) = (sum(x(:).^2-10*cos(2*pi*x(:))+10)/n)^0.25;
f(2) = (sum((x(:)-1.5).^2-10*cos(2*pi*(x(:)-1.5))+10)/n)^0.25;
F    = f';
%
% End of QV1.