function [Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,poll_center_feas] = SelectPollCenter(Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,stop_alfa,tol_stop,rho)
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
alfa_F_1       = alfa_F(indalfa_F_less);
Plist_F_1      = Plist_F(:,indalfa_F_less);
Flist_F_1      = Flist_F(:,indalfa_F_less);
Llist_F_1      = Llist_F(indalfa_F_less);
% List of Feasible points with stepsize lower than tol_stop
indalfa_F_less_aux = setdiff(1:length(alfa_F),indalfa_F_less);
alfa_F_2        = alfa_F(indalfa_F_less_aux);
Plist_F_2       = Plist_F(:,indalfa_F_less_aux);
Flist_F_2       = Flist_F(:,indalfa_F_less_aux);
Llist_F_2       = Llist_F(indalfa_F_less_aux);

if ~isempty(Flist_I_1) && ~isempty(Flist_F_1)
    poll_center_feas = frame_center_selection_rule(Flist_F_1,Flist_I_1,rho);
elseif ~isempty(Flist_I_1) && isempty(Flist_F_1)
    poll_center_feas = 0;
elseif isempty(Flist_I_1) && ~isempty(Flist_F_1)
    poll_center_feas = 1;
end


%%% order the Flist, Plist, Llist and alfa to choose the poll center
if ~poll_center_feas
    if isempty(Plist_F_1)
        [~,ind_inf] = sort(Flist_I_1(end,:),'ascend');
        alfa_I_1    = alfa_I_1(ind_inf);
        Plist_I_1   = Plist_I_1(:,ind_inf);
        Flist_I_1   = Flist_I_1(:,ind_inf);
        Llist_I_1   = Llist_I_1(ind_inf);
    else
        [Plist_I_1,Flist_I_1,Llist_I_1,alfa_I_1] = arg_max_psi(Flist_F_1,Plist_I_1,Flist_I_1,Llist_I_1,alfa_I_1);
    end
    Plist_I = [Plist_I_1,Plist_I_2];
    Flist_I = [Flist_I_1,Flist_I_2];
    alfa_I  = [alfa_I_1,alfa_I_2];
    Llist_I = [Llist_I_1,Llist_I_2];
else
    [Plist_F_1,Flist_F_1,Llist_F_1,alfa_F_1] = most_isolated(Plist_F_1,Flist_F_1,Llist_F_1,alfa_F_1,stop_alfa,tol_stop);
    Plist_F = [Plist_F_1,Plist_F_2];
    Flist_F = [Flist_F_1,Flist_F_2];
    alfa_F  = [alfa_F_1,alfa_F_2];
    Llist_F = [Llist_F_1,Llist_F_2];
end
end