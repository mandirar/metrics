% This script executes the emissions and metric optimizaton problem for a 
% default set of variables and returns a bilevel metric.

clear all

tic

addpath('./tools')
addpath('./tools/EqMetrics')
addpath('./fuel_user')
addpath('./budgets')

constants;          %loads constants
variables;          %loads default variables
load('budgets.mat') %loads emissions constraint

%% Set optimization inputs:
guess = conversion * ones(n,1); %initial guess for metric
lb    = zeros(n,1);             %lower bounds
ub    = inf*ones(n,1);          %upper bounds
A     = [];                     %linear inequality constraint...
b     = [];                     %...of the form Ax <= b
Aeq   = [];                     %linear equality constraint...
beq   = [];                     %...of the form Ax = b

%% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

%% Run optimizaton problem:
metric = fmincon(@(metric) -metricPolicy_obj(metric,ems_mat,ek_constraint),guess,A,b,Aeq,beq,lb,ub,@(metric) metricPolicy_con(metric,ems_mat,ek_constraint),options);

metric = metric./conversion; %converts metric to g CO2-eq/g CH4

toc

clear('A','Aeq','Ak','Am','b','beq','conversion','dt','eta1','eta2',...
    'eta_vec','first_year','form','fuel_count','gCH4_per_molCH4',...
    'gCO2_per_molCO2','guess','ide_s','last_year','lb','n','options',...
    'peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','ub')