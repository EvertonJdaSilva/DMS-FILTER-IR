function max_ratio=perf(T,logplot)
%PERF    Performace profiles
%
% PERF(T,logplot)-- produces a performace profile as described in
%   Benchmarking optimization software with performance profiles,
%   E.D. Dolan and J.J. More', 
%   Mathematical Programming, 91 (2002), 201--213.
% Each column of the matrix T defines the performance data for a solver.
% Failures on a given problem are represented by a NaN.
% The optional argument logplot is used to produce a 
% log (base 2) performance plot.
%
% This function is based on the perl script of Liz Dolan.
%
% Jorge J. More', June 2004

if (nargin < 2) logplot = 0; end

colors  = ['m' 'b' 'g' 'c' 'y' 'k' 'r' 'b' 'r' 'g' 'c' 'k' 'y'];
lines   = strvcat(':', '-', '-.', '--', '-', '-', '-', ':', '-', '-.', '--', '-', '-', '-');
markers = ['x' '*' 's' 'd' 'v' '^' 'o' 'x' '*' 's' 'd' 'v' '^' 'o'];

[np,ns] = size(T);

% Minimal performance per solver

minperf = min(T,[],2);

% Compute ratios and divide by smallest element in each row.

r = zeros(np,ns);
for p = 1: np
%    if (minperf(p)<=0.001)
%        r(p,:) = (T(p,:)+1-minperf(p));
%    else
        r(p,:) = T(p,:)/minperf(p);
%    end
end

if (logplot) r = log2(r); end

% max_ratio = max(max(r));
max_ratio=max(r(find(~isinf(r))));

% Replace all NaN's with twice the max_ratio and sort.
r(find(isnan(r))) = 2*max_ratio;
r = sort(r);

% Replace all Infinite with twice the max_ratio and sort.
r(find(~isfinite(r))) = 2*max_ratio;
r = sort(r);


% Plot stair graphs with markers.

%clf; % comment for subplots
for s = 1: ns
 [xs,ys] = stairs(r(:,s),[1:np]/np);
 % option = ['-' colors(s) markers(s)];
 option = [lines(s,:) colors(s) markers(s)];
 

% %  % Ensure endpoints plotted correctly.
 if xs(1) >= 1 + sqrt(eps), xs = [1; xs(1); xs]; ys = [0; 0; ys]; end
 if xs(end) < max_ratio - sqrt(eps), xs = [xs;  max_ratio]; ys = [ys; ys(end)]; end

 plot(xs,ys,option,'MarkerSize',6,'LineWidth',2);
 hold on;
end


% Axis properties are set so that failures are not shown,
% but with the max_ratio data points shown. This highlights
% the "flatline" effect.

% max_ratio=max(r(find(~isinf(r))));

axis([ 0 0.99*max_ratio 0 1 ]);
%axis([ 0 5 0 1 ]);
%axis([ 0 500 0 1 ]);

% Legends and title should be added.



