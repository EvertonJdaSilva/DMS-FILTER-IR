clear;
close all;

problems_2
%smooth_problems
%problems_M % without the problems ZLT1_C3, ZLT1_C4, and ZLT1_C5.
%problems_ALL


solversleg_vs = char('DMS-FILTER-IR','DFMO','DmultiMads-PB','DMS-EB');
solversleg = solversleg_vs;
%
solvers_nstocastic = char('teste_november_v4_20000','DFMO_centroid_20000funcevals','DMultiMadsPB_20000funceval','dms_EB_coordinate_20000funceval');
solver_nstocastic1 = solvers_nstocastic;
solver_stocastic1 = char();
run = 10; %number of runs for stocastic solvers


%% Get file with extreme points
% Extreme points are obtained from all the run for every solver
nproblems=size(problems,1);
solvers=solvers_nstocastic;

nsolvers=size(solvers,1);

%load all solvers data
for s1=1:nsolvers
    % load solvers
    eval(strtrim(solvers(s1,:)));
    for j=1:nproblems
        try
            % some solvers do not solve all problems
            points=eval(strcat(strtrim(solvers(s1,:)),'_',strtrim(problems(j,:))));
            [npoints,dim]=size(points);
            
            if s1==1
                eval(strcat(strtrim(problems(j,:)),'_','extrema=Inf*ones(',int2str(2*dim),',',int2str(dim),');'));
                eval(strcat(strtrim(problems(j,:)),'_','extrema((dim+1):2*dim,:)=-',...
                    strtrim(problems(j,:)),'_','extrema((dim+1):2*dim,:);'));
            end
            
            for dims=1:dim
%                sortorder=-mod((dims:dim+dims-1)+dims-2,dim)-1;
%                sortorder(dims)=1;
                points=sortrows(points,dims);
                % points(1,:) is the minimum and points(npoints,:) is the
                % maximum for dimension dims
                % Compare point with minimum from previous solvers
                if(islower(dims,eval(strcat(strtrim(problems(j,:)),'_','extrema(',int2str(dims),',:)')),points(1,:)))
                    eval(strcat(strtrim(problems(j,:)),'_','extrema(',int2str(dims),',:)=points(1,:);'));
                end
                if(isupper(dims,eval(strcat(strtrim(problems(j,:)),'_','extrema(',int2str(dims+dim),',:)')),points(npoints,:)))
                    eval(strcat(strtrim(problems(j,:)),'_','extrema(',int2str(dims+dim),',:)=points(npoints,:);'));
                end
            end
            % free some memory
            eval(strcat('clear(''',strtrim(solvers(s1,:)),'_',strtrim(problems(j,:)),''')'));
        catch ME
            ME.message
        end
    end
end


%% Get Max
nsolvers_stocastic= 0;
nsolvers_nstocastic=size(solvers_nstocastic,1);
extension = 'all';
nproblems=size(problems,1);
solvers_leg =solvers_nstocastic;

fp_min=fopen(strcat('Xi_min_',extension,'.m'),'wt');
fp_avg=fopen(strcat('Xi_avg_',extension,'.m'),'wt');
fp_max=fopen(strcat('Xi_max_',extension,'.m'),'wt');
fp_theta_min=fopen(strcat('Theta_min_',extension,'.m'),'wt');
fp_theta_avg=fopen(strcat('Theta_avg_',extension,'.m'),'wt');
fp_theta_max=fopen(strcat('Theta_max_',extension,'.m'),'wt');


% fprintf(fp_min,'function xi_min()\n\n');
% fprintf(fp_avg,'function xi_avg()\n\n');
% fprintf(fp_max,'function xi_max()\n\n');
% fprintf(fp_theta_min,'function theta_max_min()\n\n');
% fprintf(fp_theta_avg,'function theta_max_avg()\n\n');
% fprintf(fp_theta_max,'function theta_max_max()\n\n');


fprintf(fp_min,'T=[];\n\ndoublefig=1;\n\n');
fprintf(fp_min,'legenda=char(');
fprintf(fp_avg,'T=[];\n\ndoublefig=1;\n\n');
fprintf(fp_avg,'legenda=char(');
fprintf(fp_max,'T=[];\n\ndoublefig=1;\n\n');
fprintf(fp_max,'legenda=char(');

fprintf(fp_theta_min,'T=[];\n\ndoublefig=1;\n\n');
fprintf(fp_theta_min,'legenda=char(');
fprintf(fp_theta_avg,'T=[];\n\ndoublefig=1;\n\n');
fprintf(fp_theta_avg,'legenda=char(');
fprintf(fp_theta_max,'T=[];\n\ndoublefig=1;\n\n');
fprintf(fp_theta_max,'legenda=char(');

for s1=1:(nsolvers_stocastic+nsolvers_nstocastic-1)
    fprintf(fp_min,'''%s'',',strtrim(solvers_leg(s1,:)));
    fprintf(fp_avg,'''%s'',',strtrim(solvers_leg(s1,:)));
    fprintf(fp_max,'''%s'',',strtrim(solvers_leg(s1,:)));
    fprintf(fp_theta_min,'''%s'',',strtrim(solvers_leg(s1,:)));
    fprintf(fp_theta_avg,'''%s'',',strtrim(solvers_leg(s1,:)));
    fprintf(fp_theta_max,'''%s'',',strtrim(solvers_leg(s1,:)));
end
s1=nsolvers_stocastic+nsolvers_nstocastic;
fprintf(fp_min,'''%s'');\n\n',strtrim(solvers_leg(s1,:)));
fprintf(fp_min,'Titulo = ''Minimum \\Xi performance profile for 10 runs'';\n');
fprintf(fp_avg,'''%s'');\n\n',strtrim(solvers_leg(s1,:)));
% fprintf(fp_avg,'Titulo = ''Average \\Xi performance profile for 10 runs'';\n');
fprintf(fp_avg,'Titulo = '' \\Gamma performance profile '';\n');
fprintf(fp_max,'''%s'');\n\n',strtrim(solvers_leg(s1,:)));
fprintf(fp_max,'Titulo = ''Maximum \\Gamma performance profile for 10 runs'';\n');

fprintf(fp_theta_min,'''%s'');\n\n',strtrim(solvers_leg(s1,:)));
fprintf(fp_theta_min,'Titulo = ''Minimum \\Theta performance profile for 10 runs'';\n');
fprintf(fp_theta_avg,'''%s'');\n\n',strtrim(solvers_leg(s1,:)));
% fprintf(fp_theta_avg,'Titulo = ''Average \\Theta performance profile for 10 runs'';\n');
fprintf(fp_theta_avg,'Titulo = '' \\Delta performance profile '';\n');
fprintf(fp_theta_max,'''%s'');\n\n',strtrim(solvers_leg(s1,:)));
fprintf(fp_theta_max,'Titulo = ''Maximum \\Theta performance profile for 10 runs'';\n');

fprintf(fp_min,'file= ''Xi_min_%s'';\n\n',extension);
fprintf(fp_avg,'file= ''Xi_avg_%s'';\n\n',extension);
fprintf(fp_max,'file= ''Xi_max_%s'';\n\n',extension);

fprintf(fp_theta_min,'file= ''Theta_min_%s'';\n\n',extension);
fprintf(fp_theta_avg,'file= ''Theta_avg_%s'';\n\n',extension);
fprintf(fp_theta_max,'file= ''Theta_max_%s'';\n\n',extension);

% load extreme points
Extremes();

% load all non stocastic solvers data
for s1=1:nsolvers_nstocastic
    % for all runs
    xidistances=zeros(nproblems);
    thetadistances=zeros(nproblems);
    % load solver run
    eval(strtrim(solvers_nstocastic(s1,:)));
    for j=1:nproblems
        % Get points
        points_orig=eval(strcat('[',strtrim(solvers_nstocastic(s1,:)),'_',...
            strtrim(problems(j,:)),';',strtrim(problems(j,:)),'_extrema];'));
        [npoints_orig,dim]=size(points_orig);
        for dims=1:dim
            numPointsSolver = npoints_orig-2*dim;
            points = [points_orig(1:numPointsSolver,:);points_orig(numPointsSolver+dims,:);points_orig(numPointsSolver+dim+dims,:)];
            [npoints,~]=size(points);
            points=sortrows(points, dims);
            distances=zeros(1,npoints-1);
            for p=1:npoints-1
                distances(p)=points(p+1,dims)-points(p,dims);
            end
            % compute metrics
            xidistances(j)=max(xidistances(j),max(distances(:)));
            if numPointsSolver==1
                averagedist=0;
            else
            averagedist=mean(distances(2:npoints-2));
            end
            thetadistances(j)=max(thetadistances(j),(distances(1)+distances(npoints-1)+sum(abs(distances(2:npoints-2)-averagedist)))/...
                (distances(1)+distances(npoints-1)+(npoints-3)*averagedist));
        end
        % free some memory
        eval(strcat('clear(''',strtrim(solvers_nstocastic(s1,:)),'_',strtrim(problems(j,:)),''')'));
    end

    fprintf(fp_min, 'T(:,%d)=[',s1);
    fprintf(fp_avg, 'T(:,%d)=[',s1);
    fprintf(fp_max, 'T(:,%d)=[',s1);
    fprintf(fp_theta_min, 'T(:,%d)=[',s1);
    fprintf(fp_theta_avg, 'T(:,%d)=[',s1);
    fprintf(fp_theta_max, 'T(:,%d)=[',s1);
    for j=1:nproblems
        % For nonstocastic solvers max=min=avg, since only one run was
        % performed
        fprintf(fp_min,'%f ',xidistances(j));
        fprintf(fp_avg,'%f ',xidistances(j));
        fprintf(fp_max,'%f ',xidistances(j));
        fprintf(fp_theta_min,'%f ',thetadistances(j));
        fprintf(fp_theta_avg,'%f ',thetadistances(j));
        fprintf(fp_theta_max,'%f ',thetadistances(j));
    end
    fprintf(fp_min, '];\n');
    fprintf(fp_avg, '];\n');
    fprintf(fp_max, '];\n');
    fprintf(fp_theta_min, '];\n');
    fprintf(fp_theta_avg, '];\n');
    fprintf(fp_theta_max, '];\n');
end

% fprintf(fp_min,'\nGenProfile;\n');
% fprintf(fp_avg,'\nGenProfile;\n');
% fprintf(fp_max,'\nGenProfile;\n');
% fprintf(fp_theta_min,'\nGenProfile;\n');
% fprintf(fp_theta_avg,'\nGenProfile;\n');
% fprintf(fp_theta_max,'\nGenProfile;\n');


fclose(fp_min);
fclose(fp_avg);
fclose(fp_max);
fclose(fp_theta_min);
fclose(fp_theta_avg);
fclose(fp_theta_max);


solvers = solvers_nstocastic;

%--------------------------------------------------------------------------

[nprobs,~]=size(problems);
[nsolvers,~]=size(solvers);
[nsolver_stocastic,~]=size(solver_stocastic1);
[nsolver_nstocastic,~]=size(solver_nstocastic1);

%% Compute Average of Xi_avg_All
Xi_avg_All;
if nsolver_stocastic~=0
    T1=zeros(nprobs,nsolver_stocastic);
    for j=1:nsolver_stocastic
        ind=(nsolver_nstocastic+(j-1)*run+1:j*run+nsolver_nstocastic);
        S=T(:,ind)'; sumS=sum(S); sumS=sumS';
        T1(:,j)=sumS./run;
    end
    T=[T(:,1:nsolver_nstocastic) T1]; 
end
doublefig=0;

legenda = solversleg_vs;
Titulo = ' \Gamma performance profile ';
file= 'Xi_avg_all';
GenProfile;
axis([1 15 0 1])

print -depsc Spread_Gamma.eps
print -dpng Spread_Gamma.png
print  -dpdf Spread_Gamma.pdf
savefig(figure(1),'Spread_Gamma.fig')




clc;
%% Compute Average of Theta_avg_All
Theta_avg_All;
if nsolver_stocastic~=0
    T1=zeros(nprobs,nsolver_stocastic);
    for j=1:nsolver_stocastic
        ind=(nsolver_nstocastic+(j-1)*run+1:j*run+nsolver_nstocastic);
        S=T(:,ind)'; sumS=sum(S); sumS=sumS';
        T1(:,j)=sumS./run;
    end
    T=[T(:,1:nsolver_nstocastic) T1]; 
end

doublefig=0;

legenda = solversleg_vs;
Titulo = ' \Delta performance profile ';
file= 'Theta_avg_all';
GenProfile;

print -depsc Spread_Delta.eps
print -dpng Spread_Delta.png
print  -dpdf Spread_Delta.pdf
savefig(figure(2),'Spread_Delta.fig')