function [F] = WFG4(z)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%           
%   Example WFG4.
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
M = 3;
k = 4;
l = 4;
n = k+l;

for m=1:M
   S(m)=2*m;
end
for i=1:M-1
    A(i)=1;
end

% transform z into [0,1] set
for i=1:n
   zmax(i)=2*i;
   y(i) = z(i)/zmax(i);
end

% first level mapping
AA = 30;
BB = 10;
CC = 0.35;
for i=1:n
   t1(i)= (1+cos((4*AA+2)*pi*(0.5-abs(y(i)-CC)/(2*(floor(CC-y(i))+CC))))...
       +4*BB*(abs(y(i)-CC)/(2*(floor(CC-y(i))+CC)))^2)/(BB+2);
end

% second level mapping
w=ones(1,n);
for i=1:M
   if i <=M-1
       t2(i)=sum(w(((i-1)*k/(M-1)+1):(i*k/(M-1))).*...
           t1(((i-1)*k/(M-1)+1):(i*k/(M-1))))/...
           sum(w(((i-1)*k/(M-1)+1):(i*k/(M-1))));
   else
       t2(i)=sum(w(k+1:n).*t1(k+1:n))/sum(w(k+1:n));
   end
end

% Define objective function variables
for i=1:M
   if i <=M-1
        x(i)= max(t2(M),A(i))*(t2(i)-0.5)+0.5;
   else
       x(i)= t2(M);
   end
end

% Define objective function function h
for m=1:M
   if  m==1
        h(m)= prod(sin(x(1:M-1)*pi/2));
   else
       if m<=M-1
       h(m)= prod(sin(x(1:M-m)*pi/2))*cos(x(M-m+1)*pi/2);
       else
         h(m)= cos(x(1)*pi/2);
       end
   end
end

% The objective functions
for m=1:M
    f(m)   = x(M)+S(m)*h(m);
end
F      = f';
%
% End of WFG4.