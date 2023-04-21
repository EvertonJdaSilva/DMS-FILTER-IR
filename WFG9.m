function [F] = WFG9(z)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%           
%   Example WFG9.
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
w=ones(1,n);
AA = 0.98/49.98;
BB = 0.02;
CC = 50;
for i=1:n-1
    r_sum(i)= sum(w(i+1:n).*y(i+1:n))/sum(w(i+1:n));
end
for i=1:n
    if i<=n-1
      t1(i)=y(i)^(BB+(CC-BB)*(AA-(1-2*r_sum(i))*abs(floor(0.5-r_sum(i))+AA)));    
    else       
     t1(i)=y(i);   
    end
end

% second level mapping
AAA = 0.35;
BBB = 0.001;
CCC = 0.05;
AAAA = 30;
BBBB = 95;
CCCC = 0.35;
for i=1:n
   if i <=k
       t2(i)=1+(abs(t1(i)-AAA)-BBB)*((floor(t1(i)-AAA+BBB)*...
           (1-CCC+(AAA-BBB)/BBB))/(AAA-BBB)+(floor(AAA+BBB-t1(i))*...
           (1-CCC+(1-AAA-BBB)/BBB))/(1-AAA-BBB)+1/BBB);
   else
       t2(i)=(1+cos((4*AAAA+2)*pi*(0.5-abs(t1(i)-CCCC)/(2*(floor(CCCC-...
           t1(i))+CCCC))))+4*BBBB*(abs(t1(i)-CCCC)/(2*(floor(CCCC-t1(i))+...
           CCCC)))^2)/(BBBB+2);
   end
end

% third level mapping
for i=1:M
   if i <=M-1
       t3(i)=0;
       for ii=((i-1)*k/(M-1)+1):(i*k/(M-1))
           aux=t2(ii);
           for jj=0:(k/(M-1)-2)
               aux= aux+abs(t2(ii)-t2(((i-1)*k/(M-1)+1)+ mod(ii+jj-(((i-1)*k/(M-1)+1)+1),((i*k/(M-1))-((i-1)*k/(M-1)+1)+1))));
           end
           t3(i)=t3(i)+aux;
       end
       t3(i)=t3(i)/(((i*k/(M-1))-((i-1)*k/(M-1)+1)+1)/(k/(M-1))*ceil(k/(M-1)/2)*(1+2*k/(M-1)-2*ceil(k/(M-1)/2)));
   else
       t3(i)=0;
       for ii=k+1:n
           aux=t2(ii);
           for jj=0:(l-2)
               aux= aux+abs(t2(ii)-t2(k+1+ mod((ii+jj-(k+1)+1),(n-k))));
           end
           t3(i)=t3(i)+aux;
       end
       t3(i)=t3(i)/(((n-k)/l)*ceil(l/2)*(1+2*l-2*ceil(l/2)));
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
% End of WFG9.