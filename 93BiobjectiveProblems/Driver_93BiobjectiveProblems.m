clear;
clear;
%% Constraint C1
problem(1).name   = 'FES1';
problem(1).lbound = zeros(10,1);
problem(1).ubound = ones(10,1);
problem(1).x_ini  = ones(10,1);
problem(1).Constraint = 'C1';

problem(2).name   = 'Kursawe';
problem(2).lbound = -5*ones(3,1);
problem(2).ubound = 5*ones(3,1);
problem(2).x_ini  = ones(3,1);
problem(2).Constraint = 'C1';

problem(3).name   = 'L1ZDT4';
problem(3).lbound = [0 -5*ones(1,9)]';
problem(3).ubound = [1 5*ones(1,9)]';
problem(3).x_ini  = ones(10,1);
problem(3).Constraint = 'C1';

problem(4).name   = 'L2ZDT1';
problem(4).lbound = zeros(30,1);
problem(4).ubound = ones(30,1);
problem(4).x_ini  = ones(30,1);
problem(4).Constraint = 'C1';

problem(5).name   = 'L2ZDT2';
problem(5).lbound = zeros(30,1);
problem(5).ubound = ones(30,1);
problem(5).x_ini  = ones(30,1);
problem(5).Constraint = 'C1';

problem(6).name   = 'L2ZDT3';
problem(6).lbound = zeros(30,1);
problem(6).ubound = ones(30,1);
problem(6).x_ini  = ones(30,1);
problem(6).Constraint = 'C1';

problem(7).name   = 'L2ZDT4';
problem(7).lbound = zeros(30,1);
problem(7).ubound = ones(30,1);
problem(7).x_ini  = ones(30,1);
problem(7).Constraint = 'C1';

problem(8).name   = 'L2ZDT6';
problem(8).lbound = zeros(10,1);
problem(8).ubound = ones(10,1);
problem(8).x_ini  = ones(10,1);
problem(8).Constraint = 'C1';

problem(9).name   = 'L3ZDT1';
problem(9).lbound = zeros(30,1);
problem(9).ubound = ones(30,1);
problem(9).x_ini  = ones(30,1);
problem(9).Constraint = 'C1';

problem(10).name   = 'L3ZDT2';
problem(10).lbound = zeros(30,1);
problem(10).ubound = ones(30,1);
problem(10).x_ini  = ones(30,1);
problem(10).Constraint = 'C1';

problem(11).name   = 'L3ZDT3';
problem(11).lbound = zeros(30,1);
problem(11).ubound = ones(30,1);
problem(11).x_ini  = ones(30,1);
problem(11).Constraint = 'C1';

problem(12).name   = 'L3ZDT4';
problem(12).lbound = zeros(30,1);
problem(12).ubound = ones(30,1);
problem(12).x_ini  = ones(30,1);
problem(12).Constraint = 'C1';

problem(13).name   = 'L3ZDT6';
problem(13).lbound = zeros(10,1);
problem(13).ubound = ones(10,1);
problem(13).x_ini  = ones(10,1);
problem(13).Constraint = 'C1';

problem(14).name   = 'MOP2';
problem(14).lbound = -4*ones(4,1);
problem(14).ubound =  4*ones(4,1);
problem(14).x_ini  = ones(4,1);
problem(14).Constraint = 'C1';

problem(15).name   = 'MOP4';
problem(15).lbound = [-5 -5 -5]';
problem(15).ubound = [ 5  5  5]';
problem(15).x_ini  = ones(3,1);
problem(15).Constraint = 'C1';

problem(16).name   = 'OKA2';
problem(16).lbound = [-pi -5 -5]';
problem(16).ubound = [pi 5 5]';
problem(16).x_ini  = ones(3,1);
problem(16).Constraint = 'C1';

problem(17).name   = 'QV1';
problem(17).lbound = -5.12*ones(10,1);
problem(17).ubound =  5.12*ones(10,1);
problem(17).x_ini  = ones(10,1);
problem(17).Constraint = 'C1';

problem(18).name   = 'SK2';
problem(18).lbound = -10*ones(4,1);
problem(18).ubound =  10*ones(4,1);
problem(18).x_ini = ones(4,1);
problem(18).Constraint = 'C1';

problem(19).name   = 'TKLY1';
problem(19).lbound = [0.1 0 0 0]' ;
problem(19).ubound = [1 1 1 1]';
problem(19).x_ini  = ones(4,1);
problem(19).Constraint = 'C1';

problem(20).name   = 'ZDT1';
problem(20).lbound = zeros(30,1);
problem(20).ubound = ones(30,1);
problem(20).x_ini  = ones(30,1);
problem(20).Constraint = 'C1';

problem(21).name   = 'ZDT2';
problem(21).lbound = zeros(30,1);
problem(21).ubound = ones(30,1);
problem(21).x_ini  = ones(30,1);
problem(21).Constraint = 'C1';

problem(22).name   = 'ZDT3';
problem(22).lbound = zeros(30,1);
problem(22).ubound = ones(30,1);
problem(22).x_ini  = ones(30,1);
problem(22).Constraint = 'C1';

problem(23).name   = 'ZDT4';
problem(23).lbound = [0, -5*ones(1,9)]';
problem(23).ubound = [1, 5*ones(1,9)]';
problem(23).x_ini  = ones(10,1);
problem(23).Constraint = 'C1';

problem(24).name   = 'ZDT6';
problem(24).lbound = zeros(10,1);
problem(24).ubound = ones(10,1);
problem(24).x_ini  = ones(10,1);
problem(24).Constraint = 'C1';

%% Constraint C2
Faux = 10;
sigma = 10;
problem(25).name = 'CL1';
problem(25).lbound = [Faux/sigma,sqrt(2)*Faux/sigma,sqrt(2)*Faux/sigma,Faux/sigma]';
problem(25).ubound = 3*Faux/sigma*ones(4,1);
problem(25).x_ini  = 2*ones(4,1);
problem(25).Constraint = 'C2';

problem(26).name   = 'Kursawe';
problem(26).lbound = -5*ones(3,1);
problem(26).ubound = 5*ones(3,1);
problem(26).x_ini  = 2*ones(3,1);
problem(26).Constraint = 'C2';

problem(27).name   = 'MOP2';
problem(27).lbound = -4*ones(4,1);
problem(27).ubound =  4*ones(4,1);
problem(27).x_ini  = 2*ones(4,1);
problem(27).Constraint = 'C2';

problem(28).name   = 'MOP4';
problem(28).lbound = [-5 -5 -5]';
problem(28).ubound = [ 5  5  5]';
problem(28).x_ini  = 2*ones(3,1);
problem(28).Constraint = 'C2';

problem(29).name   = 'OKA2';
problem(29).lbound = [-pi -5 -5]';
problem(29).ubound = [pi 5 5]';
problem(29).x_ini  = 2*ones(3,1);
problem(29).Constraint = 'C2';

problem(30).name   = 'QV1';
problem(30).lbound = -5.12*ones(10,1);
problem(30).ubound =  5.12*ones(10,1);
problem(30).x_ini  = 2*ones(10,1);
problem(30).Constraint = 'C2';

problem(31).name   = 'SK2';
problem(31).lbound = -10*ones(4,1);
problem(31).ubound =  10*ones(4,1);
problem(31).x_ini = 2*ones(4,1);
problem(31).Constraint = 'C2';

%% Constraint C3
problem(32).name   = 'FES1';
problem(32).lbound = zeros(10,1);
problem(32).ubound = ones(10,1);
problem(32).x_ini  = 0.5*ones(10,1);
problem(32).Constraint = 'C3';

problem(33).name   = 'Kursawe';
problem(33).lbound = -5*ones(3,1);
problem(33).ubound = 5*ones(3,1);
problem(33).x_ini  = 0.5*ones(3,1);
problem(33).Constraint = 'C3';

problem(34).name   = 'L1ZDT4';
problem(34).lbound = [0 -5*ones(1,9)]';
problem(34).ubound = [1 5*ones(1,9)]';
problem(34).x_ini  = 0.5*ones(10,1);
problem(34).Constraint = 'C3';

problem(35).name   = 'L2ZDT1';
problem(35).lbound = zeros(30,1);
problem(35).ubound = ones(30,1);
problem(35).x_ini  = 0.5*ones(30,1);
problem(35).Constraint = 'C3';

problem(36).name   = 'L2ZDT2';
problem(36).lbound = zeros(30,1);
problem(36).ubound = ones(30,1);
problem(36).x_ini  = 0.5*ones(30,1);
problem(36).Constraint = 'C3';

problem(37).name   = 'L2ZDT3';
problem(37).lbound = zeros(30,1);
problem(37).ubound = ones(30,1);
problem(37).x_ini  = 0.5*ones(30,1);
problem(37).Constraint = 'C3';

problem(38).name   = 'L2ZDT4';
problem(38).lbound = zeros(30,1);
problem(38).ubound = ones(30,1);
problem(38).x_ini  = 0.5*ones(30,1);
problem(38).Constraint = 'C3';

problem(39).name   = 'L2ZDT6';
problem(39).lbound = zeros(10,1);
problem(39).ubound = ones(10,1);
problem(39).x_ini  = 0.5*ones(10,1);
problem(39).Constraint = 'C3';

problem(40).name   = 'L3ZDT1';
problem(40).lbound = zeros(30,1);
problem(40).ubound = ones(30,1);
problem(40).x_ini  = 0.5*ones(30,1);
problem(40).Constraint = 'C3';

problem(41).name   = 'L3ZDT2';
problem(41).lbound = zeros(30,1);
problem(41).ubound = ones(30,1);
problem(41).x_ini  = 0.5*ones(30,1);
problem(41).Constraint = 'C3';

problem(42).name   = 'L3ZDT3';
problem(42).lbound = zeros(30,1);
problem(42).ubound = ones(30,1);
problem(42).x_ini  = 0.5*ones(30,1);
problem(42).Constraint = 'C3';

problem(43).name   = 'L3ZDT4';
problem(43).lbound = zeros(30,1);
problem(43).ubound = ones(30,1);
problem(43).x_ini  = 0.5*ones(30,1);
problem(43).Constraint = 'C3';

problem(44).name   = 'L3ZDT6';
problem(44).lbound = zeros(10,1);
problem(44).ubound = ones(10,1);
problem(44).x_ini  = 0.5*ones(10,1);
problem(44).Constraint = 'C3';

problem(45).name   = 'MOP2';
problem(45).lbound = -4*ones(4,1);
problem(45).ubound =  4*ones(4,1);
problem(45).x_ini  = 0.5*ones(4,1);
problem(45).Constraint = 'C3';

problem(46).name   = 'MOP4';
problem(46).lbound = [-5 -5 -5]';
problem(46).ubound = [ 5  5  5]';
problem(46).x_ini  = 0.5*ones(3,1);
problem(46).Constraint = 'C3';

problem(47).name   = 'OKA2';
problem(47).lbound = [-pi -5 -5]';
problem(47).ubound = [pi 5 5]';
problem(47).x_ini  = 0.5*ones(3,1);
problem(47).Constraint = 'C3';

problem(48).name   = 'QV1';
problem(48).lbound = -5.12*ones(10,1);
problem(48).ubound =  5.12*ones(10,1);
problem(48).x_ini  = 0.5*ones(10,1);
problem(48).Constraint = 'C3';

problem(49).name   = 'SK2';
problem(49).lbound = -10*ones(4,1);
problem(49).ubound =  10*ones(4,1);
problem(49).x_ini = ones(4,1);
problem(49).Constraint = 'C3';

problem(50).name   = 'TKLY1';
problem(50).lbound = [0.1 0 0 0]' ;
problem(50).ubound = [1 1 1 1]';
problem(50).x_ini  = 0.5*ones(4,1);
problem(50).Constraint = 'C3';

problem(51).name   = 'ZDT1';
problem(51).lbound = zeros(30,1);
problem(51).ubound = ones(30,1);
problem(51).x_ini  = 0.5*ones(30,1);
problem(51).Constraint = 'C3';

problem(52).name   = 'ZDT2';
problem(52).lbound = zeros(30,1);
problem(52).ubound = ones(30,1);
problem(52).x_ini  = 0.5*ones(30,1);
problem(52).Constraint = 'C3';

problem(53).name   = 'ZDT3';
problem(53).lbound = zeros(30,1);
problem(53).ubound = ones(30,1);
problem(53).x_ini  = 0.5*ones(30,1);
problem(53).Constraint = 'C3';

problem(54).name   = 'ZDT4';
problem(54).lbound = [0, -5*ones(1,9)]';
problem(54).ubound = [1, 5*ones(1,9)]';
problem(54).x_ini  = 0.5*ones(10,1);
problem(54).Constraint = 'C3';

problem(55).name   = 'ZDT6';
problem(55).lbound = zeros(10,1);
problem(55).ubound = ones(10,1);
problem(55).x_ini  = 0.5*ones(10,1);
problem(55).Constraint = 'C3';

%% Constraint C4
problem(56).name = 'DPAM1';
problem(56).lbound = -0.3*ones(10,1);
problem(56).ubound = 0.3*ones(10,1);
problem(56).x_ini  = zeros(10,1);
problem(56).Constraint = 'C4';

problem(57).name   = 'FES1';
problem(57).lbound = zeros(10,1);
problem(57).ubound = ones(10,1);
problem(57).x_ini  = zeros(10,1);
problem(57).Constraint = 'C4';

problem(58).name   = 'Kursawe';
problem(58).lbound = -5*ones(3,1);
problem(58).ubound = 5*ones(3,1);
problem(58).x_ini  = zeros(3,1);
problem(58).Constraint = 'C4';

problem(59).name   = 'L1ZDT4';
problem(59).lbound = [0 -5*ones(1,9)]';
problem(59).ubound = [1 5*ones(1,9)]';
problem(59).x_ini  = zeros(10,1);
problem(59).Constraint = 'C4';

problem(60).name   = 'L2ZDT1';
problem(60).lbound = zeros(30,1);
problem(60).ubound = ones(30,1);
problem(60).x_ini  = zeros(30,1);
problem(60).Constraint = 'C4';

problem(61).name   = 'L2ZDT2';
problem(61).lbound = zeros(30,1);
problem(61).ubound = ones(30,1);
problem(61).x_ini  = zeros(30,1);
problem(61).Constraint = 'C4';

problem(62).name   = 'L2ZDT3';
problem(62).lbound = zeros(30,1);
problem(62).ubound = ones(30,1);
problem(62).x_ini  = zeros(30,1);
problem(62).Constraint = 'C4';

problem(63).name   = 'L2ZDT4';
problem(63).lbound = zeros(30,1);
problem(63).ubound = ones(30,1);
problem(63).x_ini  = zeros(30,1);
problem(63).Constraint = 'C4';

problem(64).name   = 'L2ZDT6';
problem(64).lbound = zeros(10,1);
problem(64).ubound = ones(10,1);
problem(64).x_ini  = zeros(10,1);
problem(64).Constraint = 'C4';

problem(65).name   = 'L3ZDT1';
problem(65).lbound = zeros(30,1);
problem(65).ubound = ones(30,1);
problem(65).x_ini  = zeros(30,1);
problem(65).Constraint = 'C4';

problem(66).name   = 'L3ZDT2';
problem(66).lbound = zeros(30,1);
problem(66).ubound = ones(30,1);
problem(66).x_ini  = zeros(30,1);
problem(66).Constraint = 'C4';

problem(67).name   = 'L3ZDT3';
problem(67).lbound = zeros(30,1);
problem(67).ubound = ones(30,1);
problem(67).x_ini  = zeros(30,1);
problem(67).Constraint = 'C4';

problem(68).name   = 'L3ZDT4';
problem(68).lbound = zeros(30,1);
problem(68).ubound = ones(30,1);
problem(68).x_ini  = zeros(30,1);
problem(68).Constraint = 'C4';

problem(69).name   = 'L3ZDT6';
problem(69).lbound = zeros(10,1);
problem(69).ubound = ones(10,1);
problem(69).x_ini  = zeros(10,1);
problem(69).Constraint = 'C4';

problem(70).name   = 'MOP2';
problem(70).lbound = -4*ones(4,1);
problem(70).ubound =  4*ones(4,1);
problem(70).x_ini  = zeros(4,1);
problem(70).Constraint = 'C4';

problem(71).name   = 'MOP4';
problem(71).lbound = [-5 -5 -5]';
problem(71).ubound = [ 5  5  5]';
problem(71).x_ini  = zeros(3,1);
problem(71).Constraint = 'C4';

problem(72).name   = 'OKA2';
problem(72).lbound = [-pi -5 -5]';
problem(72).ubound = [pi 5 5]';
problem(72).x_ini  = zeros(3,1);
problem(72).Constraint = 'C4';

problem(73).name   = 'QV1';
problem(73).lbound = -5.12*ones(10,1);
problem(73).ubound =  5.12*ones(10,1);
problem(73).x_ini  = zeros(10,1);
problem(73).Constraint = 'C4';

problem(74).name   = 'SK2';
problem(74).lbound = -10*ones(4,1);
problem(74).ubound =  10*ones(4,1);
problem(74).x_ini = zeros(4,1);
problem(74).Constraint = 'C4';

problem(75).name   = 'ZDT1';
problem(75).lbound = zeros(30,1);
problem(75).ubound = ones(30,1);
problem(75).x_ini  = zeros(30,1);
problem(75).Constraint = 'C4';

problem(76).name   = 'ZDT2';
problem(76).lbound = zeros(30,1);
problem(76).ubound = ones(30,1);
problem(76).x_ini  = zeros(30,1);
problem(76).Constraint = 'C4';

problem(77).name   = 'ZDT3';
problem(77).lbound = zeros(30,1);
problem(77).ubound = ones(30,1);
problem(77).x_ini  = zeros(30,1);
problem(77).Constraint = 'C4';

problem(78).name   = 'ZDT4';
problem(78).lbound = [0, -5*ones(1,9)]';
problem(78).ubound = [1, 5*ones(1,9)]';
problem(78).x_ini  = zeros(10,1);
problem(78).Constraint = 'C4';

problem(79).name   = 'ZDT6';
problem(79).lbound = zeros(10,1);
problem(79).ubound = ones(10,1);
problem(79).x_ini  = zeros(10,1);
problem(79).Constraint = 'C4';

%% Constraint C5
Faux = 10;
sigma = 10;
problem(80).name = 'CL1';
problem(80).lbound = [Faux/sigma,sqrt(2)*Faux/sigma,sqrt(2)*Faux/sigma,Faux/sigma]';
problem(80).ubound = 3*Faux/sigma*ones(4,1);
problem(80).x_ini  = 2*ones(4,1);
problem(80).Constraint = 'C5';

problem(81).name   = 'Kursawe';
problem(81).lbound = -5*ones(3,1);
problem(81).ubound = 5*ones(3,1);
problem(81).x_ini  = 2*ones(3,1);
problem(81).Constraint = 'C5';

problem(82).name   = 'MOP2';
problem(82).lbound = -4*ones(4,1);
problem(82).ubound =  4*ones(4,1);
problem(82).x_ini  = 2*ones(4,1);
problem(82).Constraint = 'C5';

problem(83).name   = 'MOP4';
problem(83).lbound = [-5 -5 -5]';
problem(83).ubound = [ 5  5  5]';
problem(83).x_ini  = 2*ones(3,1);
problem(83).Constraint = 'C5';

problem(84).name   = 'OKA2';
problem(84).lbound = [-pi -5 -5]';
problem(84).ubound = [pi 5 5]';
problem(84).x_ini  = 2*ones(3,1);
problem(84).Constraint = 'C5';

problem(85).name   = 'QV1';
problem(85).lbound = -5.12*ones(10,1);
problem(85).ubound =  5.12*ones(10,1);
problem(85).x_ini  = 2*ones(10,1);
problem(85).Constraint = 'C5';

problem(86).name   = 'SK2';
problem(86).lbound = -10*ones(4,1);
problem(86).ubound =  10*ones(4,1);
problem(86).x_ini = 2*ones(4,1);
problem(86).Constraint = 'C5';

%% Constraint 6
Faux = 10;
sigma = 10;
problem(87).name = 'CL1';
problem(87).lbound = [Faux/sigma,sqrt(2)*Faux/sigma,sqrt(2)*Faux/sigma,Faux/sigma]';
problem(87).ubound = 3*Faux/sigma*ones(4,1);
problem(87).x_ini  = 2*ones(4,1);
problem(87).Constraint = 'C6';

problem(88).name   = 'Kursawe';
problem(88).lbound = -5*ones(3,1);
problem(88).ubound = 5*ones(3,1);
problem(88).x_ini  = 2*ones(3,1);
problem(88).Constraint = 'C6';

problem(89).name   = 'MOP2';
problem(89).lbound = -4*ones(4,1);
problem(89).ubound =  4*ones(4,1);
problem(89).x_ini  = 2*ones(4,1);
problem(89).Constraint = 'C6';

problem(90).name   = 'MOP4';
problem(90).lbound = [-5 -5 -5]';
problem(90).ubound = [ 5  5  5]';
problem(90).x_ini  = 2*ones(3,1);
problem(90).Constraint = 'C6';

problem(91).name   = 'OKA2';
problem(91).lbound = [-pi -5 -5]';
problem(91).ubound = [pi 5 5]';
problem(91).x_ini  = 2*ones(3,1);
problem(91).Constraint = 'C6';

problem(92).name   = 'QV1';
problem(92).lbound = -5.12*ones(10,1);
problem(92).ubound =  5.12*ones(10,1);
problem(92).x_ini  = 2*ones(10,1);
problem(92).Constraint = 'C6';

problem(93).name   = 'SK2';
problem(93).lbound = -10*ones(4,1);
problem(93).ubound =  10*ones(4,1);
problem(93).x_ini = 2*ones(4,1);
problem(93).Constraint = 'C6';

format compact;

%%_______________________________________________________________________

nprobs=93;
fp = fopen('Results\DMSFILTERIR_5000.m','wt');     % instrucao Windows
% fp =fopen('Results/DMSFILTERIR_500.m','wt');      % instrucao Linux

func_evals=zeros(nprobs,1);
contador=zeros(nprobs,1);
for i=1:nprobs
   fprintf('==================  Problema %3d ================== \n' ,i)
   fprintf(fp,'DMSFILTERIR_5000_%s_%s=[',problem(i).name,problem(i).Constraint);
   file_cache = ['DMSFILTERIR_5000_' problem(i).name '_' problem(i).Constraint '_cache.txt'];   
   lb     = problem(i).lbound;
   ub     = problem(i).ubound;   
   xi     = problem(i).x_ini;
   func_F = problem(i).name;
   func_C = problem(i).Constraint;
   
   [Plist_F,f,alfa_F,func_eval] = dms_filter_IR(1,func_F,[],file_cache,[],lb,ub,func_C);

   
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
% End driver