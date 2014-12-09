function [ energy_all ] = test_obj( variables )
% This is the objective function for the user's optimization problem.

global_vars;                          %load global variables

fuel_use = variables(:,1:fuel_count); %calculate fuel use

energy     = fuel_use * eta_vec;      %vector of energy use in each year

energy_all = sum(energy);             %sum of energy use across all years

% The objective is to maximize the sum of energy use across all years.

end