function [Plist_F,Flist_F,alfa_F,func_eval] = dms_filter_IR_2lists(Pareto_front,func_F,file_ini,...
                                        file_cache,x_ini,lbound,ubound,func_C,grad_C)
%
% Purpose:
%
% Function dms_filter applies a direct multisearch method to the derivative-free 
% multiobjective optimization problem using filter approach:
%
%    min  F(x) = (f_1(x),f_2(x),...,f_m(x))  
%    s.t. Ax <= b  
%         c_j(x) <= 0, j = 1,...,p,
%
% where x is a real vector of dimension n, A a rational matrix and b is a
% real vector of dimension n.The derivatives of the functionsf_i,
% i = 1,..., m, are not used. Only function values are provided for F 
% and C = (c_1,c_2,...,c_p). In order to compute the set of directions
% we use the linear constraints to conform to the geometry of nearby 
% constraints.
%
% The user must provide: func_F (for F function values),
%
%                        and, if there are constrains other than bounds,
%
%                        func_C (for c_j, j = 1,...,p, function values).
%
% Input:
%
%         Pareto_front (0-1 variable: 1 if the complete Pareto front
%                      should be computed; 0 if only one point in
%                      the Pareto front is required.)
%
%         func_F (Name of the file defining the objective function.)
%
%         file_ini (Name of the file used for initialization.)
%
%         file_cache (Name of the file where a previous cache was saved.)
%
%         x_ini (Initial point to be considered; only required when a file
%               is nor used for initialization, list is set equal to 0 and 
%               bounds are not provided.)
%
%         lbound (Lower bounds on the problem variables. Also used for the
%                iterate list initialization.)
%
%         ubound (Upper bounds on the problem variables. Also used for the
%                iterate list initialization.)
%
%         func_C (Name of the file for computing other problem constraints.)
%
% Output:
%
%         Plist (List of current nondominated points.)
%
%         Flist (List of function values corresponding to current 
%               nondominated points.)
%
%         alfa (List of step size parameters.)
%
%         func_eval (Total number of function evaluations.)
%
%         If output is set equal to 1 in parameters_dms.m file, then a text
%         file, dms_report.txt, is stored at the current directory, which
%         records the iteration results.
%
% Functions called: func_F, func_C, search_step (application, user provided)
%
%                   parameters_dms, paretodominance (provided by the optimizer).
%
% DMS Version 0.3.
%
% Copyright (C) 2015 A. L. Custódio, J. F. A. Madeira, A. I. F. Vaz, 
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
time = clock;
format long;
warning off all;
%
% Load algorithmic strategies, parameters, constants, and tolerances
% values.
%
parameters_dmsFilter;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization Step.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Read file used for initialization.
if (list == 4)
   fpoints = fopen(file_ini,'r');
   aux     = str2num(fgetl(fpoints));
   n       = aux(1);
   m       = aux(2);
   k       = aux(3);
   aux     = str2num(fgetl(fpoints));
   for i = 1:n
      aux = str2num(fgetl(fpoints));
      for j = 1:m
         x_ini(i,j) = aux(j);
      end
   end
   aux = str2num(fgetl(fpoints));
   for i = 1:k
      aux = str2num(fgetl(fpoints));
      for j = 1:m
         F_ini(i,j) = aux(j);
      end
   end
   aux = str2num(fgetl(fpoints));
   aux = str2num(fgetl(fpoints));
   for j = 1:m
      alfa_list(j) = aux(j);
      Llist_list(j) = Llist_ini;
   end
   fclose(fpoints);
end
%
% Define the problem size.
%
if ~isempty(lbound) 
    n = size(lbound,1);
else
    if ~isempty(ubound)
       n = size(ubound,1);
    else
       if ~isempty(x_ini)
          n = size(x_ini,1); 
       else
          fprintf('Error: An initial point or variable bounds should be provided.\n\n');
          return
       end
    end
end
%
% Define the initial iterate list.
%
if (isempty(lbound) || isempty(ubound) || ((sum(isfinite(lbound))+...
   sum(isfinite(ubound)))~= (2*size(lbound,1)))) && isempty(x_ini)
   fprintf('Error: An initial point or complete variable bounds should be provided. \n\n');
   return
else
   if (list == 0) || (list == 4)
      if ~isempty(x_ini)
         Pini = x_ini;
      else
         Pini = (lbound + ubound)/2; 
      end
   else
%    
%     Set seed for random strategies used in the iterate list initialization.
%
     rand('state',sum(100*clock)); %#ok<*RAND> 
%
      if (user_list_size == 0)
         nPini = n;
      end
      if (Pareto_front == 0)
         nPini = 1;
      end
%      
      if isempty(lbound)
         lbound_gen = x_ini - ones(n,1);
      else
         index      = isfinite(lbound);
         lbound_gen = lbound;
         if isfinite(x_ini)
            lbound_gen(~index) = x_ini(~index) - max(x_ini(index)-lbound(index));
         end
      end
      if isempty(ubound)
         ubound_gen = x_ini + ones(n,1);
      else
         index      = isfinite(ubound);
         ubound_gen = ubound;
         if isfinite(x_ini)
            ubound_gen(~index) = x_ini(~index) + max(ubound(index)-x_ini(index));
         end
      end    
      if (list == 1)
         Pini = (repmat(lbound_gen,1,nPini)+lhsdesign(nPini,n)'.*...
                repmat((ubound_gen-lbound_gen),1,nPini));
      else
         if (list == 2)
            Pini = (repmat(lbound_gen,1,nPini)+rand(n,nPini).*...
                   repmat((ubound_gen-lbound_gen),1,nPini));
         else
             if (nPini == 1)
                Pini = (lbound_gen + ubound_gen)/2;
             else
                Pini = repmat(lbound_gen,1,nPini)+repmat((0:(nPini-1))/(nPini-1),n,1)...
                    .*repmat((ubound_gen-lbound_gen),1,nPini);
                if ~mod(nPini,2) && ~user_list_size
                    Pini = [Pini (lbound_gen + ubound_gen)/2];
                    if ~isempty(x_ini)
                        Pini = [Pini x_ini];
                    end
                end
             end
         end
      end
   end 
end
%        
% Feasible points
Plist_F = [];
Flist_F = [];
Llist_F = [];
alfa_F  = [];

% Infeasible points
Plist_I = [];
Flist_I = [];
Llist_I = [];
alfa_I  = [];

% Temporary list
Flist_temp = [];
Plist_temp = [];
Llist_temp = [];
alfa_temp  = [];
INk       = [];
if dir_dense  == 5
    Psobol = sobolset(n);
    p=primes(7919);        % 1000 primes numbers
    isobol_ini = p(n);     % Initial sobol index.
end
func_eval = 0;
match     = 0;
if cache
    if load_cache
       fcache = fopen(file_cache,'r');
       aux    = str2num(fgetl(fcache)); %#ok<*ST2NM> 
       n      = aux(1);
       m      = aux(2);
       k      = aux(3);
       aux    = str2num(fgetl(fcache)); %#ok<*NASGU> 
       for i = 1:n
          aux = str2num(fgetl(fcache));
          for j = 1:m
            CacheP(i,j) = aux(j); 
          end
       end
       aux = str2num(fgetl(fcache));
       for i = 1:k
         aux = str2num(fgetl(fcache));
         for j = 1:m
            CacheF(i,j) = aux(j); %#ok<*AGROW> 
         end
       end
       aux = str2num(fgetl(fcache));
       aux = str2num(fgetl(fcache));
       for j = 1:m
          CachenormP(j) = aux(j);
       end
       fclose(fcache);         
    else
      CacheP     = [];
      CachenormP = [];
      CacheF     = [];
    end
end
%
% Define the maximum value to constraint violation function.
%
if hmax_par ~= 0
    hmax = hmax_par;
else
    haux_const = [];
    for i=1:size(Pini,2)
        x_ini = Pini(:,i);
        feasible_lin = 1;
        bound = [];
        if ~isempty(ubound)
            bound = [bound ; x_ini - ubound];
        end
        if ~isempty(lbound)
            bound = [bound ; - x_ini + lbound]; %#ok<*AGROW> 
        end
        if ~isempty(bound)
            m  = size(bound,1);
            if sum(bound <= 0) ~= m
                feasible_lin = 0;
            end
        end
        if feasible_lin
            h_aux      = feval(func_C,x_ini);
            hx         = max(0,h_aux);
            h          = norm(hx,2).^2;
            haux_const = [h,haux_const]; 
        end
    end
     hmax_aux1     = setdiff(haux_const,Inf);
     hmax_aux2     = max(10,0.5*length(h_aux));
     [~,ind_maxj]  = max(hmax_aux1);
     hmax_aux1     = hmax_aux1(ind_maxj);
     if ~isempty(hmax_aux1)
         hmax = max(hmax_aux1,hmax_aux2);
     else
         hmax = Inf;
     end
end
%
% Evaluate the initial iterate list.
%
for i=1:size(Pini,2)
    x_ini = Pini(:,i);
%
%  Check if the linear constraints holds and if constraint violation 
%  function is less or equal than hmax
%
    h_smaller_hmax = 1;
    feasible_lin = 1;
    bound = [];
    if ~isempty(ubound)
        bound = [bound ; x_ini - ubound];
    end
    if ~isempty(lbound)
        bound = [bound ; - x_ini + lbound];
    end
    if ~isempty(bound)
        m  = size(bound,1);
        if sum(bound <= 0) ~= m
            feasible_lin = 0;
        end
    end
    if feasible_lin
        h_aux    = feval(func_C,x_ini);
        hx       = max(0,h_aux);
        h        = norm(hx,2).^2;
    end
    if h>hmax
        h_smaller_hmax = 0;
    end
    %
    if feasible_lin && h_smaller_hmax 
        if (list~=4)
            if cache ~= 0
%
%     Check if the point was already evaluated.
%
                x_ininorm = norm(x_ini,1);
                if ~isempty(CacheP)
                    [match,x_ini,Ftemp] = match_point(x_ini,x_ininorm,CacheP,...
                        CacheF,CachenormP,tol_match);
                end
            end
            if ~match
%
%      Evaluate the point and store the corresponding values.
%
                Ftemp     = [feval(func_F,x_ini);h];
                func_eval = func_eval+1;
                if cache ~= 0
                    CacheP     = [CacheP,x_ini];
                    CachenormP = [CachenormP,x_ininorm];
                    CacheF     = [CacheF,Ftemp];
                end
            end
        else
            Ftemp = F_ini(:,i);
        end
        if ~match
            Flist_temp = [Flist_temp,Ftemp];
            Plist_temp = [Plist_temp,x_ini];
            if (list ~= 4)
                alfa_temp  = [alfa_temp,alfa_ini];
                Llist_temp = [Llist_temp,Llist_ini];
            else
                alfa_temp  = [alfa_temp,alfa_list(i)];
                Llist_temp = [Llist_temp,Llist_list(i)];
            end
        end
    end
end
%
% Clean the nondominated points in the feasible and infeasible lists 
%
[~,ind] = find(Flist_temp(end,:)<= tol_feasible);
ind_aux_I = 1:size(Flist_temp,2);
ind_aux_I(ind) = [];
Plist_aux = Plist_temp;
% Feasible points
Flist_F = Flist_temp(1:end,ind);
Plist_F = Plist_temp(:,ind);
Llist_F = Llist_temp(ind);
alfa_F  = alfa_temp(ind);
% Infeasible points
Flist_I = Flist_temp(:,ind_aux_I);
Plist_I = Plist_temp(:,ind_aux_I);
Llist_I = Llist_temp(ind_aux_I);
alfa_I  = alfa_temp(ind_aux_I);
if ~isempty(Flist_F)
    % Feasible initial List
    Flist_temp_F = Flist_F(:,1);
    Plist_temp_F = Plist_F(:,1);
    Llist_temp_F = Llist_F(1);
    alfa_temp_F  = alfa_F(1);
    for j=2:size(Flist_F,2)
        Ftemp_F     = Flist_F(:,j);
        Ptemp_F     = Plist_F(:,j);
        Ltemp_F     = Llist_F(j);
        alfatemp_F  = alfa_F(j);
        [pdom,index_ndom] = paretodominance(Ftemp_F,Flist_temp_F);
        if (pdom == 0)
            Plist_temp_F = [Plist_temp_F(:,index_ndom),Ptemp_F];
            Flist_temp_F = [Flist_temp_F(:,index_ndom),Ftemp_F];
            alfa_temp_F  = [alfa_temp_F(index_ndom),alfatemp_F];
            Llist_temp_F = [Llist_temp_F(index_ndom),Ltemp_F];
        end
    end
    Plist_F = Plist_temp_F;
    Flist_F = Flist_temp_F;
    Llist_F = Llist_temp_F;
    alfa_F  = alfa_temp_F;
end
if ~isempty(Flist_I)
    % Infeasible initial List
    Flist_temp_I = Flist_I(:,1);
    Plist_temp_I = Plist_I(:,1);
    Llist_temp_I = Llist_I(1);
    alfa_temp_I  = alfa_I(1);
    for j=2:size(Flist_I,2)
        Ftemp_I     = Flist_I(:,j);
        Ptemp_I     = Plist_I(:,j);
        Ltemp_I     = Llist_I(j);
        alfatemp_I  = alfa_I(j);
        [pdom,index_ndom] = paretodominance(Ftemp_I,Flist_temp_I);
        if (pdom == 0)
            Plist_temp_I = [Plist_temp_I(:,index_ndom),Ptemp_I];
            Flist_temp_I = [Flist_temp_I(:,index_ndom),Ftemp_I];
            Llist_temp_I = [Llist_temp_I(index_ndom),Ltemp_I];
            alfa_temp_I  = [alfa_temp_I(index_ndom),alfatemp_I];
        end
    end
    Plist_I = Plist_temp_I;
    Flist_I = Flist_temp_I;
    Llist_I = Llist_temp_I;
    alfa_I  = alfa_temp_I;
end


%
% Check if the iterate list is not empty.
%
if (isempty(Flist_F) && isempty(Flist_I))
    fprintf('Error: The optimizer did not generate a point\n');
    return
end
%
% Set seed for random generation of poll directions.
%
if (dir_dense ~= 0)
   rand('state',1234);
end
%
halt      = 0;
iter      = 0;
iter_suc  = 0;
Restoration_success = 0;
%
% Print the iteration report header.
%
if output
    fprintf('Iteration Report: \n\n');
    fprintf('| iter  | success | #I points |  #F points |      min alpha    |     max alpha     |\n');
    print_format = ('| %5d |    %2s   |   %5d   |   %5d    |  %+13.8e  |  %+13.8e  |\n');
    fprintf(print_format, iter, '--',size(Plist_I,2),size(Plist_F,2),min(min(alfa_I),min(alfa_F)),max(max(alfa_I),max(alfa_F)));
    fresult = fopen('dms_report.txt','w');
    fprintf(fresult,'Iteration Report: \n\n');
    fprintf(fresult,'| iter  | success | #I points |  #F points |      min alpha    |     max alpha     |\n');
    fprintf(fresult,print_format, iter, '--',size(Plist_I,2),size(Plist_F,2),min(min(alfa_I),min(alfa_F)),max(max(alfa_I),max(alfa_F)));
end
%
while (~halt)
   func_iter = 0;
   move      = 0;
   if ~isempty(alfa_F) || ~isempty(alfa_I)
       if isempty(alfa_I)
           alfa = [alfa_F alfa_I];
       elseif isempty(alfa_F)
           alfa = [alfa_I alfa_F];
       else
           if (alfa_I(1)<tol_stop && alfa_F(1)>=tol_stop)
               alfa = [alfa_F alfa_I];
           elseif (alfa_I(1)>=tol_stop && alfa_F(1)<tol_stop)
               alfa = [alfa_I alfa_F];
           else
               alfa = [alfa_F alfa_I];
           end
       end
   end
   if (alfa(1)>= tol_stop)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Search Step.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
       [success_F,success_I,func_eval_search,Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I] = ...
                         search_step_filter_2lists(Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I);
      func_iter = func_eval_search;
      func_eval = func_eval + func_eval_search;
      if (success_F+success_I)~=0
          poll    = 0;
          success = 1;
      else
          poll    = 1;
          success = 0;
      end
%
%        Choose the poll center
%
         if (sort_filter_par ~= 0)
%              if  iter == 0 || Restoration_success
%                  [Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,poll_center_feas] = sort_filter_2lists(Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,stop_alfa,tol_stop,par_ratio);
%              else
%                  [Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,poll_center_feas] = sort_filter_2lists(Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,stop_alfa,tol_stop,par_ratio,count_poll_1,count_poll);
%              end
             [Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,poll_center_feas] = SelectPollCenter(Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,stop_alfa,tol_stop,rho);
             if poll_center_feas
                 f_current_poll = Flist_F(:,1);
                 p_current_poll = Plist_F(:,1);
             else
                 f_current_poll = Flist_I(:,1);
                 p_current_poll = Plist_I(:,1);
             end
         end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Restoration Phase: Feasibility Step
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
        if ~poll_center_feas
            [Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,added_F,added_I,index_poll_center_F,index_poll_center_I,func_eval,Restoration_success] = restoration_phase_2lists(Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,func_F,func_C,grad_C,lbound,ubound,CacheP,CachenormP,CacheF,cache,Pareto_front,func_eval,tol_match,tol_feasible,Llist_ini,alfa_ini); %#ok<*ASGLU> 
            if Restoration_success
                success = 1;
                poll = 0;
            else 
                poll = 1;
            end
        end
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Poll Step.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
      while poll
%        
%        Generate the positive basis.
%
         if (dir_dense == 0)
            D = [eye(n) -eye(n)];
         elseif (dir_dense == 1)
            v     = 2*rand(n,1)-1;
            [Q,R] = qr(v);
            if ( R(1) > 1 )
               D = Q * [ eye(n) -eye(n) ];
            else
               D = Q * [ -eye(n) eye(n) ];
            end
         elseif (dir_dense == 2)
             v = randn(n,1); v=v./norm(v);
             if poll_center_feas
                 if alfa_F(1)<=alfa_F(1)^2
                     DELTA=alfa_F(1);
                 else 
                     DELTA=sqrt(alfa_F(1));
                 end
                 r=DELTA/alfa_F(1);
             else
                 if alfa_I(1)<=alfa_I(1)^2
                     DELTA=alfa_I(1);
                 else 
                     DELTA=sqrt(alfa_I(1));
                 end
                 r=DELTA/alfa_I(1);
             end
             H = eye(n)-2*(v)*v';
             B = zeros(n);
             for j=1:n
                 bj = round(r*H(:,j)/norm(H(:,j),inf));
                 B(j,:)= bj;
             end
             D = [B',-B'];
         elseif (dir_dense == 3)
             if poll_center_feas
                 D = GSS_LST(func_C,Plist_F(:,1),0.1*alfa_F(1));
             else
                 D = GSS_LST(func_C,Plist_I(:,1),0.1*alfa_I(1));
             end
         elseif (dir_dense == 4)
             if poll_center_feas
                 [D,INk] = GSS_ABDP(func_C,Plist_F(:,1),0.1*alfa_F(1),INk,iter);
             else 
                 [D,INk] = GSS_ABDP(func_C,Plist_I(:,1),0.1*alfa_I(1),INk,iter);
             end
         elseif (dir_dense == 5)
             if poll_center_feas
                 isobol = isobol_ini+Llist_F(1);
                 q_aux = 2.0*Psobol(isobol+1,:)' - ones(n,1);
                 zeta_f = norm(q_aux,2)/(2*norm(q_aux,Inf));
                 qt = @(zeta)(-norm(round(zeta*q_aux./norm(q_aux)),2));
                 g = @(zeta)(norm(round(zeta*q_aux./norm(q_aux)),2)-2^((abs(Llist_F(1)))/2));
             else
                 isobol = isobol_ini+Llist_I(1);
                 q_aux = 2.0*Psobol(isobol+1,:)' - ones(n,1);
                 zeta_f = norm(q_aux,2)/(2*norm(q_aux,Inf));
                 qt = @(zeta)(-norm(round(zeta*q_aux./norm(q_aux)),2));
                 g = @(zeta)(norm(round(zeta*q_aux./norm(q_aux)),2)-2^((abs(Llist_I(1)))/2));
             end
             zeta = GPS(qt,zeta_f,0,g);
             if (zeta*(q_aux./norm(q_aux,2)))>=10^-14
                 q = ceil(zeta*(q_aux./norm(q_aux,2)));
             else
                 q = floor(zeta*(q_aux./norm(q_aux,2)));
             end
             H = norm(q,2)^2*eye(n) - 2*(q*q');
             D = [H -H];
             Daux = zeros(size(D,1),2*size(D,1));
             for i=1:2*size(D,1)
                 Daux(:,i) = D(:,i)/norm(D(:,i));
             end
             D = Daux;
         end
         nd = size(D,2);
%
%        Poll using the positive basis.
%
         count_d            = 1;
         index_poll_center_F  = 1;
         index_poll_center_I  = 1;
         added_F            = zeros(1,size(Plist_F,2));
         added_I            = zeros(1,size(Plist_I,2));
         count_poll_1 = 0;
         count_poll_2 = 0;
         count_poll   = 0;
         improving    = 0;
         dominating   = 0;
         while (count_d <= nd)
             if poll_center_feas
                 xtemp = Plist_F(:,1) + alfa_F(1) * D(:,count_d);
             else
                 xtemp = Plist_I(:,1) + alfa_I(1) * D(:,count_d);
             end
%
%  Check if the constraint violation function is less than hmax
%
            h_smaller_hmax = 1;
            feasible_lin = 1;
            bound = [];
            if ~isempty(ubound)
                bound = [bound ; xtemp - ubound];
            end
            if ~isempty(lbound)
                bound = [bound ; - xtemp + lbound];
            end
            if ~isempty(bound)
                m  = size(bound,1);
                if sum(bound <= 0) ~= m
                    feasible_lin = 0;
                end
            end
            if feasible_lin
                h_aux    = feval(func_C,xtemp);
                hx       = max(0,h_aux);
                h        = norm(hx,2).^2;
            end
            if h>hmax
                h_smaller_hmax = 0;
            end
%
            if feasible_lin && h_smaller_hmax 
%                 
%           Check if the point was already evaluated.
%
                
                if cache ~= 0
                    count_poll = count_poll + 1;
                    if h>tol_feasible
                        count_poll_1 = count_poll_1 + 1;
                    end
                    xtempnorm           = norm(xtemp,1);
                    [match,xtemp,Ftemp] = match_point(xtemp,xtempnorm,CacheP,...
                        CacheF,CachenormP,tol_match);
                end
%
%              Evaluate the point and store the corresponding values.
%
                if ~match
                    Ftemp     = [feval(func_F,xtemp);h];
                    func_eval = func_eval + 1;
                    func_iter = func_iter + 1;
                    if cache~=0
                        CacheP     = [CacheP,xtemp];
                        CachenormP = [CachenormP,xtempnorm];
                        CacheF     = [CacheF,Ftemp];
                    end
                end
                if match
                    pdom = 1;
                else
                    if Ftemp(end)<=tol_feasible
                        if isempty(Flist_F)
                            Flist_F = Ftemp;
                            Plist_F = xtemp;
                            Llist_F = Llist_ini;
                            alfa_F  = alfa_ini;
                            added_F = zeros(1,size(Plist_F,2));
                        else
                            [pdom,index_ndom] = paretodominance(Ftemp,Flist_F);
                            if (pdom == 0)
                                count_poll_2 = count_poll_2 + 1;
                                code_add_F = 1;
                                if (Pareto_front == 1)
                                    success_F = 1;
                                end
                                if index_ndom(1) == 0
                                    dominating = 1;
                                    if (Pareto_front == 0)
                                        success_F  = 1;
                                        code_add_F = 2;
                                    end
                                    index_poll_center_F = 0;
                                    index_ndom(1)     = 1;
                                end
                                Plist_F = [Plist_F(:,index_ndom),xtemp];
                                Flist_F = [Flist_F(:,index_ndom),Ftemp];
                                alfa_F  = [alfa_F(index_ndom),alfa_F(1)];
                                Llist_F = [Llist_F(index_ndom),Llist_F(1)];
                                added_F = [added_F(index_ndom),code_add_F];
                            end
                        end
                    else
                        if isempty(Flist_I)
                            Flist_I = Ftemp;
                            Plist_I = xtemp;
                            Llist_I = Llist_ini;
                            alfa_I  = alfa_ini;
                            added_I = zeros(1,size(Plist_I,2));
                        else
                            [pdom,index_ndom] = paretodominance(Ftemp,Flist_I);
                            if (pdom == 0)
                                if ~poll_center_feas
                                    if index_ndom(1) ~= 0 && Ftemp(end)<f_current_poll(end)
                                        improving = 1;
                                    elseif index_ndom(1) == 0
                                        dominating = 1;
                                    end
                                end
                                code_add_I = 1;
                                if (Pareto_front == 1)
                                    success_I = 1;
                                end
                                if index_ndom(1) == 0
                                    if (Pareto_front == 0)
                                        success_I  = 1;
                                        code_add_I = 2;
                                    end
                                    index_poll_center_I = 0;
                                    index_ndom(1)     = 1;
                                end
                                Plist_I = [Plist_I(:,index_ndom),xtemp];
                                Flist_I = [Flist_I(:,index_ndom),Ftemp];
                                alfa_I  = [alfa_I(index_ndom),alfa_I(1)];
                                Llist_I = [Llist_I(index_ndom),Llist_I(1)];
                                added_I = [added_I(index_ndom),code_add_I];
                            end
                        end
                    end
                end
            end
            if oportunistic_approach && dominating
                count_d = nd + 1;
            else
                count_d = count_d + 1;
            end
         end
         poll = 0;
      end

%
%     Update the counter for successful iterations.
%          
      if (success_I+success_F)~=0
          iter_suc = iter_suc + 1;
          success  = 1;
      else
          success = 0;
      end
%
%     Update the iterate list.
% 
        if ~isempty(alfa_F)
            if (index_poll_center_F == 0)
                if (Pareto_front == 0)
                    index   = find(added_F == 2);
                    Plist_F = Plist_F(:,index(1));
                    Flist_F = Flist_F(:,index(1));
                    Llist_F = Llist_F(index(1));
                    alfa_F  = alfa_F(index(1));
                    added_F = added_F(index(1));
                else
                    nPlist_F = size(Plist_F,2);
                    Plist_F  = Plist_F(:,2:nPlist_F);
                    Flist_F  = Flist_F(:,2:nPlist_F);
                    Llist_F  = Llist_F(2:nPlist_F);
                    alfa_F   = alfa_F(2:nPlist_F);
                    added_F  = added_F(2:nPlist_F);
                end
            else
                if (Pareto_front == 0)
                    Plist_F   = Plist_F(:,1);
                    Flist_F   = Flist_F(:,1);
                    Llist_F   = Llist_F(1);
                    alfa_F    = alfa_F(1);
                    added_F   = 1;
                else
                    nPlist_F   = size(Plist_F,2);
                    Plist_F    = [Plist_F(:,2:nPlist_F),Plist_F(:,1)];
                    Flist_F    = [Flist_F(:,2:nPlist_F),Flist_F(:,1)];
                    Llist_F    = [Llist_F(2:nPlist_F),Llist_F(1)];
                    alfa_F     = [alfa_F(2:nPlist_F),alfa_F(1)];
                    added_F    = [added_F(:,2:nPlist_F),1];
                end
            end
        end
        if ~isempty(Flist_I)
            nPlist_I   = size(Plist_I,2);
            Plist_I    = [Plist_I(:,2:nPlist_I),Plist_I(:,1)];
            Flist_I    = [Flist_I(:,2:nPlist_I),Flist_I(:,1)];
            Llist_I    = [Llist_I(2:nPlist_I),Llist_I(1)];
            alfa_I     = [alfa_I(2:nPlist_I),alfa_I(1)];
            added_I    = [added_I(:,2:nPlist_I),1];
        end
%
%     Update the step size parameter.
%     
        if (success_F+success_I)~=0
            if success_F
                % Feasible  points
                if ~isempty(alfa_F)
                    alfa_F(logical(added_F))= alfa_F(logical(added_F))*gamma_par;
                end
            end
            if success_I
                % Infeasible  points
                if ~isempty(alfa_I)
                    alfa_I(logical(added_I))= alfa_I(logical(added_I))*gamma_par;
                end
            end
        else
            % Feasible
            if ~isempty(alfa_F) && ~success_F
                alfa_F(logical(added_F))= alfa_F(logical(added_F))*beta_par;
                Llist_F(logical(added_F))  = Llist_F(logical(added_F))+1;
            end
            % Infeasible
            if ~isempty(alfa_I) && ~success_I
                alfa_I(logical(added_I))= alfa_I(logical(added_I))*beta_par;
                Llist_I(logical(added_I))  = Llist_I(logical(added_I))+1;
            end
        end
   else
      % Feasible points
      if ~isempty(Plist_F)
          nPlist_F = size(Plist_F,2);
          Plist_F  = [Plist_F(:,2:nPlist_F),Plist_F(:,1)];
          Flist_F  = [Flist_F(:,2:nPlist_F),Flist_F(:,1)];
          Llist_F  = [Llist_F(2:nPlist_F),Llist_F(1)];
          alfa_F   = [alfa_F(2:nPlist_F),alfa_F(1)];
          move     = 1;
      end
      % Infeasible points
      if ~isempty(Plist_I)
          nPlist_I = size(Plist_I,2);
          Plist_I  = [Plist_I(:,2:nPlist_I),Plist_I(:,1)];
          Flist_I  = [Flist_I(:,2:nPlist_I),Flist_I(:,1)];
          Llist_I  = [Llist_I(2:nPlist_I),Llist_I(1)];
          alfa_I   = [alfa_I(2:nPlist_I),alfa_I(1)];
          move     = 1;
      end
   end 
   if ~move
%
%     Check if the stopping criteria are satisfied.
%
      alfa = [alfa_F alfa_I];
      if stop_alfa && (sum(alfa >= tol_stop)==0) 
         halt = 1;
      end
      if stop_feval && (func_eval >= max_fevals)
         halt = 1;
      end
      iter = iter + 1;
%
%     Print the iteration report.
%
        if output
            print_format = ('| %5d |    %2d   |   %5d   |   %5d   | %+13.8e | %+13.8e |\n');
            fprintf(print_format, iter, success, size(Plist_I,2), size(Plist_F,2), min(alfa), max(alfa));
            fprintf(fresult,print_format, iter, success,size(Plist_I,2), size(Plist_F,2), min(alfa), max(alfa));
        end
%
%     Print the current approximation to the Pareto front.
%
      if (output == 2)
          Flistaux_F = Flist_F(1:end-1,:);
         fparetofront = fopen('dms_paretofront.txt','w');
         n = size(Plist_F,1);
         m = size(Plist_F,2);
         k = size(Flistaux_F,1);
         print_format = '%d %d %d\n\n';
         fprintf(fparetofront,print_format,n,m,k);
         print_format = [];
         for i = 1:m
            print_format  = strcat(print_format,' %+21.16e ');
         end
         print_format  = strcat(print_format,'\n');
         for j=1:n
            fprintf(fparetofront,print_format,Plist_F(j,:));
         end
         fprintf(fparetofront,'\n');
         for j=1:k
             fprintf(fparetofront,print_format,Flistaux_F(j,:));
         end
         fprintf(fparetofront,'\n');
         fprintf(fparetofront,print_format,alfa);
         fclose(fparetofront);
      end
%   
%  Save current cache in a file.
%
      if (save_cache == 2) || (save_cache == 1 && halt)
         fcache = fopen(file_cache,'w');
         n = size(CacheP,1);
         m = size(CacheP,2);
         k = size(CacheF,1);
         print_format = '%d %d %d\n\n';
         fprintf(fcache,print_format,n,m,k);
         print_format = [];
         for i = 1:m
            print_format  = strcat(print_format,' %+21.16e ');
         end
         print_format  = strcat(print_format,'\n');
         for j=1:n
            fprintf(fcache,print_format,CacheP(j,:));
         end
         fprintf(fcache,'\n');
         for j=1:k
            fprintf(fcache,print_format,CacheF(j,:));
         end
         fprintf(fcache,'\n');
         fprintf(fcache,print_format,CachenormP);
         fclose(fcache);
      end
% 
   end     
end       
time = etime(clock,time);
% Points that are considered feasible
list_size    = size(Plist_F,2);
PointsF_F    = Flist_F(1:end-1,:);
PointsX_F    = Plist_F;
Pointsalfa_F = alfa_F;
% Just to be sure: Pareto dominance - Only remain with nondominated points
Flist_F = PointsF_F(:,1);
Plist_F = PointsX_F(:,1);
alfa_F  = Pointsalfa_F(1);
for k = 2:size(PointsF_F,2)
    Ftemp     = PointsF_F(:,k);
    xtemp     = PointsX_F(:,k);
    alfa_temp = Pointsalfa_F(k);
    [pdom,index_ndom] = paretodominance(Ftemp,Flist_F);
    if (pdom == 0)
        Flist_F = [Flist_F(:,index_ndom),Ftemp];
        alfa_F  = [alfa_F(index_ndom),alfa_temp];
        Plist_F = [Plist_F(:,index_ndom),xtemp];
    end
end

%
% Print final report in screen.
%
fprintf('\n Final Report: \n\n');
print_format = 'Elapsed Time = %10.3e \n\n';
fprintf(print_format,time);
fprintf('| #iter | #isuc | list size | #fevals |\n');
print_format = ('| %5d | %5d |   %5d   |  %5d  |\n\n');
fprintf(print_format, iter, iter_suc, size(Flist_F,2), func_eval);
%
if output
%   
%  Print final report in the results file.
%
   fprintf(fresult,'\n Final Report: \n\n');
   print_format = 'Elapsed Time = %10.3e \n\n';
   fprintf(fresult,print_format,time);
   fprintf(fresult,'| #iter | #isuc | list size | fpoints | #fevals |\n');
   print_format = ('| %5d | %5d |   %5d   |   %5d   |  %5d  |\n\n');
   fprintf(fresult,print_format, iter, iter_suc, size(Flist_F,2), length(ind), func_eval);
   fclose(fresult);   
   if (size(Flist_F,1) == 2)
      colors = ['m';'b';'y';'c';'k';'r'];
%     Print a plot of the computed Pareto front.
      color = colors(dir_dense+1);
      h = figure(1);
      hold on 
      plot(Flist_F(1,:),Flist_F(2,:),'LineStyle','None','Marker','o',...
                   'MarkerSize',8,'Color',color)
      xlabel('f1')
      ylabel('f2')
      print(h,'-djpeg','dms_plot.jpg')
   elseif (size(Flist_F,1) == 3)
      colors = ['m';'b';'y';'c';'k';'r'];
%     Print a plot of the computed Pareto front.
      color = colors(dir_dense+1);
      h = figure(1);
      hold on 
      plot3(Flist_F(1,:),Flist_F(2,:),Flist_F(3,:),'LineStyle','None','Marker','o',...
                   'MarkerSize',8,'Color',color)
      xlabel('f1')
      ylabel('f2')
      zlabel('f3')
      print(h,'-djpeg','dms_plot.jpg')
   end
%
end
%
% End dms.