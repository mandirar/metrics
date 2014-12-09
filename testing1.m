function [ rf ] = testing1( metric,budget )

constants;

% Calculate emissions to meet budget:
eta_e  = eta_k + eta_m .* metric; %CO2 equivalent emissions
energy = budget ./ eta_e;         %energy consumption
ems_k  = energy .* eta_k;         %CO2 emissions
ems_m  = energy .* eta_m;         %CH4 emissions

% Calculate radiative forcing from emissions:


end

