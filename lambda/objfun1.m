function [ energy_all ] = objfun1( fuel_use )
% This is the objective function for the optimization problem.

global_vars;                     %load global variables

energy     = fuel_use * eta_vec; %vector of energy use in each year

energy_all = sum(energy);        %sum of energy use across all years

% The objective is to maximize the sum of enerrgy use across all years.

end