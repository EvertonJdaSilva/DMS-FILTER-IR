function [Psort,Fsort,alfasort,Lsort] = gamma_bigeon(P,F,alfa,L)
%
% Purpose:
%
%    Function new_sort_gamma sorts a list of points according to the largest
%    gap between two consecutive points in the list considered...
%
% Input:
%
%         P (List of points.)
%
%         F (Function values corresponding to the points in the list.)
%
%         alfa (Step size parameters corresponding to the points in the list.)
%
%         stop_alfa (0-1 variable, which indicates if there is a stopping criterion
%                    based on the step size.)
%
%         tol_stop (Lowest value allowed for the step size parameter.)
%
%
% Output:
%
%         Psort (Sorted list of points.)
%
%         Fsort (Function values corresponding to the points in the sorted list.)
%
%         alfa (Step size parameters corresponding to the points in the
%         sorted list.)
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
nPaux  = size(P,2);
if (nPaux >= 2)
    mPaux = size(F,1);
    gamma = -inf*ones(mPaux,nPaux);
    for j = 1: mPaux
        [FProj,index] = sort(F(j,:),'descend');
        % get extreme points according to one objective
        fmax = FProj(nPaux);
        fmin = FProj(1);
        % can happen for exemple when we have several minima or for more than three objectives
        if fmin == fmax
            fmin = 0.0;
            fmax = 1.0;
        end
        for i = 1:nPaux
            if (i == 1)
                gamma(j,index(1)) = 2*(FProj(2)-FProj(1))/(fmax - fmin);
            else
                if (i == nPaux)
                    gamma(j,index(nPaux)) = 2*(FProj(nPaux)-FProj(nPaux-1))/(fmax - fmin);
                else
                    gamma(j,index(i)) = (FProj(i+1)-FProj(i-1))/(fmax - fmin);
                end
            end
        end
    end
    max_gamma = max(gamma,[],1);
    [~,index] = max(max_gamma);
    ind_aux = setdiff(1:nPaux,index);
    Psort    = [P(:,index),P(:,ind_aux)];
    Fsort    = [F(:,index),F(:,ind_aux)];
    Lsort    = [L(index),L(ind_aux)];
    alfasort = [alfa(index),alfa(ind_aux)];
end
end