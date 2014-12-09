function [ energy_all ] = policy_objfun( metric )
% This is the objective function for the policy's optimization problem.

global_vars;                     %load global variables

metric %#ok<NOPRT>

fuel_use   = user_main();        %calculate fuel use

energy     = fuel_use * eta_vec; %vector of energy use in each year

energy_all = sum(energy);        %sum of energy use across all years

% The objective is to maximize the sum of energy use across all years.

end

