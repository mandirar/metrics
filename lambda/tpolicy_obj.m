function [ energy_all ] = tpolicy_obj( fuel_use )
% This is the objective function for the optimization problem. The
% objective is to maxmize the sum of energy use across all years.

constants;                   %loads constants

energy = fuel_use * eta_vec; %vector of energy use in each year

energy_all = sum(energy);    %sum of energy use across all years

end