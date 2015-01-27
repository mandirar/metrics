function [ C,Ceq ] = fuelUser_con( fuel_use,metric,ems_mat,ek_constraint )
% This function takes the decision variable and outputs a column vector of 
% inequality constraints and a column vector of equality constraints. 

%% Set constraint inputs:
constants;           %loads constants

emissions  = fuel_use * ems_mat;
evec_CO2eq = emissions(:,1) + emissions(:,2) .* metric * conversion;
%evec_CO2eq = evec_CO2eq * 12/44 * 10^-15;

%% Define constraints (c: a < alpha; ceq: b = beta):
C   = evec_CO2eq - ek_constraint;
Ceq = [];

end
