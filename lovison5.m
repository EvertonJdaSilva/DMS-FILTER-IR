function [F] = lovison5(x)
%
%   As described by A. Lovison in "A synthetic approach to multiobjective
%   optimization", arxiv Item: http://arxiv.org/abs/1002.0093.
%
%   Example 5.
%
%   In the above paper/papers the variables bounds were not set.
%   We considered -1<=x[i]<=4, i=1,2,3.
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
%
C1 =[
 0.218418   -0.620254   0.843784;
 0.914311   -0.788548   0.428212;
 0.103064   -0.47373   -0.300792;]; 
%
alpha1 =[
 0.407247  0.665212  0.575807;   
 0.942022  0.363525  0.00308876; 
 0.755598  0.450103  0.170122;];
%
beta1 =[0.575496; 0.675617; 0.180332;];
%
gamma1 =[-0.593814; -0.492722; 0.0646786;];    
%
n = length(x);            % number of variables
m = 3;                    % number of function used in the objectives
C = C1(1:n,1:m);          %:=Uniform(-1,1); # distinct non collinear points
alpha  = alpha1(1:m,1:n); %:=Uniform(0,1) # negative definite matrix diagonal
beta   = beta1(1:m);      %:=Uniform(-1,1);
gamma  = gamma1(1:m);     %:=Uniform(-1,1);
%
for j=1:m
    ff(j) = sum(-alpha(j,:)*(x(:)-C(:,j)).^2);    
end
%
f(1) = -ff(1);
f(2) = -ff(2)-beta(2)*sin(pi*(x(1)+x(2))/gamma(2));
f(3) = -ff(3)-beta(3)*cos(pi*(x(1)-x(2))/gamma(3));
F    = f';
%
% End of lovison5.