% Driver DMS-Filter
Pareto_front = 1;
func_F = 'L2ZDT2';
file_ini = 'dms_paretofront.txt';
file_cache = 'dms_cache.txt';
lbound = zeros(30,1);
ubound = ones(30,1);
x_ini = ones(30,1);
func_C2 =  'C1';
format compact;
[Plist_F,Flist_F,alfa_F,Plist_I,Flist_I,alfa_I,func_eval] = dms_filter(Pareto_front,func_F,file_ini,file_cache,[],lbound,ubound,func_C2);


