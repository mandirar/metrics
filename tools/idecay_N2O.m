function [ decay ] = idecay_N2O ( t )
% IDECAY_N2O computes the integral of the fraction of a N2O emissions 
% perturbation remaining in the atmosphere after t years, which is used in 
% calculating cumulative climate metrics.

tau = 114; %units of years

decay = tau*(1 - exp(-t/tau));

end