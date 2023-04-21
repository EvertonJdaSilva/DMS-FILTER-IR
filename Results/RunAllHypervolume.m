clear;
% %
% % Problems names.
% % 
%problems_2
problems_M
        
%Performance profiles vs
solvers_vs_best = char('dms_filter_original','dmultimads_PB');%,'DFMO_june18'
solversleg_vs = char('DMS-Filter','DMultiMads-PB');%'DFMO',
MOProfileshyper(problems,solvers_vs_best,solversleg_vs);
% close all;
clear('RunProfilehyper');
RunProfilehyper('dmsfilter_vs_dmultimadspb');



