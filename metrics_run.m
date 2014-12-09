% This script executes runs with different variable conditions, designed
% to be run on the cluster.

clear all
addpath('./variables')
addpath('./lambda')
addpath('./bilevel')

tic

%% Set up run variables:
constants;   %loads constants
%variables1;  %loads variables
%variables2;  %loads variables
variables3;  %loads variables
%variables4;  %loads variables
%variables5;  %loads variables
%variables6;  %loads variables
%variables7;  %loads variables
%variables8;  %loads variables
%variables9;  %loads variables
%variables10; %loads variables

%% Execute runs:
%[ fuel_use1L,  lambdaSim1,  metric1L  ] = energyPolicy_fun(ems_mat1);
%[ fuel_use2L,  lambdaSim2,  metric2L  ] = energyPolicy_fun(ems_mat2);
[ fuel_use3L,  lambdaSim3,  metric3L  ] = energyPolicy_fun(ems_mat3);
%[ fuel_use4L,  lambdaSim4,  metric4L  ] = energyPolicy_fun(ems_mat4);
%[ fuel_use5L,  lambdaSim5,  metric5L  ] = energyPolicy_fun(ems_mat5);
%[ fuel_use6L,  lambdaSim6,  metric6L  ] = energyPolicy_fun(ems_mat6);
%[ fuel_use7L,  lambdaSim7,  metric7L  ] = energyPolicy_fun(ems_mat7);
%[ fuel_use8L,  lambdaSim8,  metric8L  ] = energyPolicy_fun(ems_mat8);
%[ fuel_use9L,  lambdaSim9,  metric9L  ] = energyPolicy_fun(ems_mat9);
%[ fuel_use10L, lambdaSim10, metric10L ] = energyPolicy_fun(ems_mat10);

%[ fuel_use1B,  metric1B  ] = metricPolicy_fun(ems_mat1);
%[ fuel_use2B,  metric2B  ] = metricPolicy_fun(ems_mat2);
%[ fuel_use3B,  metric3B  ] = metricPolicy_fun(ems_mat3);
%[ fuel_use4B,  metric4B  ] = metricPolicy_fun(ems_mat4);
%[ fuel_use5B,  metric5B  ] = metricPolicy_fun(ems_mat5);
%[ fuel_use6B,  metric6B  ] = metricPolicy_fun(ems_mat6);
%[ fuel_use7B,  metric7B  ] = metricPolicy_fun(ems_mat7);
%[ fuel_use8B,  metric8B  ] = metricPolicy_fun(ems_mat8);
%[ fuel_use9B,  metric9B  ] = metricPolicy_fun(ems_mat9);
%[ fuel_use10B, metric10B ] = metricPolicy_fun(ems_mat10);

%% Calculate GWP, ICI, and CCI:
ts  = 2041;
GWP = eqMetric(@lambda_GWP,t,100)';
ICI = eqMetric(@lambda_ICI,t,ts)'; 
CCI = eqMetric(@lambda_CCI,t,ts)'; 

%% Save output:
clear('A','Aeq','Ak','Am','b','beq','conversion','dt','eta1','eta2',...
    'eta_vec','first_year','form','fuel_count','gCH4_per_molCH4',...
    'gCO2_per_molCO2','guess','ide_s','last_year','lb','n','options',...
    'peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','ub')

save('metrics_out.mat')

toc