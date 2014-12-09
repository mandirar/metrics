function [ C,Ceq ] = user_con( variables )
% This is the constraint function for our optimization problem, which takes 
% the decision variable and outputs a column vector of inequality
% constraints (c) and a column vector of equality constraints (ceq)

% Load supporting functions, scripts, and data files.
global_vars;        %global variables
load('budgets.mat'); %emissions and radiative forcing

fuel_use   = variables(:,1:fuel_count);
metric_d   = variables(:,end);

% Calculate CO2-eq emissions from fuel use and emissions intensities:
emissions  = fuel_use * ems_mat;                            %GHG emissions (t x fuel) * (fuel x gas) = (t x gas)
evec_CO2eq = emissions(:,1) + (emissions(:,2) .* metric_d); %CO2-eq emissions (t x gas-eq)  

% Define constraints (c: a < alpha; ceq: b = beta):
C   = [];
Ceq = evec_CO2eq - ek_constraint;

end