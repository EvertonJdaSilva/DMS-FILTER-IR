function [pdom] = paretodominance(f,flist); 
%function [pdom,index_ndom] = paretodominance(f,flist); 
%
% Purpose:
%
%    Function paretodominance checks if the vector f satisfies a Pareto
%    dominance criterion.
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
%         pdom (0-1 variable: 1 if the point is dominated; 0 otherwise).
%
%         index_ndom (0-1 vector: 1 if the corresponding list point is not
%                    dominated; 0 otherwise).
%
%
%index_ndom    = [];
[nlist,mlist] = size(flist);

%if nlist==0 || mlist==0
%    return 0;
%end

faux          = repmat(f,1,mlist);
index         = logical(sum(logical(faux<flist)));
equal=sum(logical(sum(faux==flist)==nlist));
pdom=(sum(index)+equal < mlist);
% if (sum(index) < mlist)
%     pdom = 1;
% else
%     pdom       = 0;
%    index      = sum(logical(faux<=flist));
%    index_ndom = ~logical(index == nlist);
%end
%
% End of paretodominance.