clear;

problem(1).name   = 'TNK';
problem(1).lbound = [0; 0];
problem(1).ubound = [pi/2;pi/2];
problem(1).x_ini  = [1.1;0.15];

problem(2).name   = 'GE4';
problem(2).lbound = [0;0;1.2];
problem(2).ubound = [pi;1e20*ones(2,1)];
problem(2).x_ini  = [pi/4;0;1.5];

problem(3).name   = 'KITA';
problem(3).lbound = -1e20*ones(2,1);
problem(3).ubound = 1e20*ones(2,1);
problem(3).x_ini  = [0;0];

fp = fopen('Results\DMSFILTERIR.m','wt');     % instrucao Windows
% fp =fopen('Results/DMSFILTERIR_line.m','wt');      % instrucao Linux

nprobs = 3;

func_evals=zeros(nprobs,1);
for i=1%:nprobs
    fprintf('==================  Problema %3d ================== \n' ,i)
    fprintf(fp,'DMSFILTERIR_%s=[',problem(i).name);
    file_cache = ['DMSFILTERIR_' problem(i).name '_cache.txt'];
    prob = problem(i).name;
    lb   = problem(i).lbound;
    ub   = problem(i).ubound;
    xi   = problem(i).x_ini;

    func_F = [prob '_F'];
    func_C = [prob '_C'];

    [Plist_F,f,alfa_F,func_eval] = dms_filter_IR(1,func_F,[],file_cache,xi,lb,ub,func_C);


    func_evals(i)=func_eval;
    [n,m]=size(f);
    if ~isempty(f)
        for k=1:n
            for l=1:m-1
                fprintf(fp,'%f,',f(k,l));
            end
            fprintf(fp,'%f;',f(k,m));
        end
    end
    fprintf(fp,']'';\n\n');
end

fprintf(fp,'dms_filter_func_evals=[');
for i=1:nprobs-1
    fprintf(fp,'%d,',func_evals(i));
end
fprintf(fp,'%d]'';',func_evals(nprobs));
fclose(fp);



clearvars -except problems nprobs
