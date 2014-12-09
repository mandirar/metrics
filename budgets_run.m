% Generates emissions and radiative forcing budgets.  Note that time step
% for budget generation should be the same as that for application to avoid
% interpolation errors.

% The name of the mat file can be changed to save multiple budgets.

clear all
addpath('./tools')
constants;

% Define mitigation year for scenario:
t1 = 2030; %2015-2028 (EV: 2017) 

% Calculate emissions and radiative forcing: 
[ ek_constraint,~,rf_constraint ] = scenario_generator( t1 );

% Calculate stabilization time: 
[~,ts] = max(rf_constraint);   %index 
ts     = ts + first_year - dt; %year

% Clear variables (before saving .mat file):
clear('Ak','Am','dt','ems1','ems1_k','ems1_m','ems2','ems2_k','ems2_m',...
    'ems_mat','eta1','eta2','eta_vec','first_year','form','fuel_count',...
    'gCH4_per_molCH4','gCO2_per_molCO2','ide_s','last_year','m','n',...
    'peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','t1');

save('budgets/budgets.mat')