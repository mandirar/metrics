function [ energy_all ] = fuelUser_obj( fuel_use )
% This is the objective function for the user's optimization problem. The
% objective is to maximize the sum of energy consumption across all years.

constants;                       %loads constants

energy     = fuel_use * eta_vec; %vector of energy use in each year

energy_all = sum(energy);        %sum of energy use across all years

end