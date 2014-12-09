function [ variables ] = fuel_user(metric)
% This function determines fuel use to maximize energy, given a metric (mu)
% and CO2-eq emissions budget (or CO2-eq radiative forcing budget).

% Add paths and load variables:
%addpath('./tools')
global_vars;

% Optimization inputs:
start = [rand(n,fuel_count) metric'];  %initial guess for fuel use
A     = [];                     %linear inequality constraint...
b     = [];                     %...of the form Ax <= b
Aeq   = [];                     %linear equality constraint...
beq   = [];                     %...of the form Ax = b
lb    = zeros(n,variable_count);    %lower bounds
ub    = inf*ones(n,variable_count); %upper bounds

% Optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

[variables,~,~,~,Lmultipliers] = fmincon(@(variables) -objfun(variables),start,A,b,Aeq,beq,lb,ub,'constraint',options);

end

