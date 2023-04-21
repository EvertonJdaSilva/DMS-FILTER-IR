function [F] = Fonseca(x)
%
%   As described by C.M. Fonseca and P.J. Fleming in "Multiobjective
%   Optimization and Multiple Constraint Handling with Evolutionary
%   Algorithms–Part I: A Unified Formulation", in IEEE Transactions 
%   on Systems, Man, and Cybernetics—Part A: Systems and Humans, 
%   vol. 28, no. 1, January 1998.
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
f(1)   = 1-exp(-(x(1)-1)^2-(x(2)+1)^2);
f(2)   = 1-exp(-(x(1)+1)^2-(x(2)-1)^2);
F      = f';
%
% End of Fonseca.