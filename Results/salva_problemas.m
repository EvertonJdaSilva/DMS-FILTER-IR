problems_M

solversleg_vs = char('DMS-Filter_{\oplus}(line,n)','DMultiMads-PB');%
%('DMS-Filter-Improved - 30 june version - Coordinate - OP - v2','DMultiMads-PB');%'DMultiMads-PB','DMS-Filter-Original');
solversleg = solversleg_vs;
guarda_a = [];
guarda_v = [];

solvers_vs_best = char('dms_filter_original','dmultimads_PB');%
%('dms_filter_improved_verified_coordinate_opv2','dmultimads_PB');%,'dmultimads_PB','dms_filter_original');
solvers = solvers_vs_best;
solver_nstocastic= char('dms_filter_original','dmultimads_PB');%
%('dms_filter_improved_verified_coordinate_opv2','dmultimads_PB');%,'dmultimads_PB','dms_filter_original');
solver_stocastic = char();
run = 10; %number of runs for stocastic solvers
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%% Hypervolume %%%%%%%%%%%%%%%%%%%%%
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
    H1=zeros(nprobs,nsolver_stocastic);
    V1=zeros(nprobs,nsolver_stocastic);
    for j=1:nsolver_stocastic
        ind=(nsolver_nstocastic+(j-1)*run+1:j*run+nsolver_nstocastic);
        T1=H(:,ind)'; sumT1=sum(T1); sumT1=sumT1';
        T2=V(:,ind)'; sumT2=sum(T2); sumT2=sumT2';
        H1(:,j)=sumT1./run;
        V1(:,j)=sumT2./run;
    end
    H=[H(:,1:nsolver_nstocastic) H1]; % Hypervolume
    V=[V(:,1:nsolver_nstocastic) V1]; % V(i,j) = Hypervolume/prod(range)
end


H = [H H(:,1)-H(:,2)];

ind_p = find(H(:,3)<0);

structure_problems;
fp =fopen('problems_hyper.m','wt'); 
count_ind_p = 1;
while count_ind_p<= length(ind_p)
    fprintf(fp,'%s_%s',problem(ind_p(count_ind_p)).name,problem(ind_p(count_ind_p)).Constraint);
    fprintf(fp,'\n');
    count_ind_p = count_ind_p + 1;
end
fclose(fp);



%%%%%%%%%%%%%%%%%%%%% Purity %%%%%%%%%%%%%%%%%%%%%
guarda_purity = [];
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

P = [P P(:,1)-P(:,2)];

ind_p = find(P(:,3)<0);

structure_problems;
fp =fopen('problems_purity.m','wt'); 
count_ind_p = 1;
while count_ind_p<= length(ind_p)
    fprintf(fp,'%s_%s',problem(ind_p(count_ind_p)).name,problem(ind_p(count_ind_p)).Constraint);
    fprintf(fp,'\n');
    count_ind_p = count_ind_p + 1;
end
fclose(fp);