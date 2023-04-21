function [F] = WFG1(z)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%           
%   Example WFG1.
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
for i=1:n
   if i <=k
       t1(i)=y(i);
   else
       t1(i)= abs(y(i)-0.35)/abs(floor(0.35-y(i))+0.35);
   end
end

% second level mapping
AA = 0.8;
BB = 0.75;
CC = 0.85;
for i=1:n
   if i <=k
       t2(i)=t1(i);
   else
       t2(i)= AA+ min(0,floor(t1(i)-BB))*(AA*(BB-t1(i)))...
           /BB-min(0,floor(CC-t1(i)))*(1-AA)*(t1(i)-CC)/(1-CC);
   end
end

% third level mapping
AAA = 0.02;
t3 = t2.^AAA;

% forth level mapping
w=zmax;
for i=1:M
   if i <=M-1
        t4(i)=  sum(w(((i-1)*k/(M-1)+1):(i*k/(M-1))).*t3(((i-1)*k/(M-1)+1):...
            (i*k/(M-1))))/(sum(w(((i-1)*k/(M-1)+1):(i*k/(M-1))))); 
   else
       t4(i)= (sum(w(k+1:n).*t3(k+1:n)))/(sum(w(k+1:n)));
   end
end

% Define objective function variables
for i=1:M
   if i <=M-1
        x(i)= max(t4(M),A(i))*(t4(i)-0.5)+0.5;
   else
       x(i)= t4(M);
   end
end

% Define objective function function h
alpha =1;
AAAA  =5;
for m=1:M
   if  m==1
        h(m)= prod((1-cos(x(1:M-1)*pi/2)));
   else
       if m<=M-1
       h(m)= (prod((1-cos(x(1:M-m)*pi/2))))*(1-sin(x(M-m+1)*pi/2));
       else
         h(m)=(1-x(1)-(cos(2*AAAA*pi*x(1)+pi/2))/(2*AAAA*pi))^alpha;
       end
   end
end

% The objective functions
for m=1:M
f(m)   = x(M)+S(m)*h(m);
end
F      = f';
%
% End of WFG1.