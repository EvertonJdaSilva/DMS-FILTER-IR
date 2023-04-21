function [F] = ex005(x)
%
% Original AMPL coding by Sven Leyffer, Argonne Natl. Lab.
%
% A simple multi-objective optimization problem (p. 281):
% C.-L. Hwang & A. S. Md. Masud, Multiple Objective
% Decision Making - Methods and Applications, No. 164 in 
% Lecture Notes in Economics and Mathematical Systems,
% Springer, 1979.
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
f(1)   = x(1)^2 - x(2)^2;
f(2)   = x(1)/x(2);
F      = f';
%
% End of ex005.