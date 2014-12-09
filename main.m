%% This script executes the optimization problem.

addpath('./tools')

global_vars; %load global variables

% Calculate optimization inputs:
evec0 = ones(n);     %initial guess for xmax
A     = [];          %linear inequality constraint...
b     = [];          %...of the form Ax <= b
Aeq   = [];          %linear equality constraint...
beq   = [];          %...of the form Ax = b
lb    = zeros(n);    %lower bounds
ub    = 100*ones(n); %upper bounds
% Note: there are problems when the upper bound is set to infinity, so it
% seems better to set it to a finite large upper bound.

% Run optimizaton problem to calculate xmax:
[evec,fval] = fmincon(@(evec) -objfun(evec),evec0,A,b,Aeq,beq,lb,ub,'constraint');

% Plot the value of the decision vector (x) versus t:
plot(t,evec)
xlabel('time (years)')
ylabel('emissions (GtC)')
title('Emissions versus Time')