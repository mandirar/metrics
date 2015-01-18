function [ decay ] = decay_N2O ( t )
% DECAY_N2O computes the fraction of a N2O emissions perturbation remaining 
% atmosphere after t years.

tau = 114; %units of years

decay = exp(-t/tau);

% Make impulse response 0 if the impact time preceeds the emissions time.
decay = decay.*(t >= -1.0e-10);

end