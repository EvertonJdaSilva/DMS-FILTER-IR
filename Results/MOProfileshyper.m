function MOProfileshyper(problems, solvers, solversleg)

[nprobs,xx]=size(problems);
[nsolvers,xx]=size(solvers);

% open file to save data
fp=fopen('RunProfilehyper.m','wt');

fprintf(fp,'function RunProfilehyper(name)\n\n');

fprintf(fp,'T=[];\n\n');
  fprintf(fp,'doublefig=1;\n\n');
% fprintf(fp,'doublefig=0;\n\n');
fprintf(fp,'legenda=char(');
for s1=1:nsolvers-1
        fprintf(fp,'''%s'',',strtrim(solversleg(s1,:)));
end
fprintf(fp,'''%s'');\n\n',strtrim(solversleg(nsolvers,:)));
fprintf(fp,'Titulo = ''Hypervolume performance profile'';\n');
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
            list=[list;eval(strcat(strtrim(solvers(s2,:)),'_',strtrim(problems(i,:))))];
        end
        points=eval(strcat(strtrim(solvers(s1,:)),'_',strtrim(problems(i,:))))';
        points=unique(points','rows');
        list  =unique(list,'rows');
%%-------------------------------------------------------------
%%  recorrer ao método de Monte Carlo para gerar hipervolume
%%-------------------------------------------------------------
%         if (size(list,1)~=1)
%             maxP  = max(list);
%             minP  = min(list);     
%             range = maxP-minP;
%         else
%             minP  = list;     
%             range = zeros(1,size(list,2));
%         end
%         v=0;
%         for k =1:10
%             rand('state',k);
%             v = v + hypervolume_alt(points,minP,range,10000);
%         end
% %         v= 1-v/10;
% 
%              v= 10 /v % experiência de 1/percentagem de hipervolume à
%                         % semelhança de purity
% 
% %           rand('state',0);
% %           v= 1/ hypervolume_alt(points,minP,range,100000);
% %%%           v= 1-hypervolume_alt(points,minP,range,100000);
        
%%%-------------------------------------------------------------
%  recorrer à função Hypervolume mex
%%-------------------------------------------------------------    

if (size(list,1)~=1)
      maxP  = max(list);
      minP  = min(list);     
      range = maxP-minP;
else
    maxP = list;
    range = ones(1,size(list,2));
end
%        v= 1/ Hypervolume_MEX(points,maxP); % hypervolume computed with a reference point

%%%  scalarization of the hypervolume value (divide by the product of the
%%%  ranges and consider the inverse value for performance profiles)
a=Hypervolume_MEX(points,maxP);
       v= prod(range)/a;

       
%%------------------------------------------- 
% Imprime no ficheiro para construir profiles
%%-------------------------------------------
        if a==0 
            fprintf(fp,'%f ',1.0e-8);
        else
            fprintf(fp,'%f ',v);
        end       
    end
    fprintf(fp,'];\n\n');
end

   fprintf(fp,'GenProfile;\n');

fclose(fp);