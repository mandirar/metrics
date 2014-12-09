%% This script executes the optimization problem.

%clear all

addpath('./tools')

global_vars; %load global variables

% Calculate optimization inputs:
guess = ones(n,fuel_count);      %initial guess for fuel use
A     = [];                      %linear inequality constraint...
b     = [];                      %...of the form Ax <= b
Aeq   = [];                      %linear equality constraint...
beq   = [];                      %...of the form Ax = b
lb    = zeros(n,fuel_count);     %lower bounds
ub    = 10^5*ones(n,fuel_count); %upper bounds
% Note: there are problems when the upper bound is set to infinity, so it
% seems better to set it to a finite large upper bound.

% Run optimizaton problem to calculate fuel use:
[fuel_use,~,exitFlag] = fmincon(@(fuel_use) -objfun(fuel_use),guess,A,b,Aeq,beq,lb,ub,'constraint');

%% PLOTS
% Note: I cut off graphs before the last year (since it's unconstrained).

%General calculations:
t_graph = t(1:end-1); %cut off time vector

% Plot the fuel use over time:
fuel_use_graph = fuel_use(1:end-1,:); %cut off fuel use matrix
figure
hold on
fuel1 = plot(t_graph,fuel_use_graph(:,1));
fuel2 = plot(t_graph,fuel_use_graph(:,2));
set(fuel2, 'Color', 'red')
legend('fuel 1','fuel 2')
xlabel('time (years)')
ylabel('fuel use')
title('Fuels Use over Time')
hold off

% Plot energy consumption over time:
energy = fuel_use * eta_vec;          %calculate energy vector
energy_graph = energy(1:end-1);       %cut off energy vector
figure
plot(t_graph,energy_graph)
xlabel('time (years)')
ylabel('energy consumption')
title('Energy Consumption over Time')

% Plot CO2 emissions over time:
emissions = fuel_use * ems_mat;       %calculate emissions matrix
evec_CO2 = emissions(:,1);            %extract CO2 emissions vector
evec_CO2_graph = evec_CO2(1:end-1);   %cut off CO2 emissions vector 
figure
plot(t_graph,evec_CO2_graph)
xlabel('time (years)')
ylabel('CO2 emissions')
title('CO2 Emissions versus Time')

% Plot CH4 emissions over time:
evec_CH4 = emissions(:,1);            %extract CH4 emissions vector
evec_CH4_graph = evec_CH4(1:end-1);   %cut off CH4 emissions vector
figure
plot(t,evec_CH4)
xlabel('time (years)')
ylabel('CH4 emissions')
title('CH4 Emissions versus Time')

% Plot radiative forcing over time:
legacy_CO2 ;                          %calculate legacy CO2 concentrations
legacy_CH4 ;                          %calculate legacy CH4 concentrations
legacy_N2O ;                          %calculate legacy N2O concentrations
% Calculate radiative forcing from CO2.
cvec_CO2 = e2c_CO2(evec_CO2) + cpath_lCO2;
fvec_CO2 = rf_CO2(cvec_CO2);
% Calculate radiative forcing from CH4.
cvec_CH4 = e2c_CH4(evec_CH4) + cpath_lCH4;
fvec_CH4 = rf_CH4(cvec_CH4);
% Calculate radiative forcing from N2O.
cvec_N2O = cpath_lN2O;
fvec_N2O = rf_N2O(cvec_N2O);
% Calcualte other forcings (constant).
fvec_other = -0.5175*ones(n,1);
% Calculate total radaitive forcing.
fvec = fvec_CO2 + fvec_CH4 + fvec_N2O + fvec_other;
fvec_graph = fvec(1:end-1);            %cut off radiative forcing vector
figure
plot(t_graph,fvec_graph)
xlabel('time (years)')
ylabel('radiative forcing (W/m^2)')
title('Radiative Forcing versus Time')

clear('dt','first_year','form','ide_s','last_year','n','t');