function GetMax(problems,solvers_nstocastic,solvers_leg,extension)
%function GetMax(problems,solvers_nstocastic,solvers_stocastic,solvers_leg,extension)

%nsolvers_stocastic=size(solvers_stocastic,1);
nsolvers_stocastic= 0;
nsolvers_nstocastic=size(solvers_nstocastic,1);

nproblems=size(problems,1);

fp_min=fopen(strcat('Xi_min_',extension,'.m'),'wt');
fp_avg=fopen(strcat('Xi_avg_',extension,'.m'),'wt');
fp_max=fopen(strcat('Xi_max_',extension,'.m'),'wt');
fp_theta_min=fopen(strcat('Theta_min_',extension,'.m'),'wt');
fp_theta_avg=fopen(strcat('Theta_avg_',extension,'.m'),'wt');
fp_theta_max=fopen(strcat('Theta_max_',extension,'.m'),'wt');


fprintf(fp_min,'function xi_min()\n\n');
fprintf(fp_avg,'function xi_avg()\n\n');
fprintf(fp_max,'function xi_max()\n\n');
fprintf(fp_theta_min,'function theta_max_min()\n\n');
fprintf(fp_theta_avg,'function theta_max_avg()\n\n');
fprintf(fp_theta_max,'function theta_max_max()\n\n');


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
            averagedist=mean(distances(2:npoints-2));
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




% % load all stocastic solvers data
% for s1=1:nsolvers_stocastic
%     % for all runs
%     xidistances=zeros(10,nproblems);
%     thetadistances=zeros(10,nproblems);
%     for r=1:10
%         % load solver run
%         eval(strcat(strtrim(solvers_stocastic(s1,:)),int2str(r)));
%         for j=1:nproblems
%             % Get points
%             points=eval(strcat('[',strtrim(solvers_stocastic(s1,:)),int2str(r),'_',...
%                 strtrim(problems(j,:)),';',strtrim(problems(j,:)),'_extrema];'));
% 
%             [npoints,dim]=size(points);
%             for dims=1:dim
%                 points=sortrows(points, dims);
%                 distances=zeros(1,npoints-1);
%                 for p=1:npoints-1
%                     distances(p)=points(p+1,dims)-points(p,dims);
%                 end
%                 % compute metrics
%                 xidistances(r,j)=max(xidistances(r,j),max(distances(:)));
%                 averagedist=mean(distances(2:npoints-2));
%                 thetadistances(r,j)=max(thetadistances(r,j),max((distances(1)+distances(npoints-1)+sum(abs(distances(2:npoints-2)-averagedist)))/...
%                     (distances(1)+distances(npoints-1)+(npoints-1)*averagedist)));
%             end
%             % free some memory
%             eval(strcat('clear(''',strtrim(solvers_stocastic(s1,:)),int2str(r),'_',strtrim(problems(j,:)),''')'));
%         end
%     end
%     fprintf(fp_min, 'T(:,%d)=[',s1+nsolvers_nstocastic);
%     fprintf(fp_avg, 'T(:,%d)=[',s1+nsolvers_nstocastic);
%     fprintf(fp_max, 'T(:,%d)=[',s1+nsolvers_nstocastic);
%     fprintf(fp_theta_min, 'T(:,%d)=[',s1+nsolvers_nstocastic);
%     fprintf(fp_theta_avg, 'T(:,%d)=[',s1+nsolvers_nstocastic);
%     fprintf(fp_theta_max, 'T(:,%d)=[',s1+nsolvers_nstocastic);
%     for j=1:nproblems
%         fprintf(fp_min,'%f ',min(xidistances(:,j)));
%         fprintf(fp_avg,'%f ',mean(xidistances(:,j)));
%         fprintf(fp_max,'%f ',max(xidistances(:,j)));
%         fprintf(fp_theta_min,'%f ',min(thetadistances(:,j)));
%         fprintf(fp_theta_avg,'%f ',mean(thetadistances(:,j)));
%         fprintf(fp_theta_max,'%f ',max(thetadistances(:,j)));
%     end
%     fprintf(fp_min, '];\n');
%     fprintf(fp_avg, '];\n');
%     fprintf(fp_max, '];\n');
%     fprintf(fp_theta_min, '];\n');
%     fprintf(fp_theta_avg, '];\n');
%     fprintf(fp_theta_max, '];\n');
% end

fprintf(fp_min,'\nGenProfile;\n');
fprintf(fp_avg,'\nGenProfile;\n');
fprintf(fp_max,'\nGenProfile;\n');
%fprintf(fp_theta_min,'\neixos=[0.5 15 0 1];\nGenProfile;\n');
%fprintf(fp_theta_avg,'\neixos=[0.5 15 0 1];\nGenProfile;\n');
%fprintf(fp_theta_max,'\neixos=[0.5 15 0 1];\nGenProfile;\n');
fprintf(fp_theta_min,'\nGenProfile;\n');
fprintf(fp_theta_avg,'\nGenProfile;\n');
fprintf(fp_theta_max,'\nGenProfile;\n');


fclose(fp_min);
fclose(fp_avg);
fclose(fp_max);
fclose(fp_theta_min);
fclose(fp_theta_avg);
fclose(fp_theta_max);