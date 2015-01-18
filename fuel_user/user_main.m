function [ variables ] = user_main(metric)
% This function determines fuel use to maximize energy, given a metric and
% CO2-eq emissions budget.

global_vars;

% Optimization inputs:
guess = rand(n,fuel_count + 1);           %initial guess for fuel use
A     = [];                               %linear inequality constraint...
b     = [];                               %...of the form Ax <= b
Aeq   = [];                               %linear equality constraint...
beq   = [];                               %...of the form Ax = b
lb    = [zeros(n,fuel_count), metric];    %lower bounds
ub    = [inf*ones(n,fuel_count), metric]; %upper bounds
% Note: I could also probably input the metric value as a linear equality
% constraint, which would be a bit cleaner.

% Optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

variables = fmincon(@(variables) -user_obj(variables),guess,A,b,Aeq,beq,lb,ub,'user_con',options);

end

