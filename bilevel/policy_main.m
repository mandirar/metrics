% This script determines an optimal metric value such that metric users 
% will make decisions that do not exceed radiative forcing targets.

clear all
tic

addpath('./tools/EqMetrics')
addpath('./tools')
addpath('./fuel_user')

global_vars;

% Optimization inputs:
metric_guess = (25 * conversion) * ones(n,1); %initial guess for metric
%metric_guess = (25 * conversion); %initial guess for metric
lb           = zeros(n,1);                    %lower bounds
ub           = inf*ones(n,1);                 %upper bounds
A            = [];                            %linear inequality constraint...
b            = [];                            %...of the form Ax <= b
Aeq          = [];                            %linear equality constraint...
beq          = [];                            %...of the form Ax = b

% Optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

metric = fmincon(@(metric) -policy_obj(metric),metric_guess,A,b,Aeq,beq,lb,ub,'policy_con',options);

metric = metric./conversion; %converts metric to g CO2-eq/g CH4 for comparision with other metrics 

toc

save('CDM_4pt.mat')