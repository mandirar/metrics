% This script determines an optimal metric value such that metric users 
% will make decisions that do not exceed radiative forcing targets.

clear all
tic

addpath('./tools/EqMetrics')
addpath('./tools')
global_vars;

conversion = (10^12/10^15)*(12/44); %converts g CO2-eq/g CH4 to pg C/ tg CH4 (the units used for emissions)

% Optimization inputs:
metric_guess = (25 * conversion)*ones(1,1);     %initial guess for metric (static)
lb           = zeros(1,1);    %lower bounds
ub           = inf*ones(1,1); %upper bounds
A            = [];            %linear inequality constraint...
b            = [];            %...of the form Ax <= b
Aeq          = [];            %linear equality constraint...
beq          = [];            %...of the form Ax = b

% Optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

metric = fmincon(@(metric) -policy_objfun(metric),metric_guess,A,b,Aeq,beq,lb,ub,'policy_constraint',options);

metric = metric./conversion;        %converts metric to g CO2-eq/g CH4 for comparision with other metrics 

toc