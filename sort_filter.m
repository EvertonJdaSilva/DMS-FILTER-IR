function [Plist,Flist,Llist,alfa] = sort_filter(Plist,Flist,Llist,alfa,stop_alfa,tol_stop,tol_feasible,par_ratio,center_F,f_current_poll,count_poll_1,count_poll)


% Switch to the inadmissibility step when all polling points have h(x)>0
if nargin<11
    count_poll_1 = 0;
    count_poll   = 1;
    if nargin==9
        f_current_poll = [];
    end 
end 

%%% Indices corresponding to points that the step lenght is greater than tol_stop
index1 = find(alfa>tol_stop);
alfa1  = alfa(index1);
Plist1 = Plist(:,index1);
Flist1 = Flist(:,index1);
Llist1 = Llist(index1);
index2 = setdiff(1:length(alfa),index1);

%%% Indices corresponding to feasible points
[~,ind1] = find(Flist1(end,:)<= tol_feasible);
indaux=1:size(Flist1,2);
indaux(ind1) = [];

% Feasible
Ffeasible = Flist1(:,ind1);
Pfeasible = Plist1(:,ind1);
Lfeasible = Llist1(ind1);
alfafeasible = alfa1(ind1);

% Infeasible
Finfeasible = Flist1(:,indaux);
Pinfeasible = Plist1(:,indaux);
Linfeasible = Llist1(indaux);
alfainfeasible = alfa1(indaux);

%%% order the Flist, Plist and alfa to choose the poll center
% All the points are infeasible and does not have feasible points
if isempty(Ffeasible) && ~isempty(Finfeasible) 
    [~,ind_inf] = sort(Finfeasible(end,:),'ascend');
    Plist       = [Pinfeasible(:,ind_inf),Plist(:,index2)];
    Flist       = [Finfeasible(:,ind_inf),Flist(:,index2)];
    Llist       = [Linfeasible(ind_inf),Llist(index2)];
    alfa        = [alfainfeasible(ind_inf),alfa(index2)];
% All the points are infeasible and we also have feasible points
elseif ((count_poll_1 == count_poll || ~center_F) && ~isempty(Ffeasible) && ~isempty(Finfeasible))    
    if f_current_poll(end)>tol_feasible % In the last iteration, we had an infeasible poll center and a failed IR step.
        ind = find(sum(f_current_poll==Finfeasible,[])==length(f_current_poll));
        if ~isempty(ind)    
            % Therefore, we persist at the last admissible point until a
            % successful IR occurs, admissibility is restored at the poll
            % step, or the admissible point converged (isempty(ind)=1).
            ind_inf = setdiff(1:size(Finfeasible,2),ind);
            Plist   = [Pinfeasible(:,ind),Pfeasible,Pinfeasible(:,ind_inf),Plist(:,index2)];
            Flist   = [Finfeasible(:,ind),Ffeasible,Finfeasible(:,ind_inf),Flist(:,index2)];
            Llist   = [Linfeasible(ind),Lfeasible,Linfeasible(ind_inf),Llist(index2)];
            alfa    = [alfainfeasible(ind),alfafeasible,alfainfeasible(ind_inf),alfa(index2)];            
        else
            [Psort,Fsort,Lsort,alfasort] = most_isolated(Pfeasible,Ffeasible,Lfeasible,alfafeasible,stop_alfa,tol_stop);
            Plist = [Psort,Pinfeasible,Plist(:,index2)];
            Flist = [Fsort,Finfeasible,Flist(:,index2)];
            Llist = [Lsort,Linfeasible,Llist(index2)];
            alfa  = [alfasort,alfainfeasible,alfa(index2)];
        end
        goon    = 0;
    else
        goon = 1;
    end
    if goon
        % Compute the distance among the infeasible point and the last poll center
        % the last point in the list corresponds to the previous feasible poll center
        y = Pfeasible(:,end)-Pinfeasible(:,1:end);
        indaux    = 1;
        distancia = zeros(size(y,2),1);
        while indaux<= size(y,2)
            distancia(indaux)=norm(y(:,indaux));
            indaux=indaux+1;
        end
        %%% Verifies which points is insid of the boll of ratio par_ratio*alfa(end)
        indaux1 = find(distancia<=par_ratio*alfa1(end) & distancia~=0);
        % Points out of the boll
        indaux2 = setdiff(1:size(Pinfeasible,2),indaux1);
        % Find the least value of h inside the boll
        [~,ind_Flist_aux2_leasth] = min(Finfeasible(end,indaux1));
        t = indaux1(ind_Flist_aux2_leasth);
        r = setdiff(indaux1,t);
        Plist_aux2 = [Pinfeasible(:,t),Pinfeasible(:,r),Pinfeasible(:,indaux2)];
        Flist_aux2 = [Finfeasible(:,t),Finfeasible(:,r),Finfeasible(:,indaux2)];
        alfa_aux2  = [alfainfeasible(t),alfainfeasible(r),alfainfeasible(indaux2)];
        Llist_aux2 = [Linfeasible(t),Linfeasible(r),Linfeasible(indaux2)];
        %%% ordered
        Plist = [Plist_aux2,Pfeasible,Plist(:,index2)];
        Flist = [Flist_aux2,Ffeasible,Flist(:,index2)];
        Llist = [Llist_aux2,Lfeasible,Llist(index2)];
        alfa  = [alfa_aux2,alfafeasible,alfa(index2)];
    end
else
    [Psort,Fsort,Lsort,alfasort] = most_isolated(Pfeasible,Ffeasible,Lfeasible,alfafeasible,stop_alfa,tol_stop);
    Plist = [Psort,Pinfeasible,Plist(:,index2)];
    Flist = [Fsort,Finfeasible,Flist(:,index2)];
    Llist = [Lsort,Linfeasible,Llist(index2)];
    alfa  = [alfasort,alfainfeasible,alfa(index2)];
end
end