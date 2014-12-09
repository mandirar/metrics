% This script executes the optimization problem.

clear all
tic

addpath('./tools')
addpath('./metric_2')

global_vars; %load global variables

%% Calculate optimization inputs:
guess = 10*rand(n,variable_count);  %initial guess for fuel use
A     = [];                         %linear inequality constraint...
b     = [];                         %...of the form Ax <= b
Aeq   = [];                         %linear equality constraint...
beq   = [];                         %...of the form Ax = b
lb    = zeros(n,variable_count);    %lower bounds
ub    = inf*ones(n,variable_count); %upper bounds
% Note: there is also a non-linear equality and inequality constraint 
% matrix, defined separately (constraint folder).

%% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;
% Note: algorithm options are 'trust-region-reflective', 'interior-point', 
% 'sqp', and 'active-set.'

%% Run optimization problem:
[variables,~,~,~,Lmultipliers] = fmincon(@(variables) -objfun2(variables),guess,A,b,Aeq,beq,lb,ub,'constraint2',options);

%% Save lambda.
lambdaSim = Lmultipliers.ineqnonlin(1:n);
tSim = t;
save('./tools/EqMetrics/lambda_CDM.mat', 'tSim','lambdaSim')

%% Plot results:
fuel_use = variables(:,1:fuel_count);
metric   = variables(:,end);
plotResults2(fuel_use,lambdaSim,metric)

toc