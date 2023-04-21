function MOProfiles(problems, solvers, solversleg)

[nprobs,xx]=size(problems);
[nsolvers,xx]=size(solvers);

% open file to save data
fp=fopen('RunProfile.m','wt');

fprintf(fp,'function RunProfile(name)\n\n');

fprintf(fp,'T=[];\n\n');
fprintf(fp,'doublefig=1;\n\n');
fprintf(fp,'legenda=char(');
for s1=1:nsolvers-1
        fprintf(fp,'''%s'',',strtrim(solversleg(s1,:)));
end
fprintf(fp,'''%s'');\n\n',strtrim(solversleg(nsolvers,:)));
fprintf(fp,'Titulo = ''Purity performance profile'';\n');
fprintf(fp,'file= [name];\n\n');

%load all solvers data
for s1=1:nsolvers
    eval(strtrim(solvers(s1,:)));
end

for s1=1:nsolvers
    fprintf(fp,'T(:,%d)=[',s1);
    for i=1:nprobs % for all problems
        list=[];
        for s2=1:nsolvers
            if(s1~=s2)
                list=[list;eval(strcat(strtrim(solvers(s2,:)),'_',strtrim(problems(i,:))))];
            end
        end
        nondominated=0;
        points=eval(strcat(strtrim(solvers(s1,:)),'_',strtrim(problems(i,:))))';
        points=unique(points','rows')';
        list=unique(list,'rows');
        npoints=size(points,2);
        for p=1:npoints
            if(~paretodominance(points(:,p),list'))
                nondominated=nondominated+1;                             
            end
        end
%         if nondominated==0 
%             fprintf(fp,'NaN ');
%         else
%             fprintf(fp,'%f ',npoints/nondominated);
%         end
          fprintf(fp,'%f ',npoints/nondominated);

%                  fprintf(fp,'%f ',1.0E-6+1-nondominated/npoints);

    end
    fprintf(fp,'];\n\n');
end

fprintf(fp,'GenProfile;\n');

fclose(fp);