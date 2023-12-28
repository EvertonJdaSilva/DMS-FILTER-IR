function [C] = styrene_multiobj_constraints(x)

% current version does not support p>1:
s = size(x);
p = s(1,2);
if ( p > 1 )
    fprintf('\nERROR (p>1)\n\n')
    return
end

% check the dimension of x:
if ( s(1,1) ~= 8 )
    fprintf('\nERROR (n!=8)\n\n')
    return
end

%check the bounds:
if ( sum(sum(x<0|x>100) > 0 ) )
    %f = ones(1,p) * inf; Ana
    C = ones(9,p) * inf; %Ana
    return
end

% create input file with x coordinates:
pid = feature('getpid');
input_file_name = 'styrene_tmp_x_';
input_file_name = strcat(input_file_name,int2str(pid),'.txt');
input_file = fopen(input_file_name,'w');
fprintf ( input_file , '%.15f\n' , x );
fclose(input_file);

% launch the simulation:
output_file_name = 'styrene_tmp_f_';
output_file_name = strcat(output_file_name,int2str(pid),'.txt');

cmd  = sprintf ( '%s%s%s%s' , 'styrene.exe ' , input_file_name , ' > ' , output_file_name );
flag = system(cmd);

if ( flag == 1 )
    C = ones(9,p) * inf; 
    return
end

% get the result:
output_file = fopen ( output_file_name,'r');
F=fscanf(output_file,'%f%f');
fclose(output_file);

% erase the input and output files:
delete(input_file_name);
delete(output_file_name);

% check the output (may be 'ERROR X')
if size(F,1)~=12 || size(F,2)~=1% Ana
       C = ones(9,p) * inf; % Ana
       return
end % Ana

% Constraints:
C=F;
C([5,7,12]) = []; % Everton

return