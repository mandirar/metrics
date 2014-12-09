%% This script executes the optimization problem.

clear all
tic

addpath('./tools')

global_vars; %load global variables

% Calculate optimization inputs:
guess = 10*rand(n,fuel_count);            %initial guess for fuel use
A     = [];                            %linear inequality constraint...
b     = [];                            %...of the form Ax <= b
Aeq   = [];                            %linear equality constraint...
beq   = [];                            %...of the form Ax = b
lb    = zeros(n,fuel_count);           %lower bounds
ub    = 10^100*ones(n,fuel_count); %upper boundscl
% Note: there are problems when the upper bound is set to infinity, so it
% seems better to set it to a finite large upper bound.

% Run optimizaton problem to calculate fuel use:
options             = optimset('fmincon');
options.Algorithm   = 'interior-point'; % Options: 'trust-region-reflective', 'interior-point', 'sqp', 'active-set'
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

fuel_use = fmincon(@(fuel_use) -objfun(fuel_use),guess,A,b,Aeq,beq,lb,ub,'constraint',options);

% Plot results:
plotResults(fuel_use)

toc
%clear('dt','first_year','form','ide_s','last_year','n','t');