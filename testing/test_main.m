% This script  simulates the use of a metric and emissions budget to
% determine fuel use. We compare the actual to the intended radaitive 
% forcing to measure metric performance.

clear all
close all

global_vars;
load('budgets.mat');
%load('metrics4.mat');
load('output.mat');
metric_conversion = (1/1000) * (12/44);

% Choose the metric formulation:
%metric = CDM_EV;
metric = metric * metric_conversion;

% Run fuel user optimization problem:
[variables] = user_main(metric);
fuel_use    = variables(:,1:(end-1));

% Plot emissions:
emissions = fuel_use * ems_mat; %matrix of GHG emissions
evec_CO2  = emissions(:,1);     %vector of CO2 emissions
evec_CH4  = emissions(:,2);     %vector of CH4 emissions

figure
hold on
plot(t,evec_CO2, 'r');
plot(t,evec_CH4, 'g');
plot(t,ek_constraint, 'b');
hold off

% Plot radiative forcing:
rf_actual = fuel_to_rf(fuel_use);

figure
hold on
plot(t,rf_actual, 'r');
plot(t,rf_constraint, 'b');
hold off

energy = sum(sum(fuel_use));
