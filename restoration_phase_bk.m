function [Plist,Flist,Llist,alfa,added,index_poll_center,func_eval,restoration_success] = restoration_phase(Plist,Flist,Llist,alfa,func_F,func_C,grad_C,lbound,ubound,restoration_approach,CacheP,CachenormP,CacheF,cache,func_eval,tol_feasible,tol_match,Pareto_front,iter)

ind_inf     = Flist(end,:)>tol_feasible;
Flist_I     = Flist(:,ind_inf);
Plist_I     = Plist(:,ind_inf);
alfa_I      = alfa(ind_inf);
Llist_I     = Llist(ind_inf);
Fy          = [];
y_IR        = [];
alfa_IR     = [];
Llist_IR    = [];
for ir=1:size(Flist_I,2)
    xk    = Plist_I(:,ir);
    alfak = alfa_I(ir);
    h_xk  = Flist_I(end,ir);
    lk    = Llist_I(ir);
%%% Solve the Inexact Restoration problem
% If the list contains at least an infeasible point, we try to restore the
% feasibility of this point by finding y such that y is a solution to the
% following problem:
    switch restoration_approach
        case 1
            Opt = optimset('Display','off','GradConstr','off','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. h(y)<= alpha_k*h(x_k) and y in X
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,[],y,alfak*h_xk,1),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 2
            Opt = optimset('Display','off','GradConstr','off','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. h(y)<= alpha_k^2*h(x_k) and y in X
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,[],y,alfak^2*h_xk,1),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 3
            Opt = optimset('Display','off','GradConstr','off','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. h(y)<= sqrt(alpha_k)*h(x_k) and y in X
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,[],y,sqrt(alfak)*h_xk,1),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 4
            Opt = optimset('Display','off','GradConstr','on','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. g_i(y)<= alpha_k*g(x_k) and y in X
            alfak_gxk = alfak*feval(func_C,xk);
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 5
            Opt = optimset('Display','off','GradConstr','on','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. g_i(y)<= alpha_k^2*g(x_k) and y in X
            alfak_gxk = alfak^2*feval(func_C,xk);
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 6
            Opt = optimset('Display','off','GradConstr','on','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. g_i(y)<= sqrt(alpha_k)*g(x_k) and y in X
            alfak_gxk = sqrt(alfak)*feval(func_C,xk);
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 7
            Opt = optimset('Display','off','GradConstr','on','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. g_i(y)<= 1/(1+k)*g(x_k) and y in X
            alfak_gxk = 1/(iter+1)*feval(func_C,xk);
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 8
            Opt = optimset('Display','off','GradConstr','off','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. h(y)<= 1/(1+k)*h(x_k) and y in X
            alfak_gxk = 1/(iter+1)*h_xk;
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,1),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 9
            Opt = optimset('Display','off','GradConstr','on','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. g_i(y)<= 1/(2^(2^k))*g(x_k) and y in X
            alfak_gxk = 1/(2^(2^iter))*feval(func_C,xk);
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
        case 10
            Opt = optimset('Display','off','GradConstr','off','GradObj','on');
            % min 1/2||y-xk||.^2 s.t. h(y)<= 1/(2^(2^k))*h(x_k) and y in X
            alfak_gxk = 1/(2^(2^iter))*h_xk;
            [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,1),Opt);
            if exitflag == 1
                if cache ~= 0
                    ynorm        = norm(y,1);
                    [match,y,Fy] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
                end
                if ~match
                    y_IR        = [y_IR, y];
                    c           = norm(max(0,feval(func_C,y)),2).^2;
                    Fy          = [Fy,[feval(func_F,y);c]]; %#ok<*AGROW>
                    alfa_IR     = [alfa_IR, alfak];
                    Llist_IR    = [Llist_IR, lk];
                    func_eval   = func_eval + 1;
                end
            end
    end
end


%%%%
%%% Verifies if some of the new points are nondominated
if ~isempty(alfa_IR)
    added               = zeros(1,size(Plist,2));
    index_poll_center   = 1;
    restoration_success = 0;
    for i=1:size(Fy,2)
        Ftemp    = Fy(:,i);
        xtemp    = y(:,i);
        alfatemp = alfa_IR(i);
        Ltemp    = Llist_IR(i);
        [pdom,index_ndom] = paretodominance(Ftemp,Flist);
        if (pdom == 0)
            restoration_success = 1;
            code_add = 1;
            if (Pareto_front == 1)
                restoration_success = 1;
            end
            if index_ndom(1) == 0
                if (Pareto_front == 0)
                    restoration_success  = 1;
                    code_add = 2;
                end
                index_poll_center = 0;
                index_ndom(1)     = 1;
            end
            Plist = [Plist(:,index_ndom),xtemp];
            Flist = [Flist(:,index_ndom),Ftemp];
            alfa  = [alfa(index_ndom),alfatemp];
            Llist = [Llist(index_ndom),Ltemp];
            added = [added(index_ndom),code_add];
        end
    end
else
    added               = zeros(1,size(Plist,2));
    index_poll_center   = 1;
    restoration_success = 0;
end

end