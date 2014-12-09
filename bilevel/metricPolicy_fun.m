function [ fuel_use,metric ] = metricPolicy_fun( ems_mat )
% This function executes the emissions and metric optimizaton problem for a 
% specified set of variables and returns a bilevel metric.

addpath('./tools')
addpath('./tools/EqMetrics')
addpath('./fuel_user')

constants; %loads constants
variables; %loads default variables

%% Set optimization inputs:
guess = (25 * conversion) * ones(n,1); %initial guess for metric
lb    = zeros(n,1);                    %lower bounds
ub    = inf*ones(n,1);                 %upper bounds
A     = [];                            %linear inequality constraint...
b     = [];                            %...of the form Ax <= b
Aeq   = [];                            %linear equality constraint...
beq   = [];                            %...of the form Ax = b

%% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

%% Run optimizaton problem:
metric   = fmincon(@(metric) -metricPolicy_obj(metric,ems_mat),guess,A,b,Aeq,beq,lb,ub,@(metric) metricPolicy_con(metric,ems_mat),options);

fuel_use = fuelUser_fun(metric,ems_mat);

metric   = metric./conversion; %converts metric to g CO2-eq/g CH4

end

