function [pdom,index_ndom] = L_dominance(f,flist)
%
% Purpose:
%
%    Function L_dominance checks if the vector f satisfies a L dominance
%    criterion.
%
% Input:  
%
%         f (vector to be checked).
%
%         flist (list storing columnwise the objective function values 
%                at nondominated points).
%
% Output: 
%
%         pdom (0-1 variable: 1 if the point is L dominated; 0 otherwise).
%
%         index_ndom (0-1 vector: 1 if the corresponding list point is not
%                    L dominated; 0 otherwise).
%
%
p = 2;

index_ndom    = [];
[~,mlist] = size(flist);
Bt = zeros(mlist,1);
Eq = zeros(mlist,1);
Ws = zeros(mlist,1);
for i=1:mlist
    aux_f = flist(:,i)-f;
    Bt(i)    = sum(logical(find(aux_f<0)));
    Eq(i)    = sum(logical(find(aux_f==0)));
    Ws(i)    = sum(logical(find(aux_f>0)));
end
ind_i = find(Bt-Ws>0);
faux  = repmat(norm(f,p),1,length(ind_i))';
faux2 = flist(:,ind_i);
p_norm_f = zeros(length(ind_i),1);
for i=1:length(ind_i)
    p_norm_f(i)=norm(faux2(:,i),p);
end


if isempty(find(faux<p_norm_f,1))
    pdom = 1;
else
    pdom                     = 0;
    index                    = faux<p_norm_f;
    index_ndom_1             = ind_i(index);
    index_ndom               = ones(1,mlist);
    index_ndom(index_ndom_1) = 0; index_ndom=logical(index_ndom);
end
% End of L_dominance.
end