% This script executes the emissions and metric optimizaton problem for a 
% default set of variables and returns a bilevel metric.

clear

tic

addpath('./tools')
addpath('./tools/EqMetrics')
addpath('./fuel_user')
addpath('./variables')

constants;          %loads constants
variables;          %loads default variables
load('budgets.mat') %loads emissions constraint

%% Set optimization inputs:
guess = conversion * 50 * ones(n,1); %initial guess for metric
lb    = zeros(n,1);                  %lower bounds
ub    = inf*ones(n,1);               %upper bounds
A     = [];                          %linear inequality constraint...
b     = [];                          %...of the form Ax <= b
Aeq   = [];                          %linear equality constraint...
beq   = [];                          %...of the form Ax = b

%% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

%% Run optimizaton problem:
metric = fmincon(@(metric) metricPolicy_obj(metric),guess,A,b,Aeq,beq,lb,ub,@(metric) metricPolicy_con(metric,ems_mat,ek_constraint),options);

%% Calculate other outputs:
metric   = metric./conversion; %converts metric to g CO2-eq/g CH4
fuel_use = fuelUser_fun(metric,ems_mat,ek_constraint);
forcing  = fuel_to_rf(fuel_use);
clearvars -except metric ek_constraint rf_constraint fuel_use forcing

toc