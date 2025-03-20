problem(1).name   = 'TNK';
problem(1).lbound = [0; 0];
problem(1).ubound = [pi/2;pi/2];
problem(1).x_ini  = [1.1;0.15];

D = 15;
load('InitialX_MW6.mat')
problem(2).name   = 'MW3';
problem(2).lbound = zeros(D,1);
problem(2).ubound = ones(D,1);
problem(2).x_ini  = X(:,1);

problem(3).name   = 'MW5';
problem(3).lbound = zeros(D,1);
problem(3).ubound = ones(D,1);
problem(3).x_ini  = X(:,3);

problem(4).name   = 'MW7';
problem(4).lbound = zeros(D,1);
problem(4).ubound = ones(D,1);
problem(4).x_ini  = X(:,4);

problem(5).name   = 'MW9';
problem(5).lbound = zeros(D,1);
problem(5).ubound = ones(D,1);
problem(5).x_ini  = X(:,5);

nprobs   = 5;
fp = fopen('Results\DMSFILTERIR_MW_line_5k.m','wt');     % instrucao Windows
% fp =fopen('Results/DMSFILTERIR_line.m','wt');      % instrucao Linux

func_evals=zeros(nprobs,1);
for i=5%1:nprobs
    fprintf('==================  Problema %3d ================== \n' ,i)
    fprintf(fp,'DMSFILTERIR_MW_line_5k_%s=[',problem(i).name);
    file_cache = ['DMSFILTERIR_MW_line_5k_' problem(i).name '_cache.txt'];
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
