% This script executes runs with different variable conditions, designed
% to be run on the cluster.

clear all
addpath('./variables')
addpath('./lambda')
addpath('./bilevel')

tic

%% Set up run variables:
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
%[ fuel_use1, lambdaSim1,  metric1  ] = tpolicy_fun(ems_mat1);
%[ fuel_use2, lambdaSim2,  metric2  ] = tpolicy_fun(ems_mat2);
%[ fuel_use3, lambdaSim3,  metric3  ] = tpolicy_fun(ems_mat3);
%[ fuel_use4, lambdaSim4,  metric4  ] = tpolicy_fun(ems_mat4);
%[ fuel_use5, lambdaSim5,  metric5  ] = tpolicy_fun(ems_mat5);
%[ fuel_use6, lambdaSim6,  metric6  ] = tpolicy_fun(ems_mat6);
%[ fuel_use7, lambdaSim7,  metric7  ] = tpolicy_fun(ems_mat7);
%[ fuel_use8, lambdaSim8,  metric8  ] = tpolicy_fun(ems_mat8);
%[ fuel_use9, lambdaSim9,  metric9  ] = tpolicy_fun(ems_mat9);
%[ fuel_use10,lambdaSim10, metric10 ] = tpolicy_fun(ems_mat10);

%[ fuel_use11, metric11 ] = epolicy_fun(ems_mat1);
%[ fuel_use12, metric12 ] = epolicy_fun(ems_mat2);
[ fuel_use13, metric13 ] = metricPolicy_fun(ems_mat3);
%[ fuel_use14, metric14 ] = epolicy_fun(ems_mat4);
%[ fuel_use15, metric15 ] = epolicy_fun(ems_mat5);
%[ fuel_use16, metric16 ] = epolicy_fun(ems_mat6);
%[ fuel_use17, metric17 ] = epolicy_fun(ems_mat7);
%[ fuel_use18, metric18 ] = epolicy_fun(ems_mat8);
%[ fuel_use19, metric19 ] = epolicy_fun(ems_mat9);
%[ fuel_use20, metric20 ] = epolicy_fun(ems_mat10);

save('output.mat')

toc