function [F] = DTLZ1n2(x)
%
%   As described by K. Deb, L. Thiele, M. Laumanns and E. Zitzler in "Scalable
%   Multi-Objective Optimization Test Problems", Congress on Evolutionary 
%   Computation (CEC’2002): 825-830, 2002.
%
%   Example DTLZ1 with M=2 and n=2.
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
gx   = 100*(1 + ((x(2)-0.5).^2-cos(20*pi*(x(2)-0.5))));
f(1) = 0.5*(1+gx)*x(1);
f(2) = 0.5*(1-x(1))*(1+gx);
F    = f';
%
% End of DTLZ1n2.