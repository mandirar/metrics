function [ decay ] = idecay_CH4 ( t )
% IDECAY_CH4 computes the integral of the fraction of a CH4 emissions 
% perturbation remaining in the atmosphere after t years, which is used in 
% calculating cumulative climate metrics.

tau = 12; %units of years

decay = tau*(1 - exp(-t/tau));

end