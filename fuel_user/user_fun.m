function [ fuel_use ] = user_fun(metric,ems_mat)
% This function determines fuel use to maximize energy, given a metric and
% CO2-eq emissions budget.

constants; %loads constants
variables; %loads default variables

%% Set optimizaton inputs:
guess = rand(n,fuel_count);     %initial guess for fuel use
lb    = zeros(n,fuel_count);    %lower bounds
ub    = inf*ones(n,fuel_count); %upper bounds
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

%% Run optimization problem:
fuel_use = fmincon(@(fuel_use) -user_obj(fuel_use),guess,A,b,Aeq,beq,lb,ub,@(fuel_use) user_con(fuel_use,metric,ems_mat),options);

end