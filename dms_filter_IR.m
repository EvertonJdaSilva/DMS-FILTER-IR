function [Plist_F,Flist_F,alfa_F,func_eval] = dms_filter_IR(Pareto_front,func_F,file_ini,...
                                        file_cache,x_ini,lbound,ubound,func_C,grad_C,restoration_approach)
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
Flist     = [];
Plist     = [];
Llist     = [];
alfa      = [];
INk       = [];
Pfeasible = 0;
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
    hauxevert = [];
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
            h_aux    = feval(func_C,x_ini);
            hx       = max(0,h_aux);
            h        = norm(hx,2).^2;
            hauxevert = [h,hauxevert]; 
        end
    end
     hmax_aux1 = setdiff(hauxevert,Inf);
     hmax_aux2 = max(10,0.5*length(h_aux));
     [~,ind_maxj]  = max(hmax_aux1);
     hmax_aux1 = hmax_aux1(ind_maxj);
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
        if isempty(Flist)
            Flist = [Flist,Ftemp];
            Plist = [Plist,x_ini];
            if (list ~= 4)
                alfa = [alfa,alfa_ini];
                Llist = [Llist,Llist_ini];
            else
                alfa = [alfa,alfa_list(i)];
                Llist = [Llist,Llist_list(i)];
            end
        else
            if match
                pdom = 1;
            else
                [pdom,index_ndom] = paretodominance(Ftemp,Flist);
                if (pdom == 0)
                    Plist = [Plist(:,index_ndom),x_ini];
                    Flist = [Flist(:,index_ndom),Ftemp];
                    if (list ~= 4)
                        alfa = [alfa(index_ndom),alfa_ini];
                        Llist = [Llist(index_ndom),Llist_ini];
                    else
                        alfa = [alfa(index_ndom),alfa_list(i)];
                        Llist =[Llist(index_ndom),Llist_list(i)];
                    end
                end
            end
        end
    end
end
%
% Check if the iterate list is not empty.
%
if isempty(Flist)
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
    [~,index] = find(Flist(end,:)<= tol_feasible);
    Plist_aux = Plist(:,index);
    fprintf('Iteration Report: \n\n');
    fprintf('| iter  | success | list size |  fpoints |      min alpha    |     max alpha    |\n');
    print_format = ('| %5d |    %2s   |   %5d   |   %5d   | %+13.8e | %+13.8e |\n');
    fprintf(print_format, iter, '--', size(Plist_aux,2), length(index), min(alfa), max(alfa));
    fresult = fopen('dms_report.txt','w');
    fprintf(fresult,'Iteration Report: \n\n');
    fprintf(fresult,'| iter  | success | list size |  fpoints |    min alpha    |     max alpha    |\n');
    fprintf(fresult,print_format, iter, '--',size(Plist_aux,2), length(index), min(alfa), max(alfa));
end
%

while (~halt)
   func_iter = 0;
   move      = 0;
   if (alfa(1) >= tol_stop)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Search Step.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

      [success,func_eval_search,Plist,Flist,alfa] = ...
                         search_step_filter(Plist,Flist,alfa);
      func_iter = func_eval_search;
      func_eval = func_eval + func_eval_search;
      if success
          poll = 0;
      else
          poll = 1;
      end
%
%        Choose the poll center
%
         if (sort_filter_par ~= 0)
             if iter == 0 || Restoration_success
                 [Plist,Flist,Llist,alfa] = sort_filter(Plist,Flist,Llist,alfa,stop_alfa,tol_stop,tol_feasible,par_ratio);
             else
                 [Plist,Flist,Llist,alfa] = sort_filter(Plist,Flist,Llist,alfa,stop_alfa,tol_stop,tol_feasible,par_ratio,count_poll_1,count_poll);
             end
             f_current_poll = Flist(:,1);
             p_current_poll = Plist(:,1);
         end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Restoration Phase: Feasibility Step
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
        if f_current_poll(end) > tol_feasible
            [Plist,Flist,Llist,alfa,added,index_poll_center,func_eval,Restoration_success] = restoration_phase(Plist,Flist,Llist,alfa,func_F,func_C,grad_C,lbound,ubound,restoration_approach,CacheP,CachenormP,CacheF,cache,Pareto_front,func_eval,tol_match,iter);
            if Restoration_success
                success = 1;
                poll = 0;
            else 
                poll = 1;
            end
        end
      while poll

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Optimality Step: Poll Step
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
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
             if alfa(1)<=alfa(1)^2
                 DELTA=alfa(1);
             else 
                 DELTA=sqrt(alfa(1));
             end
             H = eye(n)-2*(v)*v'; r=DELTA/alfa(1);
             B = zeros(n);
             for j=1:n
                 bj = round(r*H(:,j)/norm(H(:,j),inf));
                 B(j,:)= bj;
             end
             D = [B',-B'];
         elseif (dir_dense == 3)
             D = GSS_LST(func_C,Plist(:,1),0.1*alfa(1));
         elseif (dir_dense == 4)
             [D,INk] = GSS_ABDP(func_C,Plist(:,1),0.1*alfa(1),INk,iter);
         elseif (dir_dense == 5)
             isobol = isobol_ini+Llist(1);
             q_aux = 2.0*Psobol(isobol+1,:)' - ones(n,1);
             zeta_f = norm(q_aux,2)/(2*norm(q_aux,Inf));
             qt = @(zeta)(-norm(round(zeta*q_aux./norm(q_aux)),2));
             g = @(zeta)(norm(round(zeta*q_aux./norm(q_aux)),2)-2^((abs(Llist(1)))/2));
             zeta = GPS(qt,zeta_f,0,g);
             if (zeta*(q_aux./norm(q_aux,2)))>=0
                 q = ceil(zeta*(q_aux./norm(q_aux,2)));
             else
                 q = floor(zeta*(q_aux./norm(q_aux,2)));
             end
             H = norm(q,2)^2*eye(n) - 2*(q*q');
             Daux = zeros(size(H,1),size(H,1));
             for i=1:size(H,1)
                 Daux(:,i) = H(:,i)/norm(H(:,i));
             end
             D = [Daux -Daux];
         end
         nd = size(D,2);
%
%        Poll using the positive basis.
%
         count_d            = 1;
         index_poll_center  = 1;
         added              = zeros(1,size(Plist,2));
         count_poll_1 = 0;
         count_poll_2 = 0;
         count_poll   = 0;
         improving    = 0;
         dominating   = 0;
         while (count_d <= nd)
             xtemp = Plist(:,1) + alfa(1) * D(:,count_d);
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
            else
                count_poll = count_poll + 1;
            end
%
            if feasible_lin && h_smaller_hmax 
                if h>tol_feasible
                    count_poll_1 = count_poll_1 + 1;            
                end
%                 
%           Check if the point was already evaluated.
%
                
               if cache ~= 0
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
                   %[pdom,index_ndom] = paretodominance(Ftemp,Flist);
                   %[pdom,index_ndom] = paretodominance_new(Ftemp,Flist,tol_feasible);
                   %[pdom,index_ndom] = paretodominance_MAY(Ftemp,Flist,tol_feasible);
                   if suficient_decrease
                       [pdom,index_ndom] = paretodominance_MAY_AE(Ftemp,Flist,tol_feasible);
                   else
                       [pdom,index_ndom] = paretodominance_MAY_AE(Ftemp,Flist-sd*alfa(1)^2*norm(D(:,count_d),2)^2,tol_feasible);
                   end
                   if (pdom == 0)
                       if f_current_poll(end)>tol_feasible && Ftemp(end)<f_current_poll(end) && index_ndom(1) ~= 0
                           improving = 1;
                       elseif index_ndom(1) == 0
                           dominating = 1;
                       end
                       code_add = 1;
                       if (Pareto_front == 1)
                           success = 1;
                       end
                       if index_ndom(1) == 0
                           if (Pareto_front == 0)
                               success  = 1;
                               code_add = 2;
                           end
                           index_poll_center = 0;
                           index_ndom(1)     = 1;
                       end
                       Plist = [Plist(:,index_ndom),xtemp];
                       Flist = [Flist(:,index_ndom),Ftemp];
                       alfa  = [alfa(index_ndom),alfa(1)];
                       Llist = [Llist(index_ndom),Llist(1)];
                       added = [added(index_ndom),code_add];
                       if h<=tol_feasible
                           count_poll_2 = count_poll_2 + 1;
                       end
                   end
               end
            end
            if oport_approach && dominating
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
      if success 
         iter_suc = iter_suc + 1;
      end
%
%     Update the iterate list.
% 
      if (index_poll_center == 0)
         if (Pareto_front == 0)
            index = find(added == 2);
            Plist = Plist(:,index(1));    
            Flist = Flist(:,index(1));
            Llist = Llist(index(1));
            alfa  = alfa(index(1));
            added = added(index(1)); 
         else 
            nPlist = size(Plist,2);
            Plist  = Plist(:,2:nPlist);
            Flist  = Flist(:,2:nPlist);
            Llist  = Llist(2:nPlist);
            alfa   = alfa(2:nPlist);
            added  = added(2:nPlist);
         end
      else
         if (Pareto_front == 0)
            Plist   = Plist(:,1);    
            Flist   = Flist(:,1);
            Llist   = Llist(1);
            alfa    = alfa(1);
            added   = 1;
         else
            nPlist   = size(Plist,2);
            Plist    = [Plist(:,2:nPlist),Plist(:,1)];
            Flist    = [Flist(:,2:nPlist),Flist(:,1)];
            Llist    = [Llist(2:nPlist),Llist(1)];
            alfa     = [alfa(2:nPlist),alfa(1)];
            added    = [added(:,2:nPlist),1];
         end
      end
%
% Update hmax if the current poll center is an infeasible point
%
%         if f_current_poll(end)>tol_feasible && update_hmax_par
%             ind_aux_inf = Flist(end,:)>tol_feasible;
%             Flist_I     = Flist(end,ind_aux_inf);
%             if ~isempty(Flist_I)
%                 if improving
%                     ind_aux_cacheF = (CacheF(end,:)<f_current_poll(end));
%                     if sum(ind_aux_cacheF)~=0
%                         hmax = max(CacheF(end,ind_aux_cacheF));
%                     end
%                 elseif ~isempty(Flist_I) && f_current_poll(end) == max(Flist_I)
%                     hmax = f_current_poll(end);
%                 else
%                     indI = (CacheF(end,:)<max(Flist_I) & CacheF(end,:)>=f_current_poll(end));
%                     if sum(indI)~=0
%                         hmax = max(CacheF(end,indI));
%                     end
%                 end
%                 ind_h          = Flist(end,:)>hmax;
%                 Plist(:,ind_h) = [];
%                 Flist(:,ind_h) = [];
%                 Llist(ind_h)   = [];
%                 alfa(ind_h)    = [];
%                 added(ind_h)   = [];
%             end
%         end
%
%     Update the step size parameter.
%     
      if success
         alfa(logical(added))  = alfa(logical(added))*gamma_par;
      else
         alfa(logical(added))  = alfa(logical(added))*beta_par;
         Llist(logical(added)) = Llist(logical(added))+1;
      end     
   else
      nPlist = size(Plist,2);
      Plist  = [Plist(:,2:nPlist),Plist(:,1)];
      Flist  = [Flist(:,2:nPlist),Flist(:,1)];
      Llist  = [Llist(2:nPlist),Llist(1)];
      alfa   = [alfa(2:nPlist),alfa(1)];
      move   = 1;
   end 
   if ~move
%
%     Check if the stopping criteria are satisfied.
%
      if stop_alfa && (sum(alfa >= tol_stop)==0) %(sum(alfa < tol_stop)) %
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
            [~,ind] = find(Flist(end,:)<= tol_feasible);
            Plist_aux = Plist(:,ind);
            print_format = ('| %5d |    %2d   |   %5d   |   %5d   | %+13.8e | %+13.8e |\n');
            fprintf(print_format, iter, success, size(Plist,2), length(ind), min(alfa), max(alfa));
            fprintf(fresult,print_format, iter, success, size(Plist,2), length(ind), min(alfa), max(alfa));
        end
%
%     Print the current approximation to the Pareto front.
%
      if (output == 2)
         [~,ind] = find(Flist(end,:)<= tol_feasible);
         Flist_aux= Flist(1:end-1,ind);
         Plist_aux = Plist(:,ind);
         fparetofront = fopen('dms_paretofront.txt','w');
         n = size(Plist_aux,1);
         m = size(Plist_aux,2);
         k = size(Flist_aux,1);
         print_format = '%d %d %d\n\n';
         fprintf(fparetofront,print_format,n,m,k);
         print_format = [];
         for i = 1:m
            print_format  = strcat(print_format,' %+21.16e ');
         end
         print_format  = strcat(print_format,'\n');
         for j=1:n
            fprintf(fparetofront,print_format,Plist_aux(j,:));
         end
         fprintf(fparetofront,'\n');
         for j=1:k
             fprintf(fparetofront,print_format,Flist_aux(j,:));
         end
         fprintf(fparetofront,'\n');
         fprintf(fparetofront,print_format,alfa);
         fclose(fparetofront);
      end
%   
%  Save current cache in a file.
%
      if (save_cache == 2) || (save_cache == 1 && halt)
         fcache = fopen(file_cache,'w'); % 'dms_cache.txt','w');
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
list_size    = size(Plist,2);
[~,ind]      = find(Flist(end,:) <= tol_feasible);
PointsF_F    = Flist(1:end-1,ind);
PointsX_F    = Plist(:,ind);
Pointsalfa_F = alfa(ind);
% Just to be sure: Pareto dominance - Only remain with nondominated points
if ~isempty(PointsF_F)
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
else
    Flist_F = [];
    Plist_F = [];
    alfa_F  = [];
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
   fprintf(fresult,print_format, iter, iter_suc, size(Plist_aux,2), length(ind), func_eval);
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
   end
%
end
%
% End dms.