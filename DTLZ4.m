function [F] = DTLZ4(x)
%
%   As described by K. Deb, L. Thiele, M. Laumanns and E. Zitzler in "Scalable
%   Multi-Objective Optimization Test Problems", Congress on Evolutionary 
%   Computation (CEC’2002): 825-830, 2002.
%
%   Example DTLZ4.
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
y    = x.^100; 
gx   = sum((y(3:12)-0.5).^2);
f(1) = (1+gx)*cos(0.5*pi*y(1))*cos(0.5*pi*y(2));
f(2) = (1+gx)*cos(0.5*pi*y(1))*sin(0.5*pi*y(2));
f(3) = (1+gx)*sin(0.5*pi*y(1));
F    = f';
%
% End of DTLZ4.