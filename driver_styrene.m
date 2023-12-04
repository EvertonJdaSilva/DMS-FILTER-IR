fp = fopen('Results\DMSFILTERIR_styrene_feas.m','wt');     % instrucao Windows
%fp = fopen('Results/DMSFILTERIR_styrene.m','wt');      % instrucao Linux

format compact;
fprintf(fp,'DMSFILTERIR_styrene_feas_s=[');
lb     = zeros(8,1);
ub     = 100*ones(8,1);
xi     = [54, 66, 86, 8, 29, 51, 32, 15]';
func_F = 'styrene_multiobj';
func_C = 'styrene_multiobj_constraints';


[Plist_F,f,alfa_F,func_eval] = dms_filter_IR(1,func_F,[],[],xi,lb,ub,func_C,[],6); 

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

fprintf(fp,'DMSFILTERIR_styrene_func_evals=[');
fprintf(fp,'%d,',func_eval);
fprintf(fp,'%d]'';',func_eval);
fclose(fp);
save('DMSFILTERIR_styrene') 


clearvars -except problems nl_path nprobs
% End driver