%% Poll center is nondominated
% xk is an infeasible point and xk+alfak*dk is an infeasible point
Flist = [[0 .5 2]',[.5 1 1]',[1 1 0]',[0 2 .5]'];
F = [0 .1 1]';
tol_feasible = 1e-5;
% New dominance
[pdom,index_ndom] = paretodominance_new(F,Flist,tol_feasible);
if ~pdom
    Flist = [Flist(:,index_ndom),F];
end
Flist_new_dominance = Flist;
% Old dominance
[pdom,index_ndom] = paretodominance(F,Flist);
if ~pdom
    Flist = [Flist(:,index_ndom),F];
end
Flist_old_dominance = Flist;

%% Poll center is dominated
Flist = [[0 .5 2]',[.5 1 1]',[1 1 0]',[0 2 .5]'];
F = [0 1 1.5]';
tol_feasible = 1e-5;
[pdom,index_ndom] = paretodominance_new(F,Flist,tol_feasible);
if ~pdom
    Flist = [Flist(:,index_ndom),F];
end
Flist_new_dominance = Flist;
% Old dominance
[pdom,index_ndom] = paretodominance(F,Flist);
if ~pdom
    Flist = [Flist(:,index_ndom),F];
end
Flist_old_dominance = Flist;


%%%%
% xk is a feasible point and xk+alfak*dk is an infeasible point
Flist = [[0 1 0]',[1 0 0]', [.5 .5 0]'];
%F = [0 .1 2]';
F = [-1 .1 0]';
tol_feasible = 1e-5;
[pdom,index_ndom] = paretodominance_new(F,Flist,tol_feasible);
if ~pdom
    Flist = [Flist(:,index_ndom),F];
end
Flist_new_dominance = Flist
% Old dominance
[pdom,index_ndom] = paretodominance(F,Flist);
if ~pdom
    Flist = [Flist(:,index_ndom),F];
end
Flist_old_dominance = Flist