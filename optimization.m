%% This script executes the optimization problem.

addpath('./tools')

global_vars %global variables: dt, first_year, last_year.

% Calculate size of input vectors:
t = (first_year : dt : last_year - dt)'; %time vector
l = size(t)                            ; %length of input vectos

% Calculate optimization inputs:
x0  = ones(l);    %initial guess for xmax
A   = [];         %linear inequality constraint...
b   = [];         %...of the form Ax <= b
Aeq = [];         %linear equality constraint...
beq = [];         %...of the form Ax = b
lb  = zeros(l);   %lower bounds
ub  = 100*ones(l); %upper bounds
% Note: there are problems when the upper bound is set to infinity, so it
% seems better to set it to a finite large upper bound.

% Run optimizaton problem to calculate xmax:
[x,fval] = fmincon(@(x) -objfun(x),x0,A,b,Aeq,beq,lb,ub,'constraint');

% Plot the value of the decisoin vector (x) versus t:
plot(t,x)
xlabel('time (years)')
ylabel('emissions (GtC)')
title('Emissions versus Time')
