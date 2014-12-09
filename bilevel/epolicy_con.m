function [ C,Ceq ] = epolicy_con( metric,ems_mat )
% This function takes the decision variable and outputs a column vector of 
% inequality constraints and a column vector of equality constraints. 

%% Set constraint inputs:
constants;                 %loads constants
cpath_lCO2 = legacy_CO2(); %legacy CO2 concentrations
cpath_lCH4 = legacy_CH4(); %legacy CH4 concentrations
cpath_lN2O = legacy_N2O(); %legacy N2O concentrations
load('budgets.mat');       %emissions and radiative forcing

forcing_c = 3*ones(n,1);  %radiative forcing constraint
            
%% Calculate radiative forcing from fuel use:
fuel_use   = user_fun(metric);               %fuel use matrix
emissions  = fuel_use * ems_mat;             %emissions matrix 
evec_CO2   = emissions(:,1);                 %CO2 emissions
cvec_CO2   = e2c_CO2(evec_CO2) + cpath_lCO2; %CO2 concentration
fvec_CO2   = rf_CO2(cvec_CO2);               %CO2 radiative forcing
evec_CH4   = emissions(:,2);                 %CH4 emissions
cvec_CH4   = e2c_CH4(evec_CH4) + cpath_lCH4; %CH4 concentration
fvec_CH4   = rf_CH4(cvec_CH4);               %CH4 radiative forcing
cvec_N2O   = cpath_lN2O;                     %N2O concentration  
fvec_N2O   = rf_N2O(cvec_N2O);               %N2O radiative forcing
fvec_other = -0.5175*ones(n,1);              %other radiative forcing

fvec = fvec_CO2 + fvec_CH4 + fvec_N2O + fvec_other; %radiative forcing

%% Define constraints (c: a < alpha; ceq: b = beta):
C   = fvec - forcing_c;
Ceq = [];

end