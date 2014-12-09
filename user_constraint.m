function [ C,Ceq ] = user_constraint( fuel_use )
% This is the constraint function for our optimization problem, which takes 
% the decision variable and outputs a column vector of inequality
% constraints (c) and a column vector of equality constraints (ceq)

% Load supporting functions, scripts, and data files.
global_vars;             %global variables
load('constraints.mat'); %emissions and radiative forcing

global metric

% Interpolate emissions constraint to time steps of t:
emissions_c = interp1(t_old,ek_constraint,t);

% Calculate CO2-eq emissions from fuel use and emissions intensities:
emissions  = fuel_use * ems_mat;                       %GHG emissions (t x fuel) * (fuel x gas) = (t x gas)
%evec_CO2eq = emissions(n,1) + (emissions(n,2) .* metric_guess); %CO2-eq emissions (t x gas-eq)  
evec_CO2eq = emissions(n,1) + (emissions(n,2) .* (metric * ones(n,1))); %CO2-eq emissions (t x gas-eq)  

% Define constraints (c: a < alpha; ceq: b = beta):
C   = evec_CO2eq - emissions_c;
Ceq = [];

end