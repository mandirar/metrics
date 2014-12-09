function [ decay ] = decay_CH4 ( t )
% DECAY_CH4 computes the fraction of a CH4 emissions perturbation remaining
% in the atmosphere after t years.

tau = 12; %units of years

decay = exp(-t/tau);

% Make impulse response 0 if the impact time preceeds the emissions time.
decay = decay.*(t >= -1.0e-10);

end