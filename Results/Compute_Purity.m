clear;
close all;

problems_2
%smooth_problems
%problems_M % without the problems ZLT1_C3, ZLT1_C4, and ZLT1_C5.
%problems_ALL


solversleg_vs = char('DMS-Filter-IR - v1','DMS-Filter-IR - v2');%,'DFMO','DmultiMads-PB','DMS-EB');
solversleg = solversleg_vs;

guarda_purity = [];

solvers_vs_best = char('teste_MAY_AE_500','teste_June_xi_500');%,'DFMO_centroid_500funcevals','DMultiMadsPB_500funceval','dms_EB_500funcevals');
solvers = solvers_vs_best;
solver_nstocastic= solvers_vs_best;
solver_stocastic= char();
run = 10; %number of runs for stocastic solvers
%--------------------------------------------------------------------------

[nprobs,~]=size(problems);
[nsolvers,~]=size(solvers);
[nsolver_stocastic,~]=size(solver_stocastic);
[nsolver_nstocastic,~]=size(solver_nstocastic);

%load all solvers data
for s1=1:nsolvers
    eval(strtrim(solvers(s1,:)));
end

for s1=1:nsolvers
    for i=1:nprobs % for all problems
        list=[];
        for s2=1:nsolvers
            if(s1~=s2)
                list=[list;eval(strcat(strtrim(solvers(s2,:)),'_',strtrim(problems(i,:))))]; %#ok<AGROW> 
            end
        end
        nondominated=0;
        points = eval(strcat(strtrim(solvers(s1,:)),'_',strtrim(problems(i,:))))';
        points = unique(points','rows')';
        list = unique(list,'rows');
        npoints = size(points,2);
        for p=1:npoints
            if(~paretodominance(points(:,p),list'))
                nondominated=nondominated+1;                             
            end
        end
        guarda_purity=[guarda_purity,nondominated/npoints]; %#ok<AGROW> 
    end
end

P=zeros(nprobs,nsolvers);
for j=1:nsolvers
    P(:,j)= guarda_purity((j-1)*nprobs+1:j*nprobs)';
end

%% Compute Average of Purity
if nsolver_stocastic~=0
    P1=zeros(nprobs,nsolver_stocastic);
    for j=1:nsolver_stocastic
        ind=(nsolver_nstocastic+(j-1)*run+1:j*run+nsolver_nstocastic);
        T1=P(:,ind)'; sumT=sum(T1); sumT=sumT';
        P1(:,j)=sumT./run;
    end
    P=[P(:,1:nsolver_nstocastic) P1]; % Purity
end


T=1./P;
doublefig=0;

legenda = solversleg_vs;
Titulo = 'Purity performance profile';

file= 'all';
GenProfile
axis([0.8 15 0 1])

print -depsc Purity.eps
print  -dpdf Purity.pdf %'-bestfit' or '-fillpage'
print -dpng Purity.png
savefig(figure(1),'Purity.fig')