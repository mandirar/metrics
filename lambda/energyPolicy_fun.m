function [ fuel_use,lambdaSim,metric ] = tpolicy_fun( ems_mat )

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

%% Run optimization problem:
[fuel_use,~,~,~,Lmultipliers] = fmincon(@(fuel_use) -tpolicy_obj(fuel_use),guess,A,b,Aeq,beq,lb,ub,@(fuel_use) tpolicy_con(fuel_use,ems_mat),options);

lambdaSim = Lmultipliers.ineqnonlin(1:n);

metric = eqMetric(@lambda_CDM,t)';

end