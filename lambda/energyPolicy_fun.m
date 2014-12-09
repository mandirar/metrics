function [ fuel_use,lambdaSim,metric ] = energyPolicy_fun( ems_mat )
% This function executes the technology optimization problem for a 
% specified set of variables and returns a lambda metric.

addpath('./lambda')
addpath('./tools')
addpath('./tools/EqMetrics')

constants;  %loads constants

%% Set optimization inputs:
guess = 10*rand(n,fuel_count);  %initial guess for fuel use
A     = [];                     %linear inequality constraint...
b     = [];                     %...of the form Ax <= b
Aeq   = [];                     %linear equality constraint...
beq   = [];                     %...of the form Ax = b
lb    = zeros(n,fuel_count);    %lower bounds
ub    = inf*ones(n,fuel_count); %upper bounds

%% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;
ts = 2041;

%% Run optimization problem:
[fuel_use,~,~,~,Lmultipliers] = fmincon(@(fuel_use) -energyPolicy_obj(fuel_use),guess,A,b,Aeq,beq,lb,ub,@(fuel_use) energyPolicy_con(fuel_use,ems_mat),options);

lambdaSim = Lmultipliers.ineqnonlin(1:n);

metric = eqMetric(@lambda_CDM,t,lambdaSim)';

end