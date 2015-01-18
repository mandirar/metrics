% This script executes runs with different variable conditions to calculate
% metric values, designed to be run on the cluster.

clear all
addpath('./metrics/variables')
addpath('./metrics/lambda')
addpath('./metrics/bilevel')
addpath('./metrics/budgets')

tic

%% Set up run variables:
load('budgets.mat'); %loads budget variables
constants;           %loads constants
variables1;          %loads variables
%variables2;          %loads variables
%variables3;          %loads variables
%variables4;          %loads variables
%variables5;          %loads variables
%variables6;          %loads variables
%variables7;          %loads variables
%variables8;          %loads variables
%variables9;          %loads variables
%variables10;         %loads variables

%% Execute runs:
[ fuel_use1Li,  lambdaSim1,  metric1L  ] = energyPolicy_fun(ems_mat1);
%[ fuel_use2Li,  lambdaSim2,  metric2L  ] = energyPolicy_fun(ems_mat2);
%[ fuel_use3Li,  lambdaSim3,  metric3L  ] = energyPolicy_fun(ems_mat3);
%[ fuel_use4Li,  lambdaSim4,  metric4L  ] = energyPolicy_fun(ems_mat4);
%[ fuel_use5Li,  lambdaSim5,  metric5L  ] = energyPolicy_fun(ems_mat5);
%[ fuel_use6Li,  lambdaSim6,  metric6L  ] = energyPolicy_fun(ems_mat6);
%[ fuel_use7Li,  lambdaSim7,  metric7L  ] = energyPolicy_fun(ems_mat7);
%[ fuel_use8Li,  lambdaSim8,  metric8L  ] = energyPolicy_fun(ems_mat8);
%[ fuel_use9Li,  lambdaSim9,  metric9L  ] = energyPolicy_fun(ems_mat9);
%[ fuel_use10Li, lambdaSim10, metric10L ] = energyPolicy_fun(ems_mat10);

[ fuel_use1Bi,  metric1B  ] = metricPolicy_fun(ems_mat1,ek_constraint);
%[ fuel_use2Bi,  metric2B  ] = metricPolicy_fun(ems_mat2);
%[ fuel_use3Bi,  metric3B  ] = metricPolicy_fun(ems_mat3);
%[ fuel_use4Bi,  metric4B  ] = metricPolicy_fun(ems_mat4);
%[ fuel_use5Bi,  metric5B  ] = metricPolicy_fun(ems_mat5);
%[ fuel_use6Bi,  metric6B  ] = metricPolicy_fun(ems_mat6);
%[ fuel_use7Bi,  metric7B  ] = metricPolicy_fun(ems_mat7);
%[ fuel_use8Bi,  metric8B  ] = metricPolicy_fun(ems_mat8);
%[ fuel_use9Bi,  metric9B  ] = metricPolicy_fun(ems_mat9);
%[ fuel_use10Bi, metric10B ] = metricPolicy_fun(ems_mat10);

%% Calculate GWP, ICI, and CCI:
GWP = eqMetric(@lambda_GWP,t,100)';
ICI = eqMetric(@lambda_ICI,t,ts)'; 
CCI = eqMetric(@lambda_CCI,t,ts)'; 

%% Save output:
clear('A','Aeq','Ak','Am','b','beq','conversion','dt','eta1','eta2',...
    'eta_vec','first_year','form','fuel_count','gCH4_per_molCH4',...
    'gCO2_per_molCO2','guess','ide_s','last_year','lb','n','options',...
    'peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','ub','ems_mat1',...
    'ems_mat2','ems_mat3','ems_mat4','ems_mat5','ems_mat6','ems_mat7',...
    'ems_mat8','ems_mat9','ems_mat10','ek_constraint','rf_constraint',...
    'ts')

save('metrics/metrics.mat')

toc