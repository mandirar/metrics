%% Fuel parameters:
eta_k1   = 6.79764E-05; %32.73;  %36.553; %global technolgoy CO2 intensity (g CO2/J)
eta_m1   = 2.41882E-07; %0.1165; %0.3697; %global technology CH4 intensity (g CH4/J)
eta_k2   = 5.10E-05; %based on a 25% reduction in CO2
eta_m2   = 6.67E-07; 
eta_k1   = eta_k1 * 12/44 * 10^3; %Pg C/EJ
eta_m1   = eta_m1 * 10^6;         %Tg CH4/EJ
eta_k2   = eta_k2 * 12/44 * 10^3; %Pg C/EJ
eta_m2   = eta_m2 * 10^6;         %Tg CH4/EJ
ems1    = [eta_k1 eta_m1];
ems2    = [eta_k2 eta_m2];
ems_mat = [ems1; ems2];
frac    = 0.7155;                     %fraction of technology emissions controlled