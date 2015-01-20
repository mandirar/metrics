function [ energy_all ] = metricPolicy_obj( metric,ems_mat,ek_constraint )
% This is the objective function for the policy's optimization problem.
% The objective is to maximize the sum of energy use across all years.

constants;                                 %loads constants

fuel_use   = fuelUser_fun(metric,ems_mat,ek_constraint); %fuel user optimizaton problem  

energy     = fuel_use * eta_vec;           %vector of energy use in each year

energy_all = sum(energy)                  %sum of energy use across all years

end

