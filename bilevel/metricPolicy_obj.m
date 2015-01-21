function [ energy_all ] = metricPolicy_obj( metric )
% This is the objective function for the policy's optimization problem.
% The objective is to maximize the sum of energy use across all years.

constants;                                 %loads constants

energy_all = sum(metric);

end

