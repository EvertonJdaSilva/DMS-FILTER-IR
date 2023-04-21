function [F] = TKLY1(x)
%
%   As described by Huband et al. in "A review of multiobjective test problems
%   and a scalable test problem toolkit", IEEE Transactions on Evolutionary 
%   Computing 10(5): 477-506, 2006.
%
%   Example TKLY1, see the previous cited paper for the original reference.
%
%   In the above paper the variables bounds were not set.
%   We considered -1<=x[i]<=5, i=1,2.
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
f(1)   = x(1);
f(2)   = (prod(2.0-exp(-((x(2:4)-0.1)/0.004).^2)-...
          0.8*exp(-((x(2:4)-0.9)/0.4).^2)))/x(1);
F      = f';
%
% End of TKLY1.