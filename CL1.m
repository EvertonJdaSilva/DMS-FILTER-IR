function [F] = CL1(x)
%
%   As described by F.Y. Cheng and X.S. Li, "Generalized center method for
%   multiobjective engineering optimization", Engineering Optimization,31:5,
%   641-661, 1999.
%
%   Example 2, four bar truss.
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
Faux  =  10;
E     = 2*10^5;
L     = 200;
sigma = 10;
%
f(1)   = L*(2*x(1)+sqrt(2)*x(2)+sqrt(x(3))+x(4));
f(2)   = Faux*L/E*(2/x(1)+(2*sqrt(2))/x(2)-(2*sqrt(2))/x(3)+2/x(4));
F      = f';
%
% End of CL1.