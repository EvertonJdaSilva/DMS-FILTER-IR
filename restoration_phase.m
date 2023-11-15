function [Plist,Flist,Llist,alfa,added,index_poll_center,func_eval,Restoration_success] = restoration_phase(Plist,Flist,Llist,alfa,func_F,func_C,grad_C,lbound,ubound,restoration_approach,CacheP,CachenormP,CacheF,cache,Pareto_front,func_eval,tol_match,iter,paretodominance_original,tol_feasible)
xk                  = Plist(:,1);
alfak               = alfa(1);
Restoration_success = 0;
index_poll_center   = 1;
added               = zeros(1,size(Plist,2));
%%% Solve the restoration problem
% If the poll center is not feasible find y such that y is a solution of
% the following problem:
switch restoration_approach
    case 1
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2+sum(g(x)) s.t. g_i(y)<= alfak*g(xk) and y in X
        alfak_gxk = alfak*feval(func_C,xk);
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
    case 2
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2+sum(g(x)) s.t. g_i(y)<= alfak^2*g(xk) and y in X
        alfak_gxk = alfak^2*feval(func_C,xk);
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
    case 3
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2+sum(g(x)) s.t. g_i(y)<= sqrt(alfak)*g(xk) and y in X
        alfak_gxk = sqrt(alfak)*feval(func_C,xk);
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
    case 4
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2+sum(g(x)) s.t. g_i(y)<= 1/(1+k)*g_i(xk) and y in X
        alfak_gxk = 1/(1+iter)*feval(func_C,xk);
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
    case 5
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2+sum(g(x)) s.t. g_i(y)<= 1/(2^(2^k))*g_i(xk) and y in X
        alfak_gxk = 1/(2^(2^iter))*feval(func_C,xk);
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
    case 6
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= (alfak/2)^2*g_i(xk) and y in X
        alfak_gxk = ((alfak/2)^2)*feval(func_C,xk);
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    %[pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                    [pdom,index_ndom] = paretodominance_November2(Fy,Flist,tol_feasible);
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end                    
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
    case 7
        %% Exact Restoration
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= 0 and y in X
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,0,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
    case 8
        %% Usinf xi(alfa_k) = 2/pi*atan(alfa_k)
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= 2/pi*atan(alfa_k)*g_i(xk) and y in X
        alfak_gxk = 2/pi*atan(alfak)*feval(func_C,xk);
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
    case 9
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= max{h(xk)-xi(alfak),0} and y in X
        alfak_gxk = max(feval(func_C,xk)-((alfak/2)^2),0);
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,3),Opt);
        if exitflag ==1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist); 
                end
                if (pdom == 0)
                    code_add = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add = 2;
                        end
                        index_poll_center = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist = [Plist(:,index_ndom),y];
                    Flist = [Flist(:,index_ndom),Fy];
                    alfa  = [alfa(index_ndom),alfa(1)];
                    Llist = [Llist(index_ndom),Llist(1)];
                    added = [added(index_ndom),code_add];
                end
            end
        end
end
end