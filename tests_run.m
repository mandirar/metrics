% This script takes a set of metrics and tests their use with an emissions
% budget to determine fuel use.  The actual radiative foricng is calculated
% to comapre with intended forcing, as a measure of metric performance.

clear all
close all

% Load varaibles:
load('metrics.mat') %loads metric values
load('budgets.mat') %loads budget variables
variables1;         %loads variables

% Convert metric units:
metric1L  = metric1L .* conversion;
metric1B  = metric1B .* conversion;

ICI = ICI .* conversion;
CCI = CCI .* conversion;
GWP = GWP .* conversion;

% Run fuel user optimizaton problem for lambda metric:
fuel_use1La = fuelUser_fun(metric1L,ems_mat1);

% Run fuel user optimizaton problem for bilevel metric:
fuel_use1Ba = fuelUser_fun(metric1B,ems_mat1);

% Run fuel user optimizaton problem for ICI metric:
fuel_use1Ia = fuelUser_fun(ICI,ems_mat1);

% Run fuel user optimizaton problem for CCI metric:
fuel_use1Ca = fuelUser_fun(CCI,ems_mat1);

% Run fuel user optimizaton problem for GWP metric:
fuel_use1Ga = fuelUser_fun(GWP,ems_mat1);

% Calculate actual radiative forcing:
rf_actual1La = fuel_to_rf(fuel_use1La,ems_mat1);

clear('CCI','GWP','ICI','conversion','ek_constraint','ems_mat1',...
    'ems_mat2','ems_mat3','ems_mat4','ems_mat5','ems_mat6','ems_mat7',...
    'ems_mat8','ems_mat9','ems_mat10','fuel_use1B','fuel_use1L',...
    'lambdaSim1','metric1B','metric1L','rf_constraint','ts')