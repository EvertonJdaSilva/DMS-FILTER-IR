clear;
close all;
% %
% % Problems names.
% % 
%problems_2
problems_M

% Performance profiles vs
solvers_vs_best = char('dms_filter_original','DMultiMadsPB');%'DFMO_ASUS_original'
solversleg_vs = char('DMS-Filter Original','DMultiMads-PB');
MOProfiles(problems,solvers_vs_best,solversleg_vs);
close all;
clear('RunProfile');
RunProfile('dfmo_vs_dmsfilter');
%done



