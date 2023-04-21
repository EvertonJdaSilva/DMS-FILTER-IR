function [Psort,Fsort,alfasort] = new_sort_gamma_bk(P,F,alfa,stop_alfa,tol_stop)
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
Psort    = P;
Fsort    = F;
alfasort = alfa;
if stop_alfa
    index1 = find(alfa>tol_stop);
else
    index1 = (1:size(P,2));
end
Paux   = P(:,index1);
Faux   = F(:,index1);
alfaux = alfa(index1);
nPaux  = size(Paux,2);
if (nPaux >= 2)
    [alfaux,index] = sort(alfaux,'descend');
    Paux           = Paux(:,index);
    Faux           = Faux(:,index);
    mPaux = size(Faux,1);
    Rdist = -inf*ones(mPaux,nPaux);
    for j = 1: mPaux
        [FProj,index] = sort(Faux(j,:));
        FProj=FProj./FProj(end);
        for i = 1:nPaux
            if (i == 1)
                Rdist(j,index(1)) = FProj(2)-FProj(1)+1;
            else
                if (i == nPaux)
                    Rdist(j,index(nPaux)) = FProj(nPaux)-FProj(nPaux-1)+1;
                else
                    Rdist(j,index(i)) = (FProj(i+1)-FProj(i-1))/2;
                end
            end
        end
    end
    Mdist = zeros(1,nPaux);
    for j=1:nPaux
        Mdist(j) = sum(Rdist(:,j))/mPaux;
    end    
    [~,index] = sort(Mdist,'descend');
    Paux        = Paux(:,index);
    Faux        = Faux(:,index);
    alfaux      = alfaux(index);
    if stop_alfa
        index1 = find(alfa<=tol_stop);
    else
        index1 = [];
    end
    Psort    = [Paux,P(:,index1)];
    Fsort    = [Faux,F(:,index1)];
    alfasort = [alfaux,alfa(index1)];
end
end