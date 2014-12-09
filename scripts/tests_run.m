% This script takes a set of metrics and tests their use with an emissions
% budget to determine fuel use.  The actual radiative foricng is calculated
% to comapre with intended forcing, as a measure of metric performance.

clear all
close all

% Load varaibles:
load('metrics.mat') %loads metric values
load('budgets.mat') %loads budget variables
variables1;         %loads variables
%variables2;         %loads variables
%variables3;         %loads variables
%variables4;         %loads variables
%varaibles5;         %loads variables
%variables6;         %loads variables
%variables7;         %loads variables
%variables8;         %loads variables
%variables9;         %loads variables
%variables10;         %loads variables

% Convert metric units:
metric1L  = metric1L  .* conversion;
%metric2L  = metric2L  .* conversion;
%metric3L  = metric3L  .* conversion;
%metric4L  = metric4L  .* conversion;
%metric5L  = metric5L  .* conversion;
%metric6L  = metric6L  .* conversion;
%metric7L  = metric7L  .* conversion;
%metric8L  = metric8L  .* conversion;
%metric9L  = metric9L  .* conversion;
%metric10L = metric10L .* conversion;
metric1B  = metric1B  .* conversion;
%metric2B  = metric2B  .* conversion;
%metric3B  = metric3B  .* conversion;
%metric4B  = metric4B  .* conversion;
%metric5B  = metric5B  .* conversion;
%metric6B  = metric6B  .* conversion;
%metric7B  = metric7B  .* conversion;
%metric8B  = metric8B  .* conversion;
%metric9B  = metric9B  .* conversion;
%metric10B = metric10B .* conversion;
ICI       = ICI       .* conversion;
CCI       = CCI       .* conversion;
GWP       = GWP       .* conversion;

% Run fuel user optimizaton problem for lambda metric:
fuel_use1La = fuelUser_fun(metric1L,ems_mat1,ek_constraint);
%fuel_use2La = fuelUser_fun(metric2L,ems_mat2);
%fuel_use3La = fuelUser_fun(metric3L,ems_mat3);
%fuel_use4La = fuelUser_fun(metric4L,ems_mat4);
%fuel_use5La = fuelUser_fun(metric5L,ems_mat5);
%fuel_use6La = fuelUser_fun(metric6L,ems_mat6);
%fuel_use7La = fuelUser_fun(metric7L,ems_mat7);
%fuel_use8La = fuelUser_fun(metric8L,ems_mat8);
%fuel_use9La = fuelUser_fun(metric9L,ems_mat9);
%fuel_use10La = fuelUser_fun(metric10L,ems_mat10);

% Run fuel user optimizaton problem for bilevel metric:
fuel_use1Ba = fuelUser_fun(metric1B,ems_mat1,ek_constraint);
%fuel_use2Ba = fuelUser_fun(metric2B,ems_mat2,ek_constraint);
%fuel_use3Ba = fuelUser_fun(metric3B,ems_mat3,ek_constraint);
%fuel_use4Ba = fuelUser_fun(metric4B,ems_mat4,ek_constraint);
%fuel_use5Ba = fuelUser_fun(metric5B,ems_mat5,ek_constraint);
%fuel_use6Ba = fuelUser_fun(metric6B,ems_mat6,ek_constraint);
%fuel_use7Ba = fuelUser_fun(metric7B,ems_mat7,ek_constraint);
%fuel_use8Ba = fuelUser_fun(metric8B,ems_mat8,ek_constraint);
%fuel_use9Ba = fuelUser_fun(metric9B,ems_mat9,ek_constraint);
%fuel_use10Ba = fuelUser_fun(metric10B,ems_mat10,ek_constraint);

% Run fuel user optimizaton problem for ICI metric:
fuel_use1Ia = fuelUser_fun(ICI,ems_mat1,ek_constraint);
%fuel_use2Ia = fuelUser_fun(ICI,ems_mat2,ek_constraint);
%fuel_use3Ia = fuelUser_fun(ICI,ems_mat3,ek_constraint);
%fuel_use4Ia = fuelUser_fun(ICI,ems_mat4,ek_constraint);
%fuel_use5Ia = fuelUser_fun(ICI,ems_mat5,ek_constraint);
%fuel_use6Ia = fuelUser_fun(ICI,ems_mat6,ek_constraint);
%fuel_use7Ia = fuelUser_fun(ICI,ems_mat7,ek_constraint);
%fuel_use8Ia = fuelUser_fun(ICI,ems_mat8,ek_constraint);
%fuel_use9Ia = fuelUser_fun(ICI,ems_mat9,ek_constraint);
%fuel_use10Ia = fuelUser_fun(ICI,ems_mat10,ek_constraint);

% Run fuel user optimizaton problem for CCI metric:
fuel_use1Ca = fuelUser_fun(CCI,ems_mat1,ek_constraint);
%fuel_use2Ca = fuelUser_fun(CCI,ems_mat2,ek_constraint);
%fuel_use3Ca = fuelUser_fun(CCI,ems_mat3,ek_constraint);
%fuel_use4Ca = fuelUser_fun(CCI,ems_mat4,ek_constraint);
%fuel_use5Ca = fuelUser_fun(CCI,ems_mat5,ek_constraint);
%fuel_use6Ca = fuelUser_fun(CCI,ems_mat6,ek_constraint);
%fuel_use7Ca = fuelUser_fun(CCI,ems_mat7,ek_constraint);
%fuel_use8Ca = fuelUser_fun(CCI,ems_mat8,ek_constraint);
%fuel_use9Ca = fuelUser_fun(CCI,ems_mat9,ek_constraint);
%fuel_use10Ca = fuelUser_fun(CCI,ems_mat10,ek_constraint);

% Run fuel user optimizaton problem for GWP metric:
fuel_use1Ga = fuelUser_fun(GWP,ems_mat1,ek_constraint);
%fuel_use2Ga = fuelUser_fun(GWP,ems_mat2,ek_constraint);
%fuel_use3Ga = fuelUser_fun(GWP,ems_mat3,ek_constraint);
%fuel_use4Ga = fuelUser_fun(GWP,ems_mat4,ek_constraint);
%fuel_use5Ga = fuelUser_fun(GWP,ems_mat5,ek_constraint);
%fuel_use6Ga = fuelUser_fun(GWP,ems_mat6,ek_constraint);
%fuel_use7Ga = fuelUser_fun(GWP,ems_mat7,ek_constraint);
%fuel_use8Ga = fuelUser_fun(GWP,ems_mat8,ek_constraint);
%fuel_use9Ga = fuelUser_fun(GWP,ems_mat9,ek_constraint);
%fuel_use10Ga = fuelUser_fun(GWP,ems_mat10,ek_constraint);

% Calculate actual radiative forcing:
rf_actual1La = fuel_to_rf(fuel_use1La,ems_mat1);

clear('CCI','GWP','ICI','conversion','ek_constraint','ems_mat1',...
    'ems_mat2','ems_mat3','ems_mat4','ems_mat5','ems_mat6','ems_mat7',...
    'ems_mat8','ems_mat9','ems_mat10','fuel_use1B','fuel_use1L',...
    'lambdaSim1','metric1B','metric1L','rf_constraint','ts')

save('tests.mat')