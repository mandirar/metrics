% Generates emissions and radiative forcing budgets.  Note that time step
% for budget generation should be the same as that for application to avoid
% interpolation errors.

% The name of the mat file can be changed to save multiple budgets.

clear all
addpath('./tools')
constants;

% Define mitigation year for scenario:
t1 = 2023; 
peak = 3;

% Calculate emissions and radiative forcing: 
[ ek_constraint,~,~,rf_constraint,ts ] = make_scenarios( t1,peak );

% Clear variables:
clearvars -except ek_constraint rf_constraint ts

save('budgets.mat')