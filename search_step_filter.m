function  [success,func_eval_search,Plist,Flist,alfa] = search_step_filter(Plist,Flist,alfa)
%
% Purpose:
%
%    Function search_step is an user provided function which
%    implements a search step for the algorithm.
%
% Input:  
%
%         Plist (Current list of nondominated points.)
%
%         Flist (Function values corresponding to the points in the list.)
%
%         alfa (Step size parameters corresponding to the list points.)
%
% Output: 
%
%         success (0-1 variable: 1 if the list of nondominated points 
%                 changed; 0 otherwise.)
%
%         func_eval_search (Total number of function evaluations
%                          performed.)
%
%         Plist (New list of nondominated points.)
%
%         Flist (Function values corresponding to the points in the new list.)
%
%         alfa (Step size parameters corresponding to the list points.)        
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
success          = 0;
func_eval_search = 0;
%
% -----------------------------------------------------------------------------
%  Block to be user modified.
% -----------------------------------------------------------------------------
% -----------------------------------------------------------------------------
%  End of block to be user modified.
% -----------------------------------------------------------------------------
%
% End of search_step.