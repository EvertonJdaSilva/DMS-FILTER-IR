%fp = fopen('dms_filter_styrene_ap1.m','wt');     % instrucao Windows
fp = fopen('dms_filter_styrene_ap1_4.m','wt');      % instrucao Linux

format compact;
fprintf(fp,'dms_filter_styrene_ap1_4_s=[');
lb     = zeros(8,1);
ub     = 100*ones(8,1);
xi     = [54, 66, 86, 8, 29, 51, 32, 15]';
func_F = 'styrene_multiobj';
func_C = 'styrene_multiobj_constraints';


[P,f,alfa,Plist_I,Flist_I,alfa_I,func_eval] = dms_filter(1,func_F,[],[],xi,lb,ub,func_C);

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

fprintf(fp,'dms_filter_styrene_ap1_4_func_evals=[');
fprintf(fp,'%d,',func_eval);
fprintf(fp,'%d]'';',func_eval);
fclose(fp);
save('dms_filter_styrene_line_ap1_4') 


clearvars -except problems nl_path nprobs
% End driver