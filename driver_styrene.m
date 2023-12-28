fp = fopen('DMSFILTERIR_styrene.m','wt');     % instrucao Windows
%fp = fopen('DMSFILTERIR_styrene.m','wt');      % instrucao Linux

format compact;
fprintf(fp,'DMSFILTERIR_styrene_s=[');
lb     = zeros(8,1);
ub     = 100*ones(8,1);
xi     = [54, 66, 86, 8, 29, 51, 32, 15]';
func_F = 'styrene_multiobj';
func_C = 'styrene_multiobj_constraints';

[P,f,alfa,func_eval] = dms_filter_IR(1,func_F,[],'DMSFILTERIR_styrene_line_cache.txt',[],lb,ub,func_C);

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
save('DMSFILTERIR_styrene_line') 

clearvars -except problems nl_path nprobs
% End driver