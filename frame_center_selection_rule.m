function poll_center_feas = frame_center_selection_rule(Flist_F,Flist_I,rho)

Flist_F_max_aux  = max(Flist_F(1:end-1,:),[],2);
Flist_F_min_aux  = min(Flist_F(1:end-1,:),[],2);
mu               = zeros(length(Flist_F_max_aux),1);
for i=1:length(Flist_F_max_aux)
    if Flist_F_max_aux(i) == Flist_F_min_aux(i)
        mu(i) = abs(Flist_F_max_aux(i));
    else
        mu(i) = abs(Flist_F_max_aux(i)-Flist_F_min_aux(i));
    end
end

xi        = sum(mu);
psi_LF_xI = psi_LF(Flist_F,Flist_I(:,1));

if psi_LF_xI - rho*xi>0
    % Infeasible poll center 
    poll_center_feas = 0;
else
    % Feasible poll center
    poll_center_feas = 1;
end

end