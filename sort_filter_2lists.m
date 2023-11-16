function [Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,poll_center_feas] = sort_filter_2lists(Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,stop_alfa,tol_stop,par_ratio,count_poll_1,count_poll)
% Order the list to choose the poll center

% Mudar para o passo de não admissibilidade:
% Todos os pontos de polling tem h(x)>0


if nargin<12, count_poll_1 = 0; count_poll=1; end
% List of Infeasible points with stepsize greater than tol_stop
indalfa_I_less  = find(alfa_I>tol_stop);
alfa_I_1        = alfa_I(indalfa_I_less);
Plist_I_1       = Plist_I(:,indalfa_I_less);
Flist_I_1       = Flist_I(:,indalfa_I_less);
Llist_I_1       = Llist_I(indalfa_I_less);
% List of Infeasible points with stepsize lower than tol_stop
indalfa_I_less_aux = setdiff(1:length(alfa_I),indalfa_I_less);
alfa_I_2        = alfa_I(indalfa_I_less_aux);
Plist_I_2       = Plist_I(:,indalfa_I_less_aux);
Flist_I_2       = Flist_I(:,indalfa_I_less_aux);
Llist_I_2       = Llist_I(indalfa_I_less_aux);

% List of Feasible points with stepsize greater than tol_stop
indalfa_F_less = find(alfa_F>tol_stop);
alfa_F_1        = alfa_F(indalfa_F_less);
Plist_F_1       = Plist_F(:,indalfa_F_less);
Flist_F_1       = Flist_F(:,indalfa_F_less);
Llist_F_1       = Llist_F(indalfa_F_less);
% List of Feasible points with stepsize lower than tol_stop
indalfa_F_less_aux = setdiff(1:length(alfa_F),indalfa_F_less);
alfa_F_2        = alfa_F(indalfa_F_less_aux);
Plist_F_2       = Plist_F(:,indalfa_F_less_aux);
Flist_F_2       = Flist_F(:,indalfa_F_less_aux);
Llist_F_2       = Llist_F(indalfa_F_less_aux);

% All the points are infeasible and does not have feasible points
if isempty(Flist_F_1) && ~isempty(Flist_I_1) 
    poll_center_feas = 0;
    [~,ind_inf]   = sort(Flist_I_1(end,:),'ascend');
    alfa_I_1        = alfa_I_1(ind_inf);
    Plist_I_1       = Plist_I_1(:,ind_inf);
    Flist_I_1       = Flist_I_1(:,ind_inf);
    Llist_I_1       = Llist_I_1(ind_inf);
%     % Order the infeasible points according to the gamma proposed by Bigeon et al. 
%     [Plist_I_1,Flist_I_1,alfa_I_1,Llist_I_1] = gamma_bigeon(Plist_I_1,Flist_I_1,alfa_I_1,Llist_I_1);
    %%% ordered
    Plist_I = [Plist_I_1,Plist_I_2];
    Flist_I = [Flist_I_1,Flist_I_2];
    alfa_I  = [alfa_I_1,alfa_I_2];
    Llist_I = [Llist_I_1,Llist_I_2];
% All the points are infeasible and we also have feasible points
elseif (count_poll_1 == count_poll && ~isempty(Flist_F_1) && ~isempty(Flist_I_1)) 
    poll_center_feas = 0;
% Compute the distance among the infeasible points and the last feasible
% poll center that generate only infeasible points.
% Remark: The last point in the feasible list corresponds to the
% previous feasible poll center
    y = Plist_F_1(:,end)-Plist_I_1(:,1:end);
    indaux    = 1;
    distancia = zeros(size(y,2),1);
    while indaux<= size(y,2)
        distancia(indaux)=norm(y(:,indaux));
        indaux=indaux+1;
    end
    %%% Verifies which points are insid of the boll of ratio par_ratio*alfa_F(end)
    indaux1 = find(distancia<=par_ratio*alfa_F_1(end));
    % Points out of the boll
    indaux2 = setdiff(1:size(Plist_I_1,2),indaux1);
    % Find the least value of constraint violation value inside the boll
    [~,ind_Flist_aux2_leasth] = min(Flist_I_1(end,indaux1));  
    t = indaux1(ind_Flist_aux2_leasth);
    r = setdiff(indaux1,t);
    %%% ordered
    Plist_I = [Plist_I_1(:,t),Plist_I_1(:,r),Plist_I_1(:,indaux2),Plist_I_2];
    Flist_I = [Flist_I_1(:,t),Flist_I_1(:,r),Flist_I_1(:,indaux2),Flist_I_2];
    alfa_I  = [alfa_I_1(t),alfa_I_1(r),alfa_I_1(indaux2),alfa_I_2];
    Llist_I = [Llist_I_1(t),Llist_I_1(r),Llist_I_1(indaux2),Llist_I_2];
%     [Plist_I_1,Flist_I_1,Llist_I_1,alfa_I_1] = arg_max_psi(Flist_F_1,Plist_I_1,Flist_I_1,Llist_I_1,alfa_I_1);
%     Plist_I = [Plist_I_1,Plist_I_2];
%     Flist_I = [Flist_I_1,Flist_I_2];
%     alfa_I  = [alfa_I_1,alfa_I_2];
%     Llist_I = [Llist_I_1,Llist_I_2];
else
    poll_center_feas = 1;
    [Plist_F_1,Flist_F_1,Llist_F_1,alfa_F_1] = most_isolated(Plist_F_1,Flist_F_1,Llist_F_1,alfa_F_1,stop_alfa,tol_stop);
    Plist_F = [Plist_F_1,Plist_F_2];
    Flist_F = [Flist_F_1,Flist_F_2];
    alfa_F  = [alfa_F_1,alfa_F_2];
    Llist_F = [Llist_F_1,Llist_F_2];
end
end