fp = fopen('Results/dms_filter_IR_SOLAR8.m','wt');     % instrucao Windows
 % 8  MAXHF_MINCOST          heliostat field performance and cost   2           13              9
format compact;
fprintf(fp,'dms_filter_IR_SOLAR8_s=[');
lb     = [1.0, 1.0, 20.0, 1.0, 1.0, 1.0, 0.0, 1.0, 0.01, 0.005, 0.0060]';
ub     = [40.0, 40.0, 250.0, 30.0, 30.0, 89.0, 20.0, 20.0, 5.00, 0.100, 0.1000]';
xi     = [11.0, 11.0, 200.0, 10.0, 10.0, 89.0, 0.5, 8.0, 0.30, 0.020, 0.0216]';
func_F = 'solar8_function';
func_C = 'solar8_constraints';


[P,f,alfa,func_eval] = dms_filter_IR(1,func_F,[],[],xi,lb,ub,func_C);
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

fprintf(fp,'dms_filter_IR_SOLAR8_func_evals=[');
fprintf(fp,'%d,',func_eval);
fprintf(fp,'%d]'';',func_eval);
fclose(fp);
save('dms_filter_IR_SOLAR8') 


clearvars -except problems nl_path nprobs
% End driver