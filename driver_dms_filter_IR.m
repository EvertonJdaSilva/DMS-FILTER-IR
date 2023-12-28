% driver_dms_filter_IR.m script file
%
% Purpose:
%
% File driver_dms_filter_IR applies the DSM-FILTER-IR algorithm to
% determine the complete Pareto front for the bound constrained optimization
% problem ZDT1 with the group of constraints C1 from Karmitsa, as 
% described in G. Liuzzi, S. Lucidi, and F. Rinaldi. “A derivative-free
% approach to constrained multiobjective nonsmooth optimization".
% In: SIAM J. Optim. 26 (2016), pp. 2744–2774.
%
% The optimizer uses the default options specified in the file 
% parameters_dms.m. An output report is produced, both at the screen 
% and in the text file dms_report.txt (stored at the directory dms_0.3).
%
% DMS Version 0.3.
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
% Driver DMS-FILTER-IR
Pareto_front = 1;
func_F = 'L2ZDT2';
file_ini = 'dms_paretofront.txt';
file_cache = 'dms_cache.txt';
lbound = zeros(30,1);
ubound = ones(30,1);
func_C = 'C1';
format compact;
[Plist_F,f,alfa_F,func_eval] = dms_filter_IR(Pareto_front,func_F,file_ini,file_cache,[],lbound,ubound,func_C);
%
% End of driver_dms_filter_IR.