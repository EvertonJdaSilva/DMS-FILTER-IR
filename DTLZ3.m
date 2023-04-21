function [F] = DTLZ3(x)
%
%   As described by K. Deb, L. Thiele, M. Laumanns and E. Zitzler in "Scalable
%   Multi-Objective Optimization Test Problems", Congress on Evolutionary 
%   Computation (CEC’2002): 825-830, 2002.
%
%   Example DTLZ3.
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
gx   = 100*(10 + sum((x(3:12)-0.5).^2-cos(20*pi*(x(3:12)-0.5))));
f(1) = (1+gx)*cos(0.5*pi*x(1))*cos(0.5*pi*x(2));
f(2) = (1+gx)*cos(0.5*pi*x(1))*sin(0.5*pi*x(2));
f(3) = (1+gx)*sin(0.5*pi*x(1));
F    = f';
%
% End of DTLZ3.