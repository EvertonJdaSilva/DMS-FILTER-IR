clear;
%% Constraint C1
problem(1).name   = 'DTLZ1';
problem(1).lbound = zeros(7,1);
problem(1).ubound = ones(7,1);
problem(1).x_ini  = ones(7,1);
problem(1).Constraint = 'C1';
problem(1).grad_Constraint = 'grad_C1';

problem(2).name   = 'DTLZ2';
problem(2).lbound = zeros(12,1);
problem(2).ubound = ones(12,1);
problem(2).x_ini  = ones(12,1);
problem(2).Constraint = 'C1';
problem(2).grad_Constraint = 'grad_C1';

problem(3).name   = 'DTLZ3';
problem(3).lbound = zeros(12,1);
problem(3).ubound = ones(12,1);
problem(3).x_ini  = ones(12,1);
problem(3).Constraint = 'C1';
problem(3).grad_Constraint = 'grad_C1';

problem(4).name   = 'DTLZ4';
problem(4).lbound = zeros(12,1);
problem(4).ubound = ones(12,1);
problem(4).x_ini  = ones(12,1);
problem(4).Constraint = 'C1';
problem(4).grad_Constraint = 'grad_C1';

problem(5).name   = 'DTLZ5';
problem(5).lbound = zeros(12,1);
problem(5).ubound = ones(12,1);
problem(5).x_ini  = ones(12,1);
problem(5).Constraint = 'C1';
problem(5).grad_Constraint = 'grad_C1';

problem(6).name   = 'DTLZ6';
problem(6).lbound = zeros(22,1);
problem(6).ubound = ones(22,1);
problem(6).x_ini  = ones(22,1);
problem(6).Constraint = 'C1';
problem(6).grad_Constraint = 'grad_C1';

problem(7).name   = 'FES1';
problem(7).lbound = zeros(10,1);
problem(7).ubound = ones(10,1);
problem(7).x_ini  = ones(10,1);
problem(7).Constraint = 'C1';
problem(7).grad_Constraint = 'grad_C1';

problem(8).name   = 'FES2';
problem(8).lbound = zeros(10,1);
problem(8).ubound = ones(10,1);
problem(8).x_ini  = ones(10,1);
problem(8).Constraint = 'C1';
problem(8).grad_Constraint = 'grad_C1';

problem(9).name   = 'FES3';
problem(9).lbound = zeros(10,1);
problem(9).ubound = ones(10,1);
problem(9).x_ini  = ones(10,1);
problem(9).Constraint = 'C1';
problem(9).grad_Constraint = 'grad_C1';

problem(10).name   = 'I1';
problem(10).lbound = zeros(8,1);
problem(10).ubound = ones(8,1);
problem(10).x_ini  = ones(8,1);
problem(10).Constraint = 'C1';
problem(10).grad_Constraint = 'grad_C1';

problem(11).name   = 'I2';
problem(11).lbound = zeros(8,1);
problem(11).ubound = ones(8,1);
problem(11).x_ini  = ones(8,1);
problem(11).Constraint = 'C1';
problem(11).grad_Constraint = 'grad_C1';

problem(12).name   = 'I3';
problem(12).lbound = zeros(8,1);
problem(12).ubound = ones(8,1);
problem(12).x_ini  = ones(8,1);
problem(12).Constraint = 'C1';
problem(12).grad_Constraint = 'grad_C1';

problem(13).name   = 'I4';
problem(13).lbound = zeros(8,1);
problem(13).ubound = ones(8,1);
problem(13).x_ini  = ones(8,1);
problem(13).Constraint = 'C1';
problem(13).grad_Constraint = 'grad_C1';

problem(14).name   = 'I5';
problem(14).lbound = zeros(8,1);
problem(14).ubound = ones(8,1);
problem(14).x_ini  = ones(8,1);
problem(14).Constraint = 'C1';
problem(14).grad_Constraint = 'grad_C1';

problem(15).name   = 'Kursawe';
problem(15).lbound = -5*ones(3,1);
problem(15).ubound = 5*ones(3,1);
problem(15).x_ini  = ones(3,1);
problem(15).Constraint = 'C1';
problem(15).grad_Constraint = 'grad_C1';

problem(16).name   = 'L1ZDT4';
problem(16).lbound = [0 -5*ones(1,9)]';
problem(16).ubound = [1 5*ones(1,9)]';
problem(16).x_ini  = ones(10,1);
problem(16).Constraint = 'C1';
problem(16).grad_Constraint = 'grad_C1';

problem(17).name   = 'L2ZDT1';
problem(17).lbound = zeros(30,1);
problem(17).ubound = ones(30,1);
problem(17).x_ini  = ones(30,1);
problem(17).Constraint = 'C1';
problem(17).grad_Constraint = 'grad_C1';

problem(18).name   = 'L2ZDT2';
problem(18).lbound = zeros(30,1);
problem(18).ubound = ones(30,1);
problem(18).x_ini  = ones(30,1);
problem(18).Constraint = 'C1';
problem(18).grad_Constraint = 'grad_C1';

problem(19).name   = 'L2ZDT3';
problem(19).lbound = zeros(30,1);
problem(19).ubound = ones(30,1);
problem(19).x_ini  = ones(30,1);
problem(19).Constraint = 'C1';
problem(19).grad_Constraint = 'grad_C1';

problem(20).name   = 'L2ZDT4';
problem(20).lbound = zeros(30,1);
problem(20).ubound = ones(30,1);
problem(20).x_ini  = ones(30,1);
problem(20).Constraint = 'C1';
problem(20).grad_Constraint = 'grad_C1';

problem(21).name   = 'L2ZDT6';
problem(21).lbound = zeros(10,1);
problem(21).ubound = ones(10,1);
problem(21).x_ini  = ones(10,1);
problem(21).Constraint = 'C1';
problem(21).grad_Constraint = 'grad_C1';

problem(22).name   = 'L3ZDT1';
problem(22).lbound = zeros(30,1);
problem(22).ubound = ones(30,1);
problem(22).x_ini  = ones(30,1);
problem(22).Constraint = 'C1';
problem(22).grad_Constraint = 'grad_C1';

problem(23).name   = 'L3ZDT2';
problem(23).lbound = zeros(30,1);
problem(23).ubound = ones(30,1);
problem(23).x_ini  = ones(30,1);
problem(23).Constraint = 'C1';
problem(23).grad_Constraint = 'grad_C1';

problem(24).name   = 'L3ZDT3';
problem(24).lbound = zeros(30,1);
problem(24).ubound = ones(30,1);
problem(24).x_ini  = ones(30,1);
problem(24).Constraint = 'C1';
problem(24).grad_Constraint = 'grad_C1';

problem(25).name   = 'L3ZDT4';
problem(25).lbound = zeros(30,1);
problem(25).ubound = ones(30,1);
problem(25).x_ini  = ones(30,1);
problem(25).Constraint = 'C1';
problem(25).grad_Constraint = 'grad_C1';

problem(26).name   = 'L3ZDT6';
problem(26).lbound = zeros(10,1);
problem(26).ubound = ones(10,1);
problem(26).x_ini  = ones(10,1);
problem(26).Constraint = 'C1';
problem(26).grad_Constraint = 'grad_C1';

problem(27).name   = 'lovison5';
problem(27).lbound = [-1 -1 -1]';
problem(27).ubound = [4 4 4]';
problem(27).x_ini  = ones(3,1) ;
problem(27).Constraint = 'C1';
problem(27).grad_Constraint = 'grad_C1';

problem(28).name   = 'lovison6';
problem(28).lbound = [-1 -1 -1]';
problem(28).ubound = [4 4 4]';
problem(28).x_ini  = ones(3,1);
problem(28).Constraint = 'C1';
problem(28).grad_Constraint = 'grad_C1';

problem(29).name   = 'MOP2';
problem(29).lbound = -4*ones(4,1);
problem(29).ubound =  4*ones(4,1);
problem(29).x_ini  = ones(4,1);
problem(29).Constraint = 'C1';
problem(29).grad_Constraint = 'grad_C1';

problem(30).name   = 'MOP4';
problem(30).lbound = [-5 -5 -5]';
problem(30).ubound = [ 5  5  5]';
problem(30).x_ini  = ones(3,1);
problem(30).Constraint = 'C1';
problem(30).grad_Constraint = 'grad_C1';

problem(31).name   = 'OKA2';
problem(31).lbound = [-pi -5 -5]';
problem(31).ubound = [pi 5 5]';
problem(31).x_ini  = ones(3,1);
problem(31).Constraint = 'C1';
problem(31).grad_Constraint = 'grad_C1';

problem(32).name   = 'QV1';
problem(32).lbound = -5.12*ones(10,1);
problem(32).ubound =  5.12*ones(10,1);
problem(32).x_ini  = ones(10,1);
problem(32).Constraint = 'C1';
problem(32).grad_Constraint = 'grad_C1';

problem(33).name   = 'SK2';
problem(33).lbound = -10*ones(4,1);
problem(33).ubound =  10*ones(4,1);
problem(33).x_ini = ones(4,1);
problem(33).Constraint = 'C1';
problem(33).grad_Constraint = 'grad_C1';

problem(34).name   = 'TKLY1';
problem(34).lbound = [0.1 0 0 0]' ;
problem(34).ubound = [1 1 1 1]';
problem(34).x_ini  = ones(4,1);
problem(34).Constraint = 'C1';
problem(34).grad_Constraint = 'grad_C1';

zmax=zeros(1,8);
for j=1:8
 zmax(j)=2*j;
end
problem(35).name   = 'WFG1';
problem(35).lbound = zeros(8,1);
problem(35).ubound = zmax';
problem(35).x_ini  = ones(8,1);
problem(35).Constraint = 'C1';
problem(35).grad_Constraint = 'grad_C1';

problem(36).name   = 'WFG2';
problem(36).lbound = zeros(8,1);
problem(36).ubound = zmax';
problem(36).x_ini  = ones(8,1);
problem(36).Constraint = 'C1';
problem(36).grad_Constraint = 'grad_C1';

problem(37).name   = 'WFG3';
problem(37).lbound = zeros(8,1);
problem(37).ubound = zmax';
problem(37).x_ini  = ones(8,1);
problem(37).Constraint = 'C1';
problem(37).grad_Constraint = 'grad_C1';

problem(38).name   = 'WFG4';
problem(38).lbound = zeros(8,1);
problem(38).ubound = zmax';
problem(38).x_ini  = ones(8,1);
problem(38).Constraint = 'C1';
problem(38).grad_Constraint = 'grad_C1';

problem(39).name   = 'WFG5';
problem(39).lbound = zeros(8,1);
problem(39).ubound = zmax';
problem(39).x_ini  = ones(8,1);
problem(39).Constraint = 'C1';
problem(39).grad_Constraint = 'grad_C1';

problem(40).name   = 'WFG6';
problem(40).lbound = zeros(8,1);
problem(40).ubound = zmax';
problem(40).x_ini  = ones(8,1);
problem(40).Constraint = 'C1';
problem(40).grad_Constraint = 'grad_C1';

problem(41).name   = 'WFG7';
problem(41).lbound = zeros(8,1);
problem(41).ubound = zmax';
problem(41).x_ini  = ones(8,1);
problem(41).Constraint = 'C1';
problem(41).grad_Constraint = 'grad_C1';

problem(42).name   = 'WFG8';
problem(42).lbound = zeros(8,1);
problem(42).ubound = zmax';
problem(42).x_ini  = ones(8,1);
problem(42).Constraint = 'C1';
problem(42).grad_Constraint = 'grad_C1';

problem(43).name   = 'WFG9';
problem(43).lbound = zeros(8,1);
problem(43).ubound = zmax';
problem(43).x_ini  = ones(8,1);
problem(43).Constraint = 'C1';
problem(43).grad_Constraint = 'grad_C1';

problem(44).name   = 'ZDT1';
problem(44).lbound = zeros(30,1);
problem(44).ubound = ones(30,1);
problem(44).x_ini  = ones(30,1);
problem(44).Constraint = 'C1';
problem(44).grad_Constraint = 'grad_C1';

problem(45).name   = 'ZDT2';
problem(45).lbound = zeros(30,1);
problem(45).ubound = ones(30,1);
problem(45).x_ini  = ones(30,1);
problem(45).Constraint = 'C1';
problem(45).grad_Constraint = 'grad_C1';

problem(46).name   = 'ZDT3';
problem(46).lbound = zeros(30,1);
problem(46).ubound = ones(30,1);
problem(46).x_ini  = ones(30,1);
problem(46).Constraint = 'C1';
problem(46).grad_Constraint = 'grad_C1';

problem(47).name   = 'ZDT4';
problem(47).lbound = [0, -5*ones(1,9)]';
problem(47).ubound = [1, 5*ones(1,9)]';
problem(47).x_ini  = ones(10,1);
problem(47).Constraint = 'C1';
problem(47).grad_Constraint = 'grad_C1';

problem(48).name   = 'ZDT6';
problem(48).lbound = zeros(10,1);
problem(48).ubound = ones(10,1);
problem(48).x_ini  = ones(10,1);
problem(48).Constraint = 'C1';
problem(48).grad_Constraint = 'grad_C1';

problem(49).name   = 'ZLT1';
problem(49).lbound = -1000*ones(10,1);
problem(49).ubound = 1000*ones(10,1);
problem(49).x_ini  = ones(10,1);
problem(49).Constraint = 'C1';
problem(49).grad_Constraint = 'grad_C1';

%% Constraint C2
Faux = 10;
sigma = 10;
problem(50).name = 'CL1';
problem(50).lbound = [Faux/sigma,sqrt(2)*Faux/sigma,sqrt(2)*Faux/sigma,Faux/sigma]';
problem(50).ubound = 3*Faux/sigma*ones(4,1);
problem(50).x_ini  = 2*ones(4,1);
problem(50).Constraint = 'C2';
problem(50).grad_Constraint = 'grad_C2';

problem(51).name   = 'Kursawe';
problem(51).lbound = -5*ones(3,1);
problem(51).ubound = 5*ones(3,1);
problem(51).x_ini  = 2*ones(3,1);
problem(51).Constraint = 'C2';
problem(51).grad_Constraint = 'grad_C2';

problem(52).name   = 'lovison5';
problem(52).lbound = [-1 -1 -1]';
problem(52).ubound = [4 4 4]';
problem(52).x_ini  = 2*ones(3,1) ;
problem(52).Constraint = 'C2';
problem(52).grad_Constraint = 'grad_C2';

problem(53).name   = 'lovison6';
problem(53).lbound = [-1 -1 -1]';
problem(53).ubound = [4 4 4]';
problem(53).x_ini  = 2*ones(3,1);
problem(53).Constraint = 'C2';
problem(53).grad_Constraint = 'grad_C2';

problem(54).name   = 'MOP2';
problem(54).lbound = -4*ones(4,1);
problem(54).ubound =  4*ones(4,1);
problem(54).x_ini  = 2*ones(4,1);
problem(54).Constraint = 'C2';
problem(54).grad_Constraint = 'grad_C2';

problem(55).name   = 'MOP4';
problem(55).lbound = [-5 -5 -5]';
problem(55).ubound = [ 5  5  5]';
problem(55).x_ini  = 2*ones(3,1);
problem(55).Constraint = 'C2';
problem(55).grad_Constraint = 'grad_C2';

problem(56).name   = 'OKA2';
problem(56).lbound = [-pi -5 -5]';
problem(56).ubound = [pi 5 5]';
problem(56).x_ini  = 2*ones(3,1);
problem(56).Constraint = 'C2';
problem(56).grad_Constraint = 'grad_C2';

problem(57).name   = 'QV1';
problem(57).lbound = -5.12*ones(10,1);
problem(57).ubound =  5.12*ones(10,1);
problem(57).x_ini  = 2*ones(10,1);
problem(57).Constraint = 'C2';
problem(57).grad_Constraint = 'grad_C2';

problem(58).name   = 'SK2';
problem(58).lbound = -10*ones(4,1);
problem(58).ubound =  10*ones(4,1);
problem(58).x_ini = 2*ones(4,1);
problem(58).Constraint = 'C2';
problem(58).grad_Constraint = 'grad_C2';

% for j=1:8
%  zmax(j)=2*j;
% end
problem(59).name   = 'WFG1';
problem(59).lbound = zeros(8,1);
problem(59).ubound = zmax';
problem(59).x_ini  = 2*ones(8,1);
problem(59).Constraint = 'C2';
problem(59).grad_Constraint = 'grad_C2';

problem(60).name   = 'WFG2';
problem(60).lbound = zeros(8,1);
problem(60).ubound = zmax';
problem(60).x_ini  = 2*ones(8,1);
problem(60).Constraint = 'C2';
problem(60).grad_Constraint = 'grad_C2';

problem(61).name   = 'WFG3';
problem(61).lbound = zeros(8,1);
problem(61).ubound = zmax';
problem(61).x_ini  = 2*ones(8,1);
problem(61).Constraint = 'C2';
problem(61).grad_Constraint = 'grad_C2';

problem(62).name   = 'WFG4';
problem(62).lbound = zeros(8,1);
problem(62).ubound = zmax';
problem(62).x_ini  = 2*ones(8,1);
problem(62).Constraint = 'C2';
problem(62).grad_Constraint = 'grad_C2';

problem(63).name   = 'WFG5';
problem(63).lbound = zeros(8,1);
problem(63).ubound = zmax';
problem(63).x_ini  = 2*ones(8,1);
problem(63).Constraint = 'C2';
problem(63).grad_Constraint = 'grad_C2';

problem(64).name   = 'WFG6';
problem(64).lbound = zeros(8,1);
problem(64).ubound = zmax';
problem(64).x_ini  = 2*ones(8,1);
problem(64).Constraint = 'C2';
problem(64).grad_Constraint = 'grad_C2';

problem(65).name   = 'WFG7';
problem(65).lbound = zeros(8,1);
problem(65).ubound = zmax';
problem(65).x_ini  = 2*ones(8,1);
problem(65).Constraint = 'C2';
problem(65).grad_Constraint = 'grad_C2';

problem(66).name   = 'WFG8';
problem(66).lbound = zeros(8,1);
problem(66).ubound = zmax';
problem(66).x_ini  = 2*ones(8,1);
problem(66).Constraint = 'C2';
problem(66).grad_Constraint = 'grad_C2';

problem(67).name   = 'WFG9';
problem(67).lbound = zeros(8,1);
problem(67).ubound = zmax';
problem(67).x_ini  = 2*ones(8,1);
problem(67).Constraint = 'C2';
problem(67).grad_Constraint = 'grad_C2';

problem(68).name   = 'ZLT1';
problem(68).lbound = -1000*ones(10,1);
problem(68).ubound = 1000*ones(10,1);
problem(68).x_ini  = 2*ones(10,1);
problem(68).Constraint = 'C2';
problem(68).grad_Constraint = 'grad_C2';

%% Constraint C3
problem(69).name   = 'DTLZ1';
problem(69).lbound = zeros(7,1);
problem(69).ubound = ones(7,1);
problem(69).x_ini  = 0.5*ones(7,1);
problem(69).Constraint = 'C3';
problem(69).grad_Constraint = 'grad_C3';

problem(70).name   = 'DTLZ2';
problem(70).lbound = zeros(12,1);
problem(70).ubound = ones(12,1);
problem(70).x_ini  = 0.5*ones(12,1);
problem(70).Constraint = 'C3';
problem(70).grad_Constraint = 'grad_C3';

problem(71).name   = 'DTLZ3';
problem(71).lbound = zeros(12,1);
problem(71).ubound = ones(12,1);
problem(71).x_ini  = 0.5*ones(12,1);
problem(71).Constraint = 'C3';
problem(71).grad_Constraint = 'grad_C3';

problem(72).name   = 'DTLZ4';
problem(72).lbound = zeros(12,1);
problem(72).ubound = ones(12,1);
problem(72).x_ini  = 0.5*ones(12,1);
problem(72).Constraint = 'C3';
problem(72).grad_Constraint = 'grad_C3';

problem(73).name   = 'DTLZ5';
problem(73).lbound = zeros(12,1);
problem(73).ubound = ones(12,1);
problem(73).x_ini  = 0.5*ones(12,1);
problem(73).Constraint = 'C3';
problem(73).grad_Constraint = 'grad_C3';

problem(74).name   = 'DTLZ6';
problem(74).lbound = zeros(22,1);
problem(74).ubound = ones(22,1);
problem(74).x_ini  = 0.5*ones(22,1);
problem(74).Constraint = 'C3';
problem(74).grad_Constraint = 'grad_C3';

problem(75).name   = 'FES1';
problem(75).lbound = zeros(10,1);
problem(75).ubound = ones(10,1);
problem(75).x_ini  = 0.5*ones(10,1);
problem(75).Constraint = 'C3';
problem(75).grad_Constraint = 'grad_C3';

problem(76).name   = 'FES2';
problem(76).lbound = zeros(10,1);
problem(76).ubound = ones(10,1);
problem(76).x_ini  = 0.5*ones(10,1);
problem(76).Constraint = 'C3';
problem(76).grad_Constraint = 'grad_C3';

problem(77).name   = 'FES3';
problem(77).lbound = zeros(10,1);
problem(77).ubound = ones(10,1);
problem(77).x_ini  = 0.5*ones(10,1);
problem(77).Constraint = 'C3';
problem(77).grad_Constraint = 'grad_C3';

problem(78).name   = 'I1';
problem(78).lbound = zeros(8,1);
problem(78).ubound = ones(8,1);
problem(78).x_ini  = 0.5*ones(8,1);
problem(78).Constraint = 'C3';
problem(78).grad_Constraint = 'grad_C3';

problem(79).name   = 'I2';
problem(79).lbound = zeros(8,1);
problem(79).ubound = ones(8,1);
problem(79).x_ini  = 0.5*ones(8,1);
problem(79).Constraint = 'C3';
problem(79).grad_Constraint = 'grad_C3';

problem(80).name   = 'I3';
problem(80).lbound = zeros(8,1);
problem(80).ubound = ones(8,1);
problem(80).x_ini  = 0.5*ones(8,1);
problem(80).Constraint = 'C3';
problem(80).grad_Constraint = 'grad_C3';

problem(81).name   = 'I4';
problem(81).lbound = zeros(8,1);
problem(81).ubound = ones(8,1);
problem(81).x_ini  = 0.5*ones(8,1);
problem(81).Constraint = 'C3';
problem(81).grad_Constraint = 'grad_C3';

problem(82).name   = 'I5';
problem(82).lbound = zeros(8,1);
problem(82).ubound = ones(8,1);
problem(82).x_ini  = 0.5*ones(8,1);
problem(82).Constraint = 'C3';
problem(82).grad_Constraint = 'grad_C3';

problem(83).name   = 'Kursawe';
problem(83).lbound = -5*ones(3,1);
problem(83).ubound = 5*ones(3,1);
problem(83).x_ini  = 0.5*ones(3,1);
problem(83).Constraint = 'C3';
problem(83).grad_Constraint = 'grad_C3';

problem(84).name   = 'L1ZDT4';
problem(84).lbound = [0 -5*ones(1,9)]';
problem(84).ubound = [1 5*ones(1,9)]';
problem(84).x_ini  = 0.5*ones(10,1);
problem(84).Constraint = 'C3';
problem(84).grad_Constraint = 'grad_C3';

problem(85).name   = 'L2ZDT1';
problem(85).lbound = zeros(30,1);
problem(85).ubound = ones(30,1);
problem(85).x_ini  = 0.5*ones(30,1);
problem(85).Constraint = 'C3';
problem(85).grad_Constraint = 'grad_C3';

problem(86).name   = 'L2ZDT2';
problem(86).lbound = zeros(30,1);
problem(86).ubound = ones(30,1);
problem(86).x_ini  = 0.5*ones(30,1);
problem(86).Constraint = 'C3';
problem(86).grad_Constraint = 'grad_C3';

problem(87).name   = 'L2ZDT3';
problem(87).lbound = zeros(30,1);
problem(87).ubound = ones(30,1);
problem(87).x_ini  = 0.5*ones(30,1);
problem(87).Constraint = 'C3';
problem(87).grad_Constraint = 'grad_C3';

problem(88).name   = 'L2ZDT4';
problem(88).lbound = zeros(30,1);
problem(88).ubound = ones(30,1);
problem(88).x_ini  = 0.5*ones(30,1);
problem(88).Constraint = 'C3';
problem(88).grad_Constraint = 'grad_C3';

problem(89).name   = 'L2ZDT6';
problem(89).lbound = zeros(10,1);
problem(89).ubound = ones(10,1);
problem(89).x_ini  = 0.5*ones(10,1);
problem(89).Constraint = 'C3';
problem(89).grad_Constraint = 'grad_C3';

problem(90).name   = 'L3ZDT1';
problem(90).lbound = zeros(30,1);
problem(90).ubound = ones(30,1);
problem(90).x_ini  = 0.5*ones(30,1);
problem(90).Constraint = 'C3';
problem(90).grad_Constraint = 'grad_C3';

problem(91).name   = 'L3ZDT2';
problem(91).lbound = zeros(30,1);
problem(91).ubound = ones(30,1);
problem(91).x_ini  = 0.5*ones(30,1);
problem(91).Constraint = 'C3';
problem(91).grad_Constraint = 'grad_C3';

problem(92).name   = 'L3ZDT3';
problem(92).lbound = zeros(30,1);
problem(92).ubound = ones(30,1);
problem(92).x_ini  = 0.5*ones(30,1);
problem(92).Constraint = 'C3';
problem(92).grad_Constraint = 'grad_C3';

problem(93).name   = 'L3ZDT4';
problem(93).lbound = zeros(30,1);
problem(93).ubound = ones(30,1);
problem(93).x_ini  = 0.5*ones(30,1);
problem(93).Constraint = 'C3';
problem(93).grad_Constraint = 'grad_C3';

problem(94).name   = 'L3ZDT6';
problem(94).lbound = zeros(10,1);
problem(94).ubound = ones(10,1);
problem(94).x_ini  = 0.5*ones(10,1);
problem(94).Constraint = 'C3';
problem(94).grad_Constraint = 'grad_C3';

problem(95).name   = 'lovison5';
problem(95).lbound = [-1 -1 -1]';
problem(95).ubound = [4 4 4]';
problem(95).x_ini  = 0.5*ones(3,1) ;
problem(95).Constraint = 'C3';
problem(95).grad_Constraint = 'grad_C3';

problem(96).name   = 'lovison6';
problem(96).lbound = [-1 -1 -1]';
problem(96).ubound = [4 4 4]';
problem(96).x_ini  = 0.5*ones(3,1);
problem(96).Constraint = 'C3';
problem(96).grad_Constraint = 'grad_C3';

problem(97).name   = 'MOP2';
problem(97).lbound = -4*ones(4,1);
problem(97).ubound =  4*ones(4,1);
problem(97).x_ini  = 0.5*ones(4,1);
problem(97).Constraint = 'C3';
problem(97).grad_Constraint = 'grad_C3';

problem(98).name   = 'MOP4';
problem(98).lbound = [-5 -5 -5]';
problem(98).ubound = [ 5  5  5]';
problem(98).x_ini  = 0.5*ones(3,1);
problem(98).Constraint = 'C3';
problem(98).grad_Constraint = 'grad_C3';

problem(99).name   = 'OKA2';
problem(99).lbound = [-pi -5 -5]';
problem(99).ubound = [pi 5 5]';
problem(99).x_ini  = 0.5*ones(3,1);
problem(99).Constraint = 'C3';
problem(99).grad_Constraint = 'grad_C3';

problem(100).name   = 'QV1';
problem(100).lbound = -5.12*ones(10,1);
problem(100).ubound =  5.12*ones(10,1);
problem(100).x_ini  = 0.5*ones(10,1);
problem(100).Constraint = 'C3';
problem(100).grad_Constraint = 'grad_C3';

problem(101).name   = 'SK2';
problem(101).lbound = -10*ones(4,1);
problem(101).ubound =  10*ones(4,1);
problem(101).x_ini = ones(4,1);
problem(101).Constraint = 'C3';
problem(101).grad_Constraint = 'grad_C3';

problem(102).name   = 'TKLY1';
problem(102).lbound = [0.1 0 0 0]' ;
problem(102).ubound = [1 1 1 1]';
problem(102).x_ini  = 0.5*ones(4,1);
problem(102).Constraint = 'C3';
problem(102).grad_Constraint = 'grad_C3';

% for j=1:8
%  zmax(j)=2*j;
% end
problem(103).name   = 'WFG1';
problem(103).lbound = zeros(8,1);
problem(103).ubound = zmax';
problem(103).x_ini  = 0.5*ones(8,1);
problem(103).Constraint = 'C3';
problem(103).grad_Constraint = 'grad_C3';

problem(104).name   = 'WFG2';
problem(104).lbound = zeros(8,1);
problem(104).ubound = zmax';
problem(104).x_ini  = 0.5*ones(8,1);
problem(104).Constraint = 'C3';
problem(104).grad_Constraint = 'grad_C3';

problem(105).name   = 'WFG3';
problem(105).lbound = zeros(8,1);
problem(105).ubound = zmax';
problem(105).x_ini  = 0.5*ones(8,1);
problem(105).Constraint = 'C3';
problem(105).grad_Constraint = 'grad_C3';

problem(106).name   = 'WFG4';
problem(106).lbound = zeros(8,1);
problem(106).ubound = zmax';
problem(106).x_ini  = 0.5*ones(8,1);
problem(106).Constraint = 'C3';
problem(106).grad_Constraint = 'grad_C3';

problem(107).name   = 'WFG5';
problem(107).lbound = zeros(8,1);
problem(107).ubound = zmax';
problem(107).x_ini  = 0.5*ones(8,1);
problem(107).Constraint = 'C3';
problem(107).grad_Constraint = 'grad_C3';

problem(108).name   = 'WFG6';
problem(108).lbound = zeros(8,1);
problem(108).ubound = zmax';
problem(108).x_ini  = 0.5*ones(8,1);
problem(108).Constraint = 'C3';
problem(108).grad_Constraint = 'grad_C3';

problem(109).name   = 'WFG7';
problem(109).lbound = zeros(8,1);
problem(109).ubound = zmax';
problem(109).x_ini  = 0.5*ones(8,1);
problem(109).Constraint = 'C3';
problem(109).grad_Constraint = 'grad_C3';

problem(110).name   = 'WFG8';
problem(110).lbound = zeros(8,1);
problem(110).ubound = zmax';
problem(110).x_ini  = 0.5*ones(8,1);
problem(110).Constraint = 'C3';
problem(110).grad_Constraint = 'grad_C3';

problem(111).name   = 'WFG9';
problem(111).lbound = zeros(8,1);
problem(111).ubound = zmax';
problem(111).x_ini  = 0.5*ones(8,1);
problem(111).Constraint = 'C3';
problem(111).grad_Constraint = 'grad_C3';

problem(112).name   = 'ZDT1';
problem(112).lbound = zeros(30,1);
problem(112).ubound = ones(30,1);
problem(112).x_ini  = 0.5*ones(30,1);
problem(112).Constraint = 'C3';
problem(112).grad_Constraint = 'grad_C3';

problem(113).name   = 'ZDT2';
problem(113).lbound = zeros(30,1);
problem(113).ubound = ones(30,1);
problem(113).x_ini  = 0.5*ones(30,1);
problem(113).Constraint = 'C3';
problem(113).grad_Constraint = 'grad_C3';

problem(114).name   = 'ZDT3';
problem(114).lbound = zeros(30,1);
problem(114).ubound = ones(30,1);
problem(114).x_ini  = 0.5*ones(30,1);
problem(114).Constraint = 'C3';
problem(114).grad_Constraint = 'grad_C3';

problem(115).name   = 'ZDT4';
problem(115).lbound = [0, -5*ones(1,9)]';
problem(115).ubound = [1, 5*ones(1,9)]';
problem(115).x_ini  = 0.5*ones(10,1);
problem(115).Constraint = 'C3';
problem(115).grad_Constraint = 'grad_C3';

problem(116).name   = 'ZDT6';
problem(116).lbound = zeros(10,1);
problem(116).ubound = ones(10,1);
problem(116).x_ini  = 0.5*ones(10,1);
problem(116).Constraint = 'C3';
problem(116).grad_Constraint = 'grad_C3';

problem(117).name   = 'ZLT1';
problem(117).lbound = -1000*ones(10,1);
problem(117).ubound = 1000*ones(10,1);
problem(117).x_ini  = 0.5*ones(10,1);
problem(117).Constraint = 'C3';
problem(117).grad_Constraint = 'grad_C3';

%% Constraint C4
problem(118).name = 'DPAM1';
problem(118).lbound = -0.3*ones(10,1);
problem(118).ubound = 0.3*ones(10,1);
problem(118).x_ini  = zeros(10,1);
problem(118).Constraint = 'C4';
problem(118).grad_Constraint = 'grad_C4';

problem(119).name   = 'DTLZ1';
problem(119).lbound = zeros(7,1);
problem(119).ubound = ones(7,1);
problem(119).x_ini  = zeros(7,1);
problem(119).Constraint = 'C4';
problem(119).grad_Constraint = 'grad_C4';

problem(120).name   = 'DTLZ2';
problem(120).lbound = zeros(12,1);
problem(120).ubound = ones(12,1);
problem(120).x_ini  = zeros(12,1);
problem(120).Constraint = 'C4';
problem(120).grad_Constraint = 'grad_C4';

problem(121).name   = 'DTLZ3';
problem(121).lbound = zeros(12,1);
problem(121).ubound = ones(12,1);
problem(121).x_ini  = zeros(12,1);
problem(121).Constraint = 'C4';
problem(121).grad_Constraint = 'grad_C4';

problem(122).name   = 'DTLZ4';
problem(122).lbound = zeros(12,1);
problem(122).ubound = ones(12,1);
problem(122).x_ini  = zeros(12,1);
problem(122).Constraint = 'C4';
problem(122).grad_Constraint = 'grad_C4';

problem(123).name   = 'DTLZ5';
problem(123).lbound = zeros(12,1);
problem(123).ubound = ones(12,1);
problem(123).x_ini  = zeros(12,1);
problem(123).Constraint = 'C4';
problem(123).grad_Constraint = 'grad_C4';

problem(124).name   = 'DTLZ6';
problem(124).lbound = zeros(22,1);
problem(124).ubound = ones(22,1);
problem(124).x_ini  = zeros(22,1);
problem(124).Constraint = 'C4';
problem(124).grad_Constraint = 'grad_C4';

problem(125).name   = 'FES1';
problem(125).lbound = zeros(10,1);
problem(125).ubound = ones(10,1);
problem(125).x_ini  = zeros(10,1);
problem(125).Constraint = 'C4';
problem(125).grad_Constraint = 'grad_C4';

problem(126).name   = 'FES2';
problem(126).lbound = zeros(10,1);
problem(126).ubound = ones(10,1);
problem(126).x_ini  = zeros(10,1);
problem(126).Constraint = 'C4';
problem(126).grad_Constraint = 'grad_C4';

problem(127).name   = 'FES3';
problem(127).lbound = zeros(10,1);
problem(127).ubound = ones(10,1);
problem(127).x_ini  = zeros(10,1);
problem(127).Constraint = 'C4';
problem(127).grad_Constraint = 'grad_C4';

problem(128).name   = 'I1';
problem(128).lbound = zeros(8,1);
problem(128).ubound = ones(8,1);
problem(128).x_ini  = zeros(8,1);
problem(128).Constraint = 'C4';
problem(128).grad_Constraint = 'grad_C4';

problem(129).name   = 'I2';
problem(129).lbound = zeros(8,1);
problem(129).ubound = ones(8,1);
problem(129).x_ini  = zeros(8,1);
problem(129).Constraint = 'C4';
problem(129).grad_Constraint = 'grad_C4';

problem(130).name   = 'I3';
problem(130).lbound = zeros(8,1);
problem(130).ubound = ones(8,1);
problem(130).x_ini  = zeros(8,1);
problem(130).Constraint = 'C4';
problem(130).grad_Constraint = 'grad_C4';

problem(131).name   = 'I4';
problem(131).lbound = zeros(8,1);
problem(131).ubound = ones(8,1);
problem(131).x_ini  = zeros(8,1);
problem(131).Constraint = 'C4';
problem(131).grad_Constraint = 'grad_C4';

problem(132).name   = 'I5';
problem(132).lbound = zeros(8,1);
problem(132).ubound = ones(8,1);
problem(132).x_ini  = zeros(8,1);
problem(132).Constraint = 'C4';
problem(132).grad_Constraint = 'grad_C4';

problem(133).name   = 'Kursawe';
problem(133).lbound = -5*ones(3,1);
problem(133).ubound = 5*ones(3,1);
problem(133).x_ini  = zeros(3,1);
problem(133).Constraint = 'C4';
problem(133).grad_Constraint = 'grad_C4';

problem(134).name   = 'L1ZDT4';
problem(134).lbound = [0 -5*ones(1,9)]';
problem(134).ubound = [1 5*ones(1,9)]';
problem(134).x_ini  = zeros(10,1);
problem(134).Constraint = 'C4';
problem(134).grad_Constraint = 'grad_C4';

problem(135).name   = 'L2ZDT1';
problem(135).lbound = zeros(30,1);
problem(135).ubound = ones(30,1);
problem(135).x_ini  = zeros(30,1);
problem(135).Constraint = 'C4';
problem(135).grad_Constraint = 'grad_C4';

problem(136).name   = 'L2ZDT2';
problem(136).lbound = zeros(30,1);
problem(136).ubound = ones(30,1);
problem(136).x_ini  = zeros(30,1);
problem(136).Constraint = 'C4';
problem(136).grad_Constraint = 'grad_C4';

problem(137).name   = 'L2ZDT3';
problem(137).lbound = zeros(30,1);
problem(137).ubound = ones(30,1);
problem(137).x_ini  = zeros(30,1);
problem(137).Constraint = 'C4';
problem(137).grad_Constraint = 'grad_C4';

problem(138).name   = 'L2ZDT4';
problem(138).lbound = zeros(30,1);
problem(138).ubound = ones(30,1);
problem(138).x_ini  = zeros(30,1);
problem(138).Constraint = 'C4';
problem(138).grad_Constraint = 'grad_C4';

problem(139).name   = 'L2ZDT6';
problem(139).lbound = zeros(10,1);
problem(139).ubound = ones(10,1);
problem(139).x_ini  = zeros(10,1);
problem(139).Constraint = 'C4';
problem(139).grad_Constraint = 'grad_C4';

problem(140).name   = 'L3ZDT1';
problem(140).lbound = zeros(30,1);
problem(140).ubound = ones(30,1);
problem(140).x_ini  = zeros(30,1);
problem(140).Constraint = 'C4';
problem(140).grad_Constraint = 'grad_C4';

problem(141).name   = 'L3ZDT2';
problem(141).lbound = zeros(30,1);
problem(141).ubound = ones(30,1);
problem(141).x_ini  = zeros(30,1);
problem(141).Constraint = 'C4';
problem(141).grad_Constraint = 'grad_C4';

problem(142).name   = 'L3ZDT3';
problem(142).lbound = zeros(30,1);
problem(142).ubound = ones(30,1);
problem(142).x_ini  = zeros(30,1);
problem(142).Constraint = 'C4';
problem(142).grad_Constraint = 'grad_C4';

problem(143).name   = 'L3ZDT4';
problem(143).lbound = zeros(30,1);
problem(143).ubound = ones(30,1);
problem(143).x_ini  = zeros(30,1);
problem(143).Constraint = 'C4';
problem(143).grad_Constraint = 'grad_C4';

problem(144).name   = 'L3ZDT6';
problem(144).lbound = zeros(10,1);
problem(144).ubound = ones(10,1);
problem(144).x_ini  = zeros(10,1);
problem(144).Constraint = 'C4';
problem(144).grad_Constraint = 'grad_C4';

problem(145).name   = 'lovison5';
problem(145).lbound = [-1 -1 -1]';
problem(145).ubound = [4 4 4]';
problem(145).x_ini  = zeros(3,1) ;
problem(145).Constraint = 'C4';
problem(145).grad_Constraint = 'grad_C4';

problem(146).name   = 'lovison6';
problem(146).lbound = [-1 -1 -1]';
problem(146).ubound = [4 4 4]';
problem(146).x_ini  = zeros(3,1);
problem(146).Constraint = 'C4';
problem(146).grad_Constraint = 'grad_C4';

problem(147).name   = 'MOP2';
problem(147).lbound = -4*ones(4,1);
problem(147).ubound =  4*ones(4,1);
problem(147).x_ini  = zeros(4,1);
problem(147).Constraint = 'C4';
problem(147).grad_Constraint = 'grad_C4';

problem(148).name   = 'MOP4';
problem(148).lbound = [-5 -5 -5]';
problem(148).ubound = [ 5  5  5]';
problem(148).x_ini  = zeros(3,1);
problem(148).Constraint = 'C4';
problem(148).grad_Constraint = 'grad_C4';

problem(149).name   = 'OKA2';
problem(149).lbound = [-pi -5 -5]';
problem(149).ubound = [pi 5 5]';
problem(149).x_ini  = zeros(3,1);
problem(149).Constraint = 'C4';
problem(149).grad_Constraint = 'grad_C4';

problem(150).name   = 'QV1';
problem(150).lbound = -5.12*ones(10,1);
problem(150).ubound =  5.12*ones(10,1);
problem(150).x_ini  = zeros(10,1);
problem(150).Constraint = 'C4';
problem(150).grad_Constraint = 'grad_C4';

problem(151).name   = 'SK2';
problem(151).lbound = -10*ones(4,1);
problem(151).ubound =  10*ones(4,1);
problem(151).x_ini = zeros(4,1);
problem(151).Constraint = 'C4';
problem(151).grad_Constraint = 'grad_C4';

% for j=1:8
%  zmax(j)=2*j;
% end
problem(152).name   = 'WFG1';
problem(152).lbound = zeros(8,1);
problem(152).ubound = zmax';
problem(152).x_ini  = zeros(8,1);
problem(152).Constraint = 'C4';
problem(152).grad_Constraint = 'grad_C4';

problem(153).name   = 'WFG2';
problem(153).lbound = zeros(8,1);
problem(153).ubound = zmax';
problem(153).x_ini  = zeros(8,1);
problem(153).Constraint = 'C4';
problem(153).grad_Constraint = 'grad_C4';

problem(154).name   = 'WFG3';
problem(154).lbound = zeros(8,1);
problem(154).ubound = zmax';
problem(154).x_ini  = zeros(8,1);
problem(154).Constraint = 'C4';
problem(154).grad_Constraint = 'grad_C4';

problem(155).name   = 'WFG4';
problem(155).lbound = zeros(8,1);
problem(155).ubound = zmax';
problem(155).x_ini  = zeros(8,1);
problem(155).Constraint = 'C4';
problem(155).grad_Constraint = 'grad_C4';

problem(156).name   = 'WFG5';
problem(156).lbound = zeros(8,1);
problem(156).ubound = zmax';
problem(156).x_ini  = zeros(8,1);
problem(156).Constraint = 'C4';
problem(156).grad_Constraint = 'grad_C4';

problem(157).name   = 'WFG6';
problem(157).lbound = zeros(8,1);
problem(157).ubound = zmax';
problem(157).x_ini  = zeros(8,1);
problem(157).Constraint = 'C4';
problem(157).grad_Constraint = 'grad_C4';

problem(158).name   = 'WFG7';
problem(158).lbound = zeros(8,1);
problem(158).ubound = zmax';
problem(158).x_ini  = zeros(8,1);
problem(158).Constraint = 'C4';
problem(158).grad_Constraint = 'grad_C4';

problem(159).name   = 'WFG8';
problem(159).lbound = zeros(8,1);
problem(159).ubound = zmax';
problem(159).x_ini  = zeros(8,1);
problem(159).Constraint = 'C4';
problem(159).grad_Constraint = 'grad_C4';

problem(160).name   = 'WFG9';
problem(160).lbound = zeros(8,1);
problem(160).ubound = zmax';
problem(160).x_ini  = zeros(8,1);
problem(160).Constraint = 'C4';
problem(160).grad_Constraint = 'grad_C4';

problem(161).name   = 'ZDT1';
problem(161).lbound = zeros(30,1);
problem(161).ubound = ones(30,1);
problem(161).x_ini  = zeros(30,1);
problem(161).Constraint = 'C4';
problem(161).grad_Constraint = 'grad_C4';

problem(162).name   = 'ZDT2';
problem(162).lbound = zeros(30,1);
problem(162).ubound = ones(30,1);
problem(162).x_ini  = zeros(30,1);
problem(162).Constraint = 'C4';
problem(162).grad_Constraint = 'grad_C4';

problem(163).name   = 'ZDT3';
problem(163).lbound = zeros(30,1);
problem(163).ubound = ones(30,1);
problem(163).x_ini  = zeros(30,1);
problem(163).Constraint = 'C4';
problem(163).grad_Constraint = 'grad_C4';

problem(164).name   = 'ZDT4';
problem(164).lbound = [0, -5*ones(1,9)]';
problem(164).ubound = [1, 5*ones(1,9)]';
problem(164).x_ini  = zeros(10,1);
problem(164).Constraint = 'C4';
problem(164).grad_Constraint = 'grad_C4';

problem(165).name   = 'ZDT6';
problem(165).lbound = zeros(10,1);
problem(165).ubound = ones(10,1);
problem(165).x_ini  = zeros(10,1);
problem(165).Constraint = 'C4';
problem(165).grad_Constraint = 'grad_C4';

problem(166).name   = 'ZLT1';
problem(166).lbound = -1000*ones(10,1);
problem(166).ubound = 1000*ones(10,1);
problem(166).x_ini  = zeros(10,1);
problem(166).Constraint = 'C4';
problem(166).grad_Constraint = 'grad_C4';

%% Constraint C5
Faux = 10;
sigma = 10;
problem(167).name = 'CL1';
problem(167).lbound = [Faux/sigma,sqrt(2)*Faux/sigma,sqrt(2)*Faux/sigma,Faux/sigma]';
problem(167).ubound = 3*Faux/sigma*ones(4,1);
problem(167).x_ini  = 2*ones(4,1);
problem(167).Constraint = 'C5';
problem(167).grad_Constraint = 'grad_C5';

problem(168).name   = 'Kursawe';
problem(168).lbound = -5*ones(3,1);
problem(168).ubound = 5*ones(3,1);
problem(168).x_ini  = 2*ones(3,1);
problem(168).Constraint = 'C5';
problem(168).grad_Constraint = 'grad_C5';

problem(169).name   = 'lovison5';
problem(169).lbound = [-1 -1 -1]';
problem(169).ubound = [4 4 4]';
problem(169).x_ini  = 2*ones(3,1) ;
problem(169).Constraint = 'C5';
problem(169).grad_Constraint = 'grad_C5';

problem(170).name   = 'lovison6';
problem(170).lbound = [-1 -1 -1]';
problem(170).ubound = [4 4 4]';
problem(170).x_ini  = 2*ones(3,1);
problem(170).Constraint = 'C5';
problem(170).grad_Constraint = 'grad_C5';

problem(171).name   = 'MOP2';
problem(171).lbound = -4*ones(4,1);
problem(171).ubound =  4*ones(4,1);
problem(171).x_ini  = 2*ones(4,1);
problem(171).Constraint = 'C5';
problem(171).grad_Constraint = 'grad_C5';

problem(172).name   = 'MOP4';
problem(172).lbound = [-5 -5 -5]';
problem(172).ubound = [ 5  5  5]';
problem(172).x_ini  = 2*ones(3,1);
problem(172).Constraint = 'C5';
problem(172).grad_Constraint = 'grad_C5';

problem(173).name   = 'OKA2';
problem(173).lbound = [-pi -5 -5]';
problem(173).ubound = [pi 5 5]';
problem(173).x_ini  = 2*ones(3,1);
problem(173).Constraint = 'C5';
problem(173).grad_Constraint = 'grad_C5';

problem(174).name   = 'QV1';
problem(174).lbound = -5.12*ones(10,1);
problem(174).ubound =  5.12*ones(10,1);
problem(174).x_ini  = 2*ones(10,1);
problem(174).Constraint = 'C5';
problem(174).grad_Constraint = 'grad_C5';

problem(175).name   = 'SK2';
problem(175).lbound = -10*ones(4,1);
problem(175).ubound =  10*ones(4,1);
problem(175).x_ini = 2*ones(4,1);
problem(175).Constraint = 'C5';
problem(175).grad_Constraint = 'grad_C5';

% for j=1:8
%  zmax(j)=2*j;
% end
problem(176).name   = 'WFG1';
problem(176).lbound = zeros(8,1);
problem(176).ubound = zmax';
problem(176).x_ini  = 2*ones(8,1);
problem(176).Constraint = 'C5';
problem(176).grad_Constraint = 'grad_C5';

problem(177).name   = 'WFG2';
problem(177).lbound = zeros(8,1);
problem(177).ubound = zmax';
problem(177).x_ini  = 2*ones(8,1);
problem(177).Constraint = 'C5';
problem(177).grad_Constraint = 'grad_C5';

problem(178).name   = 'WFG3';
problem(178).lbound = zeros(8,1);
problem(178).ubound = zmax';
problem(178).x_ini  = 2*ones(8,1);
problem(178).Constraint = 'C5';
problem(178).grad_Constraint = 'grad_C5';

problem(179).name   = 'WFG4';
problem(179).lbound = zeros(8,1);
problem(179).ubound = zmax';
problem(179).x_ini  = 2*ones(8,1);
problem(179).Constraint = 'C5';
problem(179).grad_Constraint = 'grad_C5';

problem(180).name   = 'WFG5';
problem(180).lbound = zeros(8,1);
problem(180).ubound = zmax';
problem(180).x_ini  = 2*ones(8,1);
problem(180).Constraint = 'C5';
problem(180).grad_Constraint = 'grad_C5';

problem(181).name   = 'WFG6';
problem(181).lbound = zeros(8,1);
problem(181).ubound = zmax';
problem(181).x_ini  = 2*ones(8,1);
problem(181).Constraint = 'C5';
problem(181).grad_Constraint = 'grad_C5';

problem(182).name   = 'WFG7';
problem(182).lbound = zeros(8,1);
problem(182).ubound = zmax';
problem(182).x_ini  = 2*ones(8,1);
problem(182).Constraint = 'C5';
problem(182).grad_Constraint = 'grad_C5';

problem(183).name   = 'WFG8';
problem(183).lbound = zeros(8,1);
problem(183).ubound = zmax';
problem(183).x_ini  = 2*ones(8,1);
problem(183).Constraint = 'C5';
problem(183).grad_Constraint = 'grad_C5';

problem(184).name   = 'WFG9';
problem(184).lbound = zeros(8,1);
problem(184).ubound = zmax';
problem(184).x_ini  = 2*ones(8,1);
problem(184).Constraint = 'C5';
problem(184).grad_Constraint = 'grad_C5';

problem(185).name   = 'ZLT1';
problem(185).lbound = -1000*ones(10,1);
problem(185).ubound = 1000*ones(10,1);
problem(185).x_ini  = 2*ones(10,1);
problem(185).Constraint = 'C5';
problem(185).grad_Constraint = 'grad_C5';

%% Constraint 6
Faux = 10;
sigma = 10;
problem(186).name = 'CL1';
problem(186).lbound = [Faux/sigma,sqrt(2)*Faux/sigma,sqrt(2)*Faux/sigma,Faux/sigma]';
problem(186).ubound = 3*Faux/sigma*ones(4,1);
problem(186).x_ini  = 2*ones(4,1);
problem(186).Constraint = 'C6';
problem(186).grad_Constraint = 'grad_C6';

problem(187).name   = 'Kursawe';
problem(187).lbound = -5*ones(3,1);
problem(187).ubound = 5*ones(3,1);
problem(187).x_ini  = 2*ones(3,1);
problem(187).Constraint = 'C6';
problem(187).grad_Constraint = 'grad_C6';

problem(188).name   = 'lovison5';
problem(188).lbound = [-1 -1 -1]';
problem(188).ubound = [4 4 4]';
problem(188).x_ini  = 2*ones(3,1) ;
problem(188).Constraint = 'C6';
problem(188).grad_Constraint = 'grad_C6';

problem(189).name   = 'lovison6';
problem(189).lbound = [-1 -1 -1]';
problem(189).ubound = [4 4 4]';
problem(189).x_ini  = 2*ones(3,1);
problem(189).Constraint = 'C6';
problem(189).grad_Constraint = 'grad_C6';

problem(190).name   = 'MOP2';
problem(190).lbound = -4*ones(4,1);
problem(190).ubound =  4*ones(4,1);
problem(190).x_ini  = 2*ones(4,1);
problem(190).Constraint = 'C6';
problem(190).grad_Constraint = 'grad_C6';

problem(191).name   = 'MOP4';
problem(191).lbound = [-5 -5 -5]';
problem(191).ubound = [ 5  5  5]';
problem(191).x_ini  = 2*ones(3,1);
problem(191).Constraint = 'C6';
problem(191).grad_Constraint = 'grad_C6';

problem(192).name   = 'OKA2';
problem(192).lbound = [-pi -5 -5]';
problem(192).ubound = [pi 5 5]';
problem(192).x_ini  = 2*ones(3,1);
problem(192).Constraint = 'C6';
problem(192).grad_Constraint = 'grad_C6';

problem(193).name   = 'QV1';
problem(193).lbound = -5.12*ones(10,1);
problem(193).ubound =  5.12*ones(10,1);
problem(193).x_ini  = 2*ones(10,1);
problem(193).Constraint = 'C6';
problem(193).grad_Constraint = 'grad_C6';

problem(194).name   = 'SK2';
problem(194).lbound = -10*ones(4,1);
problem(194).ubound =  10*ones(4,1);
problem(194).x_ini = 2*ones(4,1);
problem(194).Constraint = 'C6';
problem(194).grad_Constraint = 'grad_C6';

% for j=1:8
%  zmax(j)=2*j;
% end
problem(195).name   = 'WFG1';
problem(195).lbound = zeros(8,1);
problem(195).ubound = zmax';
problem(195).x_ini  = 2*ones(8,1);
problem(195).Constraint = 'C6';
problem(195).grad_Constraint = 'grad_C6';

problem(196).name   = 'WFG2';
problem(196).lbound = zeros(8,1);
problem(196).ubound = zmax';
problem(196).x_ini  = 2*ones(8,1);
problem(196).Constraint = 'C6';
problem(196).grad_Constraint = 'grad_C6';

problem(197).name   = 'WFG3';
problem(197).lbound = zeros(8,1);
problem(197).ubound = zmax';
problem(197).x_ini  = 2*ones(8,1);
problem(197).Constraint = 'C6';
problem(197).grad_Constraint = 'grad_C6';

problem(198).name   = 'WFG4';
problem(198).lbound = zeros(8,1);
problem(198).ubound = zmax';
problem(198).x_ini  = 2*ones(8,1);
problem(198).Constraint = 'C6';
problem(198).grad_Constraint = 'grad_C6';

problem(199).name   = 'WFG5';
problem(199).lbound = zeros(8,1);
problem(199).ubound = zmax';
problem(199).x_ini  = 2*ones(8,1);
problem(199).Constraint = 'C6';
problem(199).grad_Constraint = 'grad_C6';

problem(200).name   = 'WFG6';
problem(200).lbound = zeros(8,1);
problem(200).ubound = zmax';
problem(200).x_ini  = 2*ones(8,1);
problem(200).Constraint = 'C6';
problem(200).grad_Constraint = 'grad_C6';

problem(201).name   = 'WFG7';
problem(201).lbound = zeros(8,1);
problem(201).ubound = zmax';
problem(201).x_ini  = 2*ones(8,1);
problem(201).Constraint = 'C6';
problem(201).grad_Constraint = 'grad_C6';

problem(202).name   = 'WFG8';
problem(202).lbound = zeros(8,1);
problem(202).ubound = zmax';
problem(202).x_ini  = 2*ones(8,1);
problem(202).Constraint = 'C6';
problem(202).grad_Constraint = 'grad_C6';

problem(203).name   = 'WFG9';
problem(203).lbound = zeros(8,1);
problem(203).ubound = zmax';
problem(203).x_ini  = 2*ones(8,1);
problem(203).Constraint = 'C6';
problem(203).grad_Constraint = 'grad_C6';

problem(204).name   = 'ZLT1';
problem(204).lbound = -1000*ones(10,1);
problem(204).ubound = 1000*ones(10,1);
problem(204).x_ini  = 2*ones(10,1);
problem(204).Constraint = 'C6';
problem(204).grad_Constraint = 'grad_C6';

%%%% Restantes dos problemas
problem(205).name   = 'CL1';
problem(205).lbound = [Faux/sigma,sqrt(2)*Faux/sigma,sqrt(2)*Faux/sigma,Faux/sigma]';
problem(205).ubound = 3*Faux/sigma*ones(4,1);
problem(205).x_ini  = ([Faux/sigma,sqrt(2)*Faux/sigma,sqrt(2)*Faux/sigma,Faux/sigma]'+3*Faux/sigma*ones(4,1))/2;
problem(205).Constraint = 'C1';
problem(205).grad_Constraint = 'grad_C1';

problem(206).name   = 'L1ZDT4';
problem(206).lbound = [0 -5*ones(1,9)]';
problem(206).ubound = [1 5*ones(1,9)]';
problem(206).x_ini  = ([1 5*ones(1,9)]'-[0 -5*ones(1,9)]')/2;
problem(206).Constraint = 'C2';
problem(206).grad_Constraint = 'grad_C2';

problem(207).name   = 'L1ZDT4';
problem(207).lbound = [0 -5*ones(1,9)]';
problem(207).ubound = [1 5*ones(1,9)]';
problem(207).x_ini  = ([1 5*ones(1,9)]'-[0 -5*ones(1,9)]')/2;
problem(207).Constraint = 'C5';
problem(207).grad_Constraint = 'grad_C5';

problem(208).name   = 'L1ZDT4';
problem(208).lbound = [0 -5*ones(1,9)]';
problem(208).ubound = [1 5*ones(1,9)]';
problem(208).x_ini  = ([1 5*ones(1,9)]'-[0 -5*ones(1,9)]')/2;
problem(208).Constraint = 'C6';
problem(208).grad_Constraint = 'grad_C6';

problem(209).name   = 'TKLY1';
problem(209).lbound = [0.1 0 0 0]' ;
problem(209).ubound = [1 1 1 1]';
problem(209).x_ini  = ([0.1 0 0 0]'+[1 1 1 1]')/2;
problem(209).Constraint = 'C4';
problem(209).grad_Constraint = 'grad_C4';

problem(210).name   = 'TKLY1';
problem(210).lbound = [0.1 0 0 0]' ;
problem(210).ubound = [1 1 1 1]';
problem(210).x_ini  = [1;0.25;0.375;1];
problem(210).Constraint = 'C5';
problem(210).grad_Constraint = 'grad_C5';

problem(211).name   = 'TKLY1';
problem(211).lbound = [0.1 0 0 0]' ;
problem(211).ubound = [1 1 1 1]';
problem(211).x_ini  = [1;0.25;0.375;1];
problem(211).Constraint = 'C6';
problem(211).grad_Constraint = 'grad_C6';

problem(212).name   = 'ZDT4';
problem(212).lbound = [0, -5*ones(1,9)]';
problem(212).ubound = [1, 5*ones(1,9)]';
problem(212).x_ini  = ([1, 5*ones(1,9)]'-[0, -5*ones(1,9)]')/2;
problem(212).Constraint = 'C2';
problem(212).grad_Constraint = 'grad_C2';

problem(213).name   = 'ZDT4';
problem(213).lbound = [0, -5*ones(1,9)]';
problem(213).ubound = [1, 5*ones(1,9)]';
problem(213).x_ini  = ([1, 5*ones(1,9)]'-[0, -5*ones(1,9)]')/2;
problem(213).Constraint = 'C5';
problem(213).grad_Constraint = 'grad_C5';

problem(214).name   = 'ZDT4';
problem(214).lbound = [0, -5*ones(1,9)]';
problem(214).ubound = [1, 5*ones(1,9)]';
problem(214).x_ini  = ([1, 5*ones(1,9)]'-[0, -5*ones(1,9)]')/2;
problem(214).Constraint = 'C6';
problem(214).grad_Constraint = 'grad_C6';

format compact;

%%_______________________________________________________________________

nprobs=214;
fp = fopen('Results\teste_november_v3_20000.m','wt');     % instrucao Windows
% fp =fopen('Results/dms_filter_IR_500funceval_newdominance.m','wt');      % instrucao Linux

func_evals=zeros(nprobs,1);
for i=1:nprobs
   fprintf('==================  Problema %3d ================== \n' ,i)
   fprintf(fp,'teste_november_v3_20000_%s_%s=[',problem(i).name,problem(i).Constraint);
   file_cache = ['teste_november_v3_20000_' problem(i).name '_' problem(i).Constraint '_cache.m'];   
   lb     = problem(i).lbound;
   ub     = problem(i).ubound;   
   xi     = problem(i).x_ini;
   func_F = problem(i).name;
   func_C = problem(i).Constraint;
   grad_C = problem(i).grad_Constraint ;

       
   [Plist_F,f,alfa_F,func_eval] = dms_filter_IR(1,func_F,[],file_cache,[],lb,ub,func_C,grad_C,6); 
   
   
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