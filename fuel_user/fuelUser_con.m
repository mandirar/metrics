function [ C,Ceq ] = fuelUser_con( fuel_use,metric,ems_mat,ek_constraint )
% This function takes the decision variable and outputs a column vector of 
% inequality constraints and a column vector of equality constraints. 

%% Set constraint inputs:
constants;           %loads constants
%load('budgets.mat'); %emissions and radiative forcing

%% Calculate CO2-eq emissions from fuel use:
emissions  = fuel_use * ems_mat;                          %GHG emissions (t x fuel) * (fuel x gas) = (t x gas)
evec_CO2eq = emissions(:,1) + (emissions(:,2) .* metric); %CO2-eq emissions (t x gas-eq)  

%% Define constraints (c: a < alpha; ceq: b = beta):
C   = evec_CO2eq - ek_constraint;
Ceq = [];

end
