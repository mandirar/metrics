% This script executes the optimization problem.

clear all
tic

addpath('./tools')

global_vars; %load global variables

%% Calculate optimization inputs:
guess = 10*rand(n,fuel_count);         %initial guess for fuel use
A     = [];                            %linear inequality constraint...
b     = [];                            %...of the form Ax <= b
Aeq   = [];                            %linear equality constraint...
beq   = [];                            %...of the form Ax = b
lb    = zeros(n,fuel_count);           %lower bounds
ub    = inf*ones(n,fuel_count);        %upper bounds
% Note: there is also a non-linear equality and inequality constraint 
% function, defined separately (constraint.m).

%% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;
% Note: algorithm options are 'trust-region-reflective', 'interior-point', 
% 'sqp', and 'active-set.'

%% Run optimization problem:
[fuel_use,~,~,~,Lmultipliers] = fmincon(@(fuel_use) -objfun(fuel_use),guess,A,b,Aeq,beq,lb,ub,'constraint',options);


%% Save lambda.
lambdaSim = Lmultipliers.ineqnonlin(1:n);
tSim = t;
save('./tools/EqMetrics/lambda_CDM.mat', 'tSim','lambdaSim')


%% Plot results:
plotResults(fuel_use,lambdaSim)

toc