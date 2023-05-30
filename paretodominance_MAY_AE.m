function [pdom,index_ndom] = paretodominance_MAY_AE(F,Flist,tol_feasible)
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
%         tol_feasible (feasibility tolerance)
%
% Output: 
%
%         pdom (0-1 variable: 1 if the point is dominated; 0 otherwise.)
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
 
if F(end,1)>tol_feasible && F(end,1)>=Flist(end,1)
    % Dominance test related to xk with (F,h)    
    [~,mlist] = size(Flist(:,1));
    index = logical(sum(F<Flist(:,1)));
    % poll_center_dom (0-1 variable: 1 if the poll center is dominated; 0
    % otherwise.)    
    if (sum(index) < mlist)                 
        % Dominance test related to xk with F
        index = logical(sum(F(1:end-1)<Flist(1:end-1,1)));
        if (sum(index) < mlist) 
            poll_center_dom = 1;
        else
            poll_center_dom = 0;
        end
    else
        poll_center_dom = 0;
    end
    % If the poll center is not dominated verifies dominance with (F,h) 
    % for all points in the list
    if ~poll_center_dom
        index_ndom    = [];
        [nlist,mlist] = size(Flist);
        Faux          = repmat(F,1,mlist);
        index1        = logical(sum(logical(Faux<Flist)));
        if (sum(index1) < mlist) 
            pdom = 1;
        else
            pdom       = 0;
            index      = sum(logical(Faux<=Flist));
            index_ndom = ~logical(index == nlist);
        end
    else
        pdom       = 1;
        index_ndom = [];
    end
else
    index_ndom    = [];
    [nlist,mlist] = size(Flist);
    Faux          = repmat(F,1,mlist);
    index1        = logical(sum(logical(Faux<Flist)));
    if (sum(index1) < mlist) 
        pdom = 1;
    else
        pdom       = 0;
        index      = sum(logical(Faux<=Flist));
        index_ndom = ~logical(index == nlist);
    end
end
%
% End of paretodominance.