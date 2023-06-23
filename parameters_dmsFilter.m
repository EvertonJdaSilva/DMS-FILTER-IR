% parameters_dms.m script file
%
% Purpose:
%
% File parameters_dms sets the algorithmic strategies, parameters,
% constants, and tolerances values to be used by the function dms, 
% which can be user modified.
%
% DMS Version x
%
% Copyright (C) 2011 A. L. Custódio, J. F. A. Madeira, A. I. F. Vaz, 
% and L. N. Vicente.
%
% http://www.mat.uc.pt/dms
%
% This library is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This library is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public
% License along with this library; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output Options.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
output = 0; % 0-2 variable: 0 if only a final report is displayed at the 
            % screen; 1 if at each iteration output is displayed at the
            % screen and recorded in a text file stored at the current directory. 
            % If solving a biobjective problem, a plot of the approximated 
            % Pareto frontier computed will also be displayed and stored in 
            % a jpg format in the current directory; 2 level of output similar
            % to 1, but additionally at each iteration the current approximation
            % to the Pareto front is recorded in a file;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stopping Criteria.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
stop_alfa = 1;     % 0-1 variable: 1 if the stopping criterion is based
                   % on the step size parameter; 0 otherwise.
tol_stop  = 10^-3; % Lowest value allowed for the step size parameter.
%
stop_feval = 1;     % 0-1 variable: 1 if the stopping criterion is based
                    % on a maximum number of function evaluations; 0
                    % otherwise.
max_fevals = 500; % Maximum number of function evaluations allowed.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algorithmic Options.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Initialization.
%
list = 3;   % 0-4 variable: 0 if the algorithm initializes the iterate
            % list with a single point; 1 if a latin hypercube sampling
            % strategy is considered for initialization; 2 if 
            % random sampling is used; 3 if points are considered 
            % equally spaced in the line segment, joining the 
            % variable upper and lower bounds; 4 if the algorithm is
            % initialized with a list provided by the optimizer;
%
user_list_size = 0;  % 0-1 variable: 1 if the user sets below the iterate 
                     % list initial size; 0 if the iterate list initial size
                     % equals the problem dimension.
%                     
nPini = 30; % Number of points to consider in the iterate
            % list initialization, when its size is defined 
            % by the user.            
%
% Cache Use.
%
load_cache = 0; % 0-1 variable: 1 if a previous saved cache should be loaded
                % for use; 0 otherwise.
%
cache = 1; % 0-1 variable: 0 if point evaluation is always done;
           % 1 if a cache is maintained.
%
tol_match = tol_stop; % Tolerance used in point comparisons, when 
                      % considering a cache.
%
save_cache = 0; % 0-2 variable: 1 if at the end of all iterations,
                % the current cache is saved on a file for posterior use;
                % 2 if cache is saved at the end of each iteration;
                % 0 otherwise. 
%
% List ordering.
%
spread_option = 1; % 0-2 variable: 1 if for each point in the current approximation
                   % to the Pareto frontier, each component of the objective 
                   % function is projected in the corresponding dimension and 
                   % points are ordered according to the largest gap between 
                   % consecutive points, just before polling; 2 if points are 
                   % ordered according to the largest gap between consecutive 
                   % points in the current approximation to the Pareto frontier,
                   % measured using Euclidean distance. Each point has only one 
                   % consecutive point lying in the approximation to the Pareto 
                   % frontier (the closest one); 0 if no ordering strategy is 
                   % considered.
%
% Directions and step size.
%
dir_dense  = 0;    % 0-5 variable: 1 if a dense set of directions should be 
                   % considered for polling, 2 a dense set of direction as 
                   % it done in MADS; 3 or 4 if directions conforming the 
                   % boundary relative to the epsilon-active constraints,
                   % 3: GSS_LST and 4: GSS_ABDP, 5: dense generation 
                   % using sobol sequences; 0 otherwise.
%
alfa_ini  = 1;     % Initial step size. 
%
Llist_ini = 0;     % Initial mesh index.
%
beta_par  = 0.5;   % Coefficient for step size contraction.
% 
gamma_par = 1;     % Coefficient for step size expansion.
%
%% Filter parameters
dms_filter_par = 1;   % 0-1 variable: 0 if barrier function is used to remain all
                      % points feasible; 1 if filter method is used
%
par_ratio = 1;        % Parameter for ratio
%
tol_feasible = 10^-5; % Minimun value of constraint violation function to accept as feasible point
%
hmax_par = 0;         % 0-hmax variable: 0 if you do not want to supply hmax;
                      % otherwise if you want to provide it, just put the value
                      % hmax_par = hmax; where hmax is the intended value.
%
sort_filter_par = 1;  % oder the list of ponts in some way to choose the poll center
%
oport_approach = 0;   % the approach used to says that an approach oportunistic or complete polling
%
sd = 1e-6;
%
suficient_decrease = 0;
%rho = 0.1;
%% Inexact Restoration parameters
%restoration_approach = 6;

% End of parameters_dms.