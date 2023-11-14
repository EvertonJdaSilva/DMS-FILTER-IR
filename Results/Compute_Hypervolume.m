clear;

problems_2
%smooth_problems
%problems_M % without the problems ZLT1_C3, ZLT1_C4, and ZLT1_C5.
%problems_ALL


solversleg_vs = char('DMS-FILTER-IR','DFMO','DmultiMads-PB','DMS-EB');
solversleg = solversleg_vs;
guarda_a = [];
guarda_v = [];

solvers_vs_best = char('teste_november_500','DFMO_centroid_500funcevals','DMultiMadsPB_500funceval','dms_EB_500funcevals');
solvers = solvers_vs_best;
solver_nstocastic= solvers_vs_best;
solver_stocastic = char();
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
    %fprintf('T(:,%d)=[',s1);
    for i=1:nprobs % for all problems
        list=[];
        for s2=1:nsolvers
            list=[list;eval(strcat(strtrim(solvers(s2,:)),'_',strtrim(problems(i,:))))]; %#ok<AGROW>
        end
        points=eval(strcat(strtrim(solvers(s1,:)),'_',strtrim(problems(i,:))))';
        points=unique(points','rows');
        list  =unique(list,'rows');


        maxP  = max(list,[],1);
        minP  = min(list,[],1);
        range = maxP-minP;


        % v= 1/ Hypervolume_MEX(points,maxP); % hypervolume computed with a reference point

        %  scalarization of the hypervolume value (divide by the product of the
        %  ranges and consider the inverse value for performance profiles)
        a = Hypervolume_MEX(points,maxP);
        v = a/prod(range);

        guarda_a = [guarda_a,a]; %#ok<AGROW>
        if isnan(v)
            v=1;
            guarda_v =  [guarda_v,v]; %#ok<AGROW>
        else
            guarda_v =  [guarda_v,v]; %#ok<AGROW>
        end
    end
end
H=zeros(nprobs,nsolvers);
V=zeros(nprobs,nsolvers);
for j=1:nsolvers
    H(:,j)= guarda_a((j-1)*nprobs+1:j*nprobs)';
    V(:,j)= guarda_v((j-1)*nprobs+1:j*nprobs)';
end

%% Compute Average of Hypervolume
if nsolver_stocastic~=0
    H1=zeros(nprobs,nsolver_stocastic/run);
    V1=zeros(nprobs,nsolver_stocastic/run);
    for j=1:(nsolver_stocastic/run)
        ind=(nsolver_nstocastic+(j-1)*run+1:j*run+nsolver_nstocastic);
        T1=H(:,ind)'; sumT1=sum(T1); sumT1=sumT1';
        T2=V(:,ind)'; sumT2=sum(T2); sumT2=sumT2';
        H1(:,j)=sumT1./run;
        V1(:,j)=sumT2./run;
    end
    H=[H(:,1:nsolver_nstocastic) H1]; % Hypervolume
    V=[V(:,1:nsolver_nstocastic) V1]; % V(i,j) = Hypervolume/prod(range)
end

T = 1./V;

doublefig=0;
legenda = solversleg_vs;
Titulo = 'Hypervolume performance profile';

file= 'all';
GenProfile;
axis([1 15 0 1])

print -dpdf Hypervolume.pdf
print -depsc Hypervolume.eps
print -dpng Hypervolume.png
savefig(figure(1),'Hypervolume.fig')