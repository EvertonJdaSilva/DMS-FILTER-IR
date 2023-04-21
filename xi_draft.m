% xi continuous function, 0<xi(alfa)<1, and lim xi(alfa_k) = 0 k goes to 
% infinity
% 0<arctg(alfa)<pi/2
% 0<2/pi arctg(alfa)< 1
xi=@(alfa)(2/pi* atan(alfa));
alfa_values = linspace(0,1000,1000);
xi_values = xi(alfa_values);
plot(alfa_values,xi_values);