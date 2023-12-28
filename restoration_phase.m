function [Plist,Flist,Llist,alfa,added,index_poll_center,func_eval,Restoration_success] = restoration_phase(Plist,Flist,Llist,alfa,func_F,func_C,lbound,ubound,CacheP,CachenormP,CacheF,cache,Pareto_front,func_eval,tol_match)
xk                  = Plist(:,1);
alfak               = alfa(1);
Restoration_success = 0;
index_poll_center   = 1;
added               = zeros(1,size(Plist,2));
%%% Solve the restoration problem
% If the poll center is not feasible find y such that y is a solution of
% the following problem:
Opt = optimset('Display','off','GradConstr','off','GradObj','on');
% min 1/2||y-xk||.^2 s.t. h(y)<= (alfak/2)^2*h(xk) and y in X
alfak_hxk = ((alfak/2)^2)*sum(max(0,feval(func_C,xk)).^2);
[y,~,exitflag] = fmincon(@(y)func_IR(y,xk),xk,[],[],[],[],lbound,ubound,@(y)violation_function(func_C,y,alfak_hxk),Opt);
if exitflag ==1
    if cache ~= 0
        ynorm        = norm(y,1);
        [match,y] = match_point(y,ynorm,CacheP,CacheF,CachenormP,tol_match);
    end
    if ~match
        c     = norm(max(0,feval(func_C,y)),2).^2;
        Fy    = [feval(func_F,y);c];
        func_eval = func_eval+1;
        if cache~=0
            CacheP     = [CacheP,y];
            CachenormP = [CachenormP,ynorm];
            CacheF     = [CacheF,Fy];
        end
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