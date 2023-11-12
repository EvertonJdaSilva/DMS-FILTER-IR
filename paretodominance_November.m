function [pdom_L,index_ndom] = paretodominance_November(F,Flist,tol_feasible)
%
% Purpose:
%
%    Function paretodominance checks if the vector F satisfies a Pareto
%    dominance criterion.
%
% Input:
%
%         F (Vector to be checked.)
%
%         Flist (List storing columnwise the objective function values
%                at nondominated points.)
%
% Output:
%
%         pdom_L (0-1 variable: 1 if the point is dominated; 0 otherwise.)
%
%         index_ndom (0-1 vector: 1 if the corresponding list point is not
%                    dominated; 0 otherwise.)
%
% DMS Version 0.2.
%
% Copyright (C) 2011 A. L. Custódio, J. F. A. Madeira, A. I. F. Vaz,
% and L. N. Vicente.
%
% http://www.mat.uc.pt/dms
%
% This library is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This library is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public
% License along with this library; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
%
%
% If h(y)>0
if F(end,1)>tol_feasible
    % Separate the list into points that satisfy h(x)>h(y) (L1)
    % and points that satisfy h(x)<=h(y) (L2)
    indices = (Flist(end,:)>F(end,1));
    L1 = Flist(:,indices);
    L2 = Flist(:,~indices);
    % Test whether y is dominated using L1 and F
    [~,mlist] = size(L1);
    Faux      = repmat(F(1:end-1,:),1,mlist);
    index     = logical(sum(logical(Faux<L1(1:end-1,:))));
    if (sum(index) < mlist)
        pdom_L1 = 1;
    else
        pdom_L1 = 0;
    end
    % Test whether y is dominated using L2 and F_bar = (F,h)
    [~,mlist] = size(L2);
    Faux      = repmat(F,1,mlist);
    index     = logical(sum(logical(Faux<L2)));
    if (sum(index) < mlist)
        pdom_L2 = 1;
    else
        pdom_L2 = 0;
    end
    pdom_L = ~(pdom_L1+pdom_L2==0);
else
    % Test whether y is dominated using L and F_bar=(F,h)
    [~,mlist] = size(F);
    Faux      = repmat(F,1,mlist);
    index     = logical(sum(logical(Faux<F)));
    if (sum(index) < mlist)
        pdom_L = 1;
    else
        pdom_L = 0;
    end
end
index_ndom = [];
% If y is nondominated
if ~pdom_L
    % Separate the list into the points that satisfy h(x)>h(y)
    % and h(x)>0 (L1) and the rest (L2)
    indices    = (Flist(end,:)<F(end,1) & Flist(end,:)>tol_feasible);
    indicesaux1 = find(indices); 
    indicesaux2 = find(~indices); 
    L1 = Flist(:,indices);
    L2 = Flist(:,~indices);
    % Test whether y is dominates x for L1 using F
    index_ndomL1  = [];
    if ~isempty(L1)
        [nlistL1,mlistL1] = size(L1);
        Faux          = repmat(F,1,mlistL1);
        index         = logical(sum(logical(Faux<L1)));
        index         = sum(logical(Faux<=L1));
        index_ndomL1  = ~logical(index == nlistL1);
    else
        mlistL1 = 0;
    end
    % Test whether y is dominates x for L2 using F_bar=(F,h)
    index_ndomL2      = [];
    if ~isempty(L2)
        [nlistL2,mlistL2] = size(L2);
        Faux          = repmat(F,1,mlistL2);
        index         = logical(sum(logical(Faux<L2)));
        index         = sum(logical(Faux<=L2));
        index_ndomL2  = ~logical(index == nlistL2);
    else
        mlistL2 = 0;
    end
    index_ndom = zeros(1,mlistL1+mlistL2);
    index_ndom(indicesaux1) = index_ndomL1;
    index_ndom(indicesaux2) = index_ndomL2;
end

%
% End of paretodominance.