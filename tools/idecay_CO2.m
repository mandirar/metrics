function [ decay ] = idecay_CO2 ( t )
% IDECAY_CO2 computes the integral of the fraction of a CO2 emissions 
% perturbation remaining in the atmosphere after t years, which is used in 
% calculating cumulative climate metrics.
a0 = 0.217;
a1 = 0.259;
a2 = 0.338;
a3 = 0.186;
tau1 = 172.9; %units of years
tau2 = 18.51; %units of years
tau3 = 1.186; %units of years

decay = a0*t + a1*tau1*(1 - exp(-t/tau1)) + a2*tau2*(1 - exp(-t/tau2))...
    + a3*tau3*(1 - exp(-t/tau3));

end