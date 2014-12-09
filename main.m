%% This script executes the optimization problem.

clear all
tic

addpath('./tools')

global_vars; %load global variables

% Calculate optimization inputs:
guess = ones(n,fuel_count);      %initial guess for fuel use
A     = [];                      %linear inequality constraint...
b     = [];                      %...of the form Ax <= b
Aeq   = [];                      %linear equality constraint...
beq   = [];                      %...of the form Ax = b
lb    = zeros(n,fuel_count);     %lower bounds
ub    = 10^5*ones(n,fuel_count); %upper boundscl
% Note: there are problems when the upper bound is set to infinity, so it
% seems better to set it to a finite large upper bound.

% Run optimizaton problem to calculate fuel use:
options           = optimset('fmincon');
options.Algorithm = 'active-set'; % Options: 'trust-region-reflective', 'interior-point', 'sqp', 'active-set'

fuel_use = fmincon(@(fuel_use) -objfun(fuel_use),guess,A,b,Aeq,beq,lb,ub,'constraint',options);

% Plot results:
plotResults(t,eta_vec,ems_mat,fuel_use)

toc
%clear('dt','first_year','form','ide_s','last_year','n','t');