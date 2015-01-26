% This script executes the technology optimization problem for a default
% set of variables and returns a lambda metric.

clear
tic

addpath('./tools')
addpath('./variables')
addpath('./tools/EqMetrics')

constants; %loads constants
variables; %loads default variables

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

%% Run optimization problem:
[fuel_use,~,~,~,Lmultipliers] = fmincon(@(fuel_use) -energyPolicy_obj(fuel_use),guess,A,b,Aeq,beq,lb,ub,@(fuel_use) energyPolicy_con(fuel_use,ems_mat),options);

lambda = Lmultipliers.ineqnonlin(1:n);

metric = eqMetric(@lambda_CDM,t,lambda)';

%lambda = lambda/max(lambda);

%energy = fuel_use * eta_vec;

%forcing = fuel_to_rf(fuel_use,ems_mat);

clearvars -except metric lambda fuel_use

save('lambda/energyPolicy_data.mat')

toc