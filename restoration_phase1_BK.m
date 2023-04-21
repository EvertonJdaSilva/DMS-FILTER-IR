function [Plist,Flist,Llist,alfa,added,index_poll_center,func_eval,Restoration_success] = restoration_phase1(Plist,Flist,Llist,alfa,func_F,func_C,grad_C,lbound,ubound,restoration_approach,CacheP,CachenormP,CacheF,cache,Pareto_front,func_eval,tol_match,iter)
xk                  = Plist(:,1);
h_xk                = Flist(:,1);
alfak               = alfa(1);
Restoration_success = 0;
index_poll_center   = 1;
added               = zeros(1,size(Plist,2));
%%% Solve the restoration problem
% If the poll center is not feasible find y such that y is a solution of
% the following problem:
switch restoration_approach
    case 1
        Opt = optimset('Display','off','GradConstr','off','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. h(y)<= alfak*h(xk) and y in X
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,[],y,alfak*h_xk,1),Opt);
        if exitflag == 1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
        Opt = optimset('Display','off','GradConstr','off','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. h(y)<= alfak^2*h(xk) and y in X
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,[],y,alfak^2*h_xk,1),Opt);
        if exitflag == 1
            if cache ~= 0
                ynorm        = norm(y,1);
                [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
            end
            if ~match
                c     = norm(max(0,feval(func_C,y)),2).^2;
                Fy    = [feval(func_F,y);c];
                func_eval = func_eval+1;
                %%% Verifies if the new point is nondominated
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
        Opt = optimset('Display','off','GradConstr','off','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. h(y)<= sqrt(alfak)*h(xk) and y in X
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,[],y,sqrt(alfak)*h_xk,1),Opt);
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
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= alfak*g(xk) and y in X
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
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= alfak^2*g(xk) and y in X
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
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= sqrt(alfak)*g(xk) and y in X
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
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
        Opt = optimset('Display','off','GradConstr','off','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. h(y)<= 1/(1+k)*h(xk) and y in X
        alfak_gxk = 1/(1+iter)*h_xk;
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,1),Opt);
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
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= 1/(1+k)*g_i(xk) and y in X
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
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
        Opt = optimset('Display','off','GradConstr','off','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. h(y)<= 1/(2^(2^k))*h(xk) and y in X
        alfak_gxk = 1/(2^(2^iter))*h_xk;
        [y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,grad_C,y,alfak_gxk,1),Opt);
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
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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
    case 10
        Opt = optimset('Display','off','GradConstr','on','GradObj','on');
        % min 1/2||y-xk||.^2 s.t. g_i(y)<= 1/(2^(2^k))*g_i(xk) and y in X
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
                [pdom,index_ndom] = paretodominance(Fy,Flist);
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