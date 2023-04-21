function [F] = FES3(x)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%
%   Example FES3, see the previous cited paper for the original reference.
%
%   In the above paper the number of variables was left undefined. 
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
Iaux   = (1:length(x))';
Iaux1  = (0:length(x)-1)';
f(1)   = sum(abs(x-exp((Iaux/length(x)).^2)/3).^0.5);
f(2)   = sum(abs(x-sin(Iaux1).^2.*cos(Iaux1).^2).^0.5);
f(3)   = sum(abs(x-0.25*cos(Iaux1).*cos(2*Iaux1)-0.5).^0.5);
f(4)   = sum((x-0.5*sin(1000*pi*Iaux/length(x))-0.5).^2);
F      = f';
%
% End of FES3.