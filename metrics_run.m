% This script executes runs with different variable conditions to calculate
% metric values, designed to be run on the cluster.

clear all
addpath('./metrics/variables')
addpath('./metrics/lambda')
addpath('./metrics/bilevel')

tic

%% Set up run variables:
load('budgets.mat'); %loads budget variables
constants;           %loads constants
variables1;          %loads variables

%% Execute runs:
%[ fuel_use1Li,  lambdaSim1,  metric1L  ] = energyPolicy_fun(ems_mat1);
%[ fuel_use1Bi,  metric1B  ]              = metricPolicy_fun(ems_mat1,ek_constraint);

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

save('metrics.mat')

toc