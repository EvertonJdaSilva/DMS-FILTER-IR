function [C] = C1(x)
%
%   As described by N. Karmitsa, Test Problems for Large-Scale Nonsmooth
%   Minimization, Technical report No., B. 4/2007, Department of 
%   Mathematical Information Technology, University of Jyvaskyla,
%   Jyvaskyla, Finland, 2007.
%
%   Modification of Broyden tridiagonal constraint I - case 1
%
%   This file is part of a collection of problems developed for
%   derivative-free multiobjective optimization
%
% Written by E. J. Silva
%
% Version July 2021.
%
%
% Input:  
%
%         x (Point given by the optimizer.)
%
% Output: 
%
%         C (Vector storing the values of the functions c_j
%           defining the constraints at the given point.)
%
%
C = (3-2*x(2:length(x)-1)).*x(2:length(x)-1)-x(1:length(x)-2)-2*x(3:length(x))+1;
%
% End of C1.