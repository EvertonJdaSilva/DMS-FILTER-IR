function [F] = I4(x)
%
%   As described by Huband et al. in "A Scalable Multi-objective Test Problem
%   Toolkit", in C. A. Coello Coello et al. (Eds.): EMO 2005, LNCS 3410, 
%   pp. 280–295, 2005, Springer-Verlag Berlin Heidelberg 2005.
%
%   Example I4.
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
t1 = x;
t2(1:4) = t1(1:4);
t2(5:8) = abs(t1(5:8)-0.35)./abs(floor(0.35-t1(5:8))+0.35);
%
for i=1:2 
    t3(i) = 0;
    for ii = ((i-1)*2+1):(i*2)
        t3(i) = t3(i)+ t2(ii)+abs(t2(ii)-t2(((i-1)*2+1)+mod((ii-((i-1)*2+1)+1),((i*2)-((i-1)*2+1)+1))));
    end
    t3(i)=t3(i)/(((i*2)-((i-1)*2+1)+1)/2*(1+2*2-2));
end
t3(3) = 0;
for ii=5:8
    t3(3) = t3(3) + t2(ii);
    for jj = 0:2
        t3(3) = t3(3) + abs(t2(ii)-t2(5+mod((ii+jj-5+1),4)));
    end
end
t3(3) = t3(3)/(2*(1+2*4-2*2));      
%
A(1:2)  = 1;
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
% End of I4.