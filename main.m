%% This script executes the optimization problem.

addpath('./tools')

global_vars; %load global variables

% Calculate optimization inputs:
evec0 = ones(n,2);     %initial guess for xmax
A     = [];          %linear inequality constraint...
b     = [];          %...of the form Ax <= b
Aeq   = [];          %linear equality constraint...
beq   = [];          %...of the form Ax = b
lb    = zeros(n,2);    %lower bounds
ub    = 100*ones(n,2); %upper bounds
% Note: there are problems when the upper bound is set to infinity, so it
% seems better to set it to a finite large upper bound.

% Run optimizaton problem to calculate xmax:
[evec,~,~,~,lambda] = fmincon(@(evec) -objfun(evec),evec0,A,b,Aeq,beq,lb,ub,'constraint');

%% Plots
evec_CO2 = evec(:,1); %CO2 emissions pathway
evec_CH4 = evec(:,2); %CH4 emissions pathway
fvec     = fvec_calc(evec_CO2,evec_CH4); %radiative forcing pathway

% Plot the value of CO2 emissions over time.
figure
plot(t,evec_CO2)
xlabel('time (years)')
ylabel('CO2 emissions (GtC)')
title('CO2 Emissions versus Time')

% Plot the value of CH4 emissions over time.
figure
plot(t,evec_CH4)
xlabel('time (years)')
ylabel('CH4 emissions (GtC)')
title('CH4 Emissions versus Time')

% Plot the value of radiative forcing over time.
figure
plot(t,fvec)
xlabel('time (years)')
ylabel('radiative forcing (W/m^2')
title('Radiative Forcing versus Time')