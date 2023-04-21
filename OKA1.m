function [F] = OKA1(x)
%
%   As described by T. Okabe, Y. Jin, M. Olhofer, and B. Sendhoff. "On test
%   functions for evolutionary multi-objective optimization.", Parallel
%   Problem Solving from Nature, VIII, LNCS 3242, Springer, pp.792-802,
%   September 2004.
%
%   Test function OKA1.
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
y(1) = cos(pi/12)*x(1)-sin(pi/12)*x(2);
y(2) =sin(pi/12)*x(1)+cos(pi/12)*x(2); 
%
f(1) = y(1);
f(2) = sqrt(2*pi)-sqrt(abs(y(1)))+2*abs(y(2)-3*cos(y(1))-3)^(1/3);
F    = f';
%
% End of OKA1.