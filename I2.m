function [F] = I2(x)
%
%   As described by Huband et al. in "A Scalable Multi-objective Test Problem
%   Toolkit", in C. A. Coello Coello et al. (Eds.): EMO 2005, LNCS 3410, 
%   pp. 280–295, 2005, Springer-Verlag Berlin Heidelberg 2005.
%
%   Example I2.
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
w(1:8) = 1;
AA = 0.98/49.98;
BB = 0.02;
CC = 50;
for i = 1:7
    r_sum(i) = 0;
    aux_rsum = 0;
    for j = i+1:8
        r_sum(i) = r_sum(i) + w(j)*x(j);
        aux_rsum = aux_rsum + w(j);
    end
    r_sum(i) = r_sum(i)/aux_rsum; 
end
%
for i = 1:7
    t1(i) = x(i)^(BB+(CC-BB)*(AA-(1-2*r_sum(i))*abs(floor(0.5-r_sum(i))+AA)));
end
t1(8) = x(8);
%        
t2(1:4) = t1(1:4);
t2(5:8) = abs(t1(5:8)-0.35)./abs(floor(0.35-t1(5:8))+0.35);        
%
t3(1)  = (w(1)*t2(1)+w(2)*t2(2))/(w(1)+w(2));
t3(2)  = (w(3)*t2(3)+w(4)*t2(4))/(w(3)+w(4));
t3(3)  = (w(5)*t2(5)+w(6)*t2(6)+w(7)*t2(7)+w(8)*t2(8))/(w(5)+w(6)+w(7)+w(8));
%
A(1:2) = 1;
xp(1)   = max(t3(3),A(1))*(t3(1)-0.5)+0.5;
xp(2)   = max(t3(3),A(2))*(t3(2)-0.5)+0.5;
xp(3)   = t3(3);
%
h(1) = sin(xp(1)*pi/2)*sin(xp(2)*pi/2);
h(2) = sin(xp(1)*pi/2)*cos(xp(2)*pi/2);
h(3) = cos(xp(1)*pi/2);
%
%
S(1:3) = 1;
f(1)   = xp(3)+S(1)*h(1);
f(2)   = xp(3)+S(2)*h(2);
f(3)   = xp(3)+S(3)*h(3);
F      = f';
%
% End of I2.