clear;
close all;
% %
% % Problems names.
% % 
%problems_2
problems_M

% Performance profiles vs
solvers_vs_best = char('teste_MAY_AE_20000','teste_June_xi_20000');%'DFMO_ASUS_original'
solversleg_vs = char('v1','v2');
MOProfiles(problems,solvers_vs_best,solversleg_vs);
close all;
clear('RunProfile');
RunProfile('v1_vs_v2');
%done



