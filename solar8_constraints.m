function [C] = solar8_constraints(x)

% current version does not support p>1:
s = size(x);
p = s(1,2);
if ( p > 1 )
    fprintf('\nERROR (p>1)\n\n')
    return
end

% check the dimension of x:
if ( s(1,1) ~= 11 )
    fprintf('\nERROR (n!=11)\n\n')
    return
end

% check the bounds:
lbound = [1.0, 1.0, 20.0, 1.0, 1.0, 1.0, 0.0, 1.0, 1e-1, 5e-3, 6e-3]';
ubound = [40.0, 40.0, 250.0, 30.0, 30.0, 89.0, 20.0, 20.0, 5.00, 1e-1, 1e-1]';
bound  = [];
if ~isempty(ubound)
    bound = [bound ; x - ubound];
end
if ~isempty(lbound)
    bound = [bound ; - x + lbound]; 
end
if ~isempty(bound)
    m  = size(bound,1);
    if sum(bound <= 0) ~= m
        bound_feasible = 0;
    else
        bound_feasible = 1;
    end
end
        
if ~bound_feasible
    C = ones(9,p) * inf;
    return
else
    % Real entries
    inputs_solar8        = zeros(13,1);
    inputs_solar8(1:5)   = x(1:5);
    inputs_solar8(7:9)   = x(6:8);
    inputs_solar8(11:13) = x(9:11);

    % Integer entries: as this version does not support integer entries, they are
    % fixed to the x0 proposed
    inputs_solar8(6)     = 2650;  % Maximum number of heliostats
    inputs_solar8(10)     = 36;    % Receiver number of tubes
end

% Create input file with x coordinates:
pid = feature('getpid');
input_file_name = 'solar8_tmp_x_';
input_file_name = strcat(input_file_name,int2str(pid),'.txt');
input_file = fopen(input_file_name,'w');
fprintf ( input_file , '%.15f\n' , inputs_solar8 );
fclose(input_file);

% launch the simulation:
output_file_name = 'solar8_tmp_f_';
output_file_name = strcat(output_file_name,int2str(pid),'.txt');

cmd  = sprintf ( '%s%s%s%s' , 'solar_problem.exe 8 ' , input_file_name , ' > ' , output_file_name );
flag = system(cmd);

if ( flag == 1 )
    C = ones(9,p) * inf;
    return
end

% get the result:
output_file = fopen ( output_file_name,'r');
F = fscanf(output_file,'%f%f');
fclose(output_file);

% erase the input and output files:
delete(input_file_name);
delete(output_file_name);

% check the output (may be 'ERROR X')
if size(F,1)~=11 || size(F,2)~=1
    C = ones(9,p) * inf;
    return
end

if ~isempty(F)
    C = F(3:11)';
end

return