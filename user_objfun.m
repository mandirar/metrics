function [ energy_all ] = user_objfun( fuel_use )
% This is the objective function for the user's optimization problem.

global metric

global_vars;                     %load global variables

energy     = fuel_use * eta_vec; %vector of energy use in each year

energy_all = sum(energy);        %sum of energy use across all years

% The objective is to maximize the sum of enerrgy use across all years.

end