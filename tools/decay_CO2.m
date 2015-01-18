function [ decay ] = decay_CO2 ( t )
% DECAY_CO2 computes the fraction of a CO2 emissions perturbation remaining 
% in the atmosphere after t years.

a0 = 0.217;   %unitless
a1 = 0.259;   %unitless
a2 = 0.338;   %unitless
a3 = 0.186;   %unitless
tau1 = 172.9; %units of years
tau2 = 18.51; %units of years
tau3 = 1.186; %units of years

decay = a0 + a1*exp(-t/tau1) + a2*exp(-t/tau2) + a3*exp(-t/tau3);

% Make impulse response 0 if the impact time preceeds the emissions time.
decay = decay.*(t >= -1.0e-10);

end