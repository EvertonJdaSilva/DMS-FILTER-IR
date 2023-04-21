function [F] = WFG2(z)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%           
%   Example WFG2.
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
AA = 2;
for i=1:k+l/2
   if i <=k
       t2(i)=t1(i);
   else
       t2(i)=0;
       for ii=(k+2*(i-k)-1):(k+2*(i-k))
           aux=t1(ii);
           for jj=0:AA-2
               aux= aux+abs(t1(ii)-t1((k+2*(i-k)-1)+ mod(ii+jj-((k+2*(i-k)-1)+1),(k+2*(i-k)-(k+2*(i-k)-1)+1))));
           end
           t2(i)=t2(i)+aux;
       end
       t2(i)=t2(i)/((k+2*(i-k)-(k+2*(i-k)-1)+1)/AA*ceil(AA/2)*(1+2*AA-2*ceil(AA/2)));
   end
end

% third level mapping
w=ones(1,n);
for i=1:M
   if i <=M-1
        t3(i)=  sum(w(((i-1)*k/(M-1)+1):(i*k/(M-1))).*t2(((i-1)*k/(M-1)+1):(i*k/(M-1))))/...
            sum(w(((i-1)*k/(M-1)+1):(i*k/(M-1))));
   else
       t3(i)= (sum(w(k+1:k+l/2).*t2(k+1:k+l/2)))/(sum(w(k+1:k+l/2)));
   end
end

% Define objective function variables
for i=1:M
   if i <=M-1
        x(i)= max(t3(M),A(i))*(t3(i)-0.5)+0.5;
   else
       x(i)= t3(M);
   end
end

% Define objective function function h
alpha =1;
beta  =1;
AAAA  =5;
for m=1:M
   if  m==1
        h(m)= prod((1-cos(x(1:M-1)*pi/2)));
   else
       if m<=M-1
       h(m)= (prod((1-cos(x(1:M-m)*pi/2))))*(1-sin(x(M-m+1)*pi/2));
       else
         h(m)= 1-(x(1))^alpha*cos(AAAA*(x(1))^beta*pi)^2;
       end
   end
end

% The objective functions
for m=1:M
f(m)   = x(M)+S(m)*h(m);
end
F      = f';
%
% End of WFG2.