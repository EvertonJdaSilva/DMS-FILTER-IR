function GetExtreme(problems,solvers_nstocastic)
%function GetExtreme(problems,solvers_stocastic,solvers_nstocastic)

%nss=size(solvers_stocastic,1);

nproblems=size(problems,1);
solvers=solvers_nstocastic;

% for i=1:10
%     solvers=strvcat(solvers,strcat(strtrim(solvers_stocastic),int2str(repmat(i,nss,1))));
% end

nsolvers=size(solvers,1);

fp=fopen('Extremes.m','wt');

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

for j=1:nproblems
    fprintf(fp,'%s',strcat(strtrim(problems(j,:)),'_','extrema=['));
    eval(strcat('[dimn,dimm]=size(',strtrim(problems(j,:)),'_','extrema);'));
    for i=1:dimn
        for k=1:dimm
            eval(strcat('fprintf(fp,''%f '',',strtrim(problems(j,:)),'_','extrema(i,k));'));
        end
        fprintf(fp,';');
    end
    fprintf(fp,'];\n\n');
end

fclose(fp);