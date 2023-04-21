function [F] = Kursawe(x)
%
%   As described by F. Kursawe in "A variant of evolution strategies for
%   vector optimization", in H. P. Schwefel and R. Männer, editors, Parallel 
%   Problem Solving from Nature, 1st Workshop, PPSN I, volume 496 of Lecture 
%   Notes in Computer Science, pages 193-197, Berlin, Germany, Oct 1991, 
%   Springer-Verlag.
%
%   In the above paper the variables bounds were not set.
%   We considered -5.0 <= x[i] <= 5.0, i=1,2,3.
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
f(1)   = sum(-10*exp(-0.2*sqrt(x(1:2).^2+x(2:3).^2)));
f(2)   = sum(abs(x).^0.8+5*sin(x).^3);
F      = f';
%
% End of Kursawe.