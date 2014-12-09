function [ energy_all ] = objfun( fuel_use )
%% This is the objective function for the optimization problem.
% We maximize the sum of energy use -- this can be changed in the future to
% some other energy-based objective.

global_vars;                     %load global variables

energy     = fuel_use * eta_vec; %vector of energy use in each year

energy_all = sum(energy);        %sum of energy use across all years

end