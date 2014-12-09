function [ fuel_use ] = user_main()
% This function determines fuel use to maximize energy, given a metric and
% CO2-eq emissions budget.

global_vars;

global metric

% Optimization inputs:
guess = rand(n,fuel_count);     %initial guess for fuel use
A     = [];                     %linear inequality constraint...
b     = [];                     %...of the form Ax <= b
Aeq   = [];                     %linear equality constraint...
beq   = [];                     %...of the form Ax = b
lb    = zeros(n,fuel_count);    %lower bounds
ub    = inf*ones(n,fuel_count); %upper bounds

% Optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

[fuel_use,~,~,~,Lmultipliers] = fmincon(@(fuel_use) -user_objfun(fuel_use),guess,A,b,Aeq,beq,lb,ub,'user_constraint',options);

end

