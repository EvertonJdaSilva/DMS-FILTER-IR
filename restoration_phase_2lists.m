function [Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,added_F,added_I,index_poll_center_F,index_poll_center_I,func_eval,Restoration_success] = restoration_phase_2lists(Plist_F,Flist_F,Llist_F,alfa_F,Plist_I,Flist_I,Llist_I,alfa_I,func_F,func_C,grad_C,lbound,ubound,CacheP,CachenormP,CacheF,cache,Pareto_front,func_eval,tol_match,tol_feasible,Llist_ini,alfa_ini,paretodominance_original)
xk                  = Plist_I(:,1);
alfak               = alfa_I(1);
Restoration_success = 0;
index_poll_center_I = 1;
added_I             = zeros(1,size(Plist_I,2));
index_poll_center_F = 1;
added_F             = zeros(1,size(Plist_F,2));
%%% Solve the restoration problem
% If the poll center is not feasible find y such that y is a solution of
% the following problem:
Opt = optimset('Display','off','GradConstr','on','GradObj','on');
% min 1/2||y-xk||.^2+sum(g(x)) s.t. g_i(y)<= (alfak/2)^2*g_i(xk) and y in X
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
        if Fy(end)<=tol_feasible
            if isempty(Flist_F)
                Flist_F = Fy;
                Plist_F = y;
                Llist_F = Llist_ini;
                alfa_F  = alfa_ini;
                added_F = zeros(1,size(Plist_F,2));
            else
                [pdom,index_ndom] = paretodominance(Fy,Flist_F);
                if (pdom == 0)
                    code_add_F = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add_F = 2;
                        end
                        index_poll_center_F = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist_F = [Plist_F(:,index_ndom),y];
                    Flist_F = [Flist_F(:,index_ndom),Fy];
                    alfa_F  = [alfa_F(index_ndom),alfa_I(1)];
                    Llist_F = [Llist_F(index_ndom),Llist_I(1)];
                    added_F = [added_F(index_ndom),code_add_F];
                end
            end
        else
            if isempty(Flist_I)
                Flist_I = Fy;
                Plist_I = y;
                Llist_I = Llist_ini;
                alfa_I  = alfa_ini;
                added_I = zeros(1,size(Plist_I,2));
            else
                if paretodominance_original
                    [pdom,index_ndom] = paretodominance(Fy,Flist_I);
                else
                    [pdom,index_ndom] = paretodominance_November(Fy,Flist_I);
                end
                if (pdom == 0)
                    if index_ndom(1) == 0
                        Restoration_success = 1;
                    end
                    code_add_I = 1;
                    if (Pareto_front == 1)
                        Restoration_success = 1;
                    end
                    if index_ndom(1) == 0
                        if (Pareto_front == 0)
                            Restoration_success  = 1;
                            code_add_I = 2;
                        end
                        index_poll_center_I = 0;
                        index_ndom(1)     = 1;
                    end
                    Plist_I = [Plist_I(:,index_ndom),y];
                    Flist_I = [Flist_I(:,index_ndom),Fy];
                    alfa_I  = [alfa_I(index_ndom),alfa_I(1)];
                    Llist_I = [Llist_I(index_ndom),Llist_I(1)];
                    added_I = [added_I(index_ndom),code_add_I];
                end
            end
        end
    end
end


end