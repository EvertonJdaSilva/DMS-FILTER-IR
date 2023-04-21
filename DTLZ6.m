function [F] = DTLZ6(x)
%
%   As described by K. Deb, L. Thiele, M. Laumanns and E. Zitzler in "Scalable
%   Multi-Objective Optimization Test Problems", Congress on Evolutionary 
%   Computation (CEC’2002): 825-830, 2002.
%
%   Example DTLZ6.
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
gx    = 1 + 9/20 * sum(x(3:22));
ffM   = (1+gx) * (3 - x(1)/(1+gx)*(1+sin(3*pi*x(1)))- x(2)/(1+gx)*(1+sin(3*pi*x(2))));
f(1)  = x(1);
f(2)  = x(2);
f(3)  = ffM;
F     = f';
%
% End of DTLZ6.