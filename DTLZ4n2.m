function [F] = DTLZ4n2(x)
%
%   As described by K. Deb, L. Thiele, M. Laumanns and E. Zitzler in "Scalable
%   Multi-Objective Optimization Test Problems", Congress on Evolutionary 
%   Computation (CEC�2002): 825-830, 2002.
%
%   Example DTLZ4 with M=2 and n=2.
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
y    = x.^100;
gx   = (y(2)-0.5)^2;
f(1) = (1+gx)*cos(0.5*pi*y(1));
f(2) = (1+gx)*sin(0.5*pi*y(1));
F    = f';
%
% End of DTLZ4n2.