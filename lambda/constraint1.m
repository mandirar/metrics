function [ C,Ceq ] = constraint1( fuel_use )
% Constraint function for our optimization problem, which takes the 
% decision variable and outputs a column vector of inequality constraints
% (c) and a column vector of equality constraints (ceq)

% Load supporting functions, scripts, and data files.
global_vars;                        %global variables
cpath_lCO2 = legacy_CO2();          %legacy CO2 concentrations
cpath_lCH4 = legacy_CH4();          %legacy CH4 concentrations
cpath_lN2O = legacy_N2O();          %legacy N2O concentrations
load('budgets.mat'); %emissions and radiative forcing

% Interpolate radiative forcing pathway.
forcing_c = 3*ones(n,1);
%forcing_c = rf_constraint;
% Input energy growth rate constraint.
%egrowth_c = 100; %percent annual change in energy consumption (1 = 100%)

% Input fuel use growth rate constraint.
%fgrowth_c = 0.1; %percent annual change in consumption (1 = 100%)

% Input initial energy consumption constraint.
%energy0_c = 5.5*10^11; %based on current values (units: GJ)

%% Calculate fuel use growth rate:
fuel_use1 = fuel_use(1:(end - 1),:);               %make first fuel use vector
fuel_use2 = fuel_use(2:end,:);                     %make second fuel use vector
fgrowth   = dt*(fuel_use1 - fuel_use2)./fuel_use1; %calculate growth rate
fgrowth   = [fgrowth ; zeros(1,fuel_count)];       %make dimensions agree
fgrowth   = abs(fgrowth);                          %calculate absolute value

%% Calculate energy growth rate:
%energy   = fuel_use * eta_vec;              %calculate energy use
%energy1  = energy(1:(end - 1),:);           %make first energy vector
%energy2  = energy(2:end,:);                 %make second energy vector
%egrowth  = dt*(energy1 - energy2)./energy1; %calcualte growth rate
%egrowth  = [egrowth ; 0];                   %make dimensions agree
%egrowth  = abs(egrowth);                    %calculate absolute value

%% Calculate iniital energy consumption:
%energy0 = energy(1);

%% Calculate radiative forcing pathway:
% Calculate emissions from fuel use and emissions intensity
emissions = fuel_use * ems_mat; %emissions matrix 
evec_CO2  = emissions(:,1);     %extract CO2 emissions
evec_CH4  = emissions(:,2);     %extract CH4 emissions
% Calculate radiative forcing from emissions.
cvec_CO2   = e2c_CO2(evec_CO2) + cpath_lCO2; %CO2 concentration
fvec_CO2   = rf_CO2(cvec_CO2);               %CO2 radiative forcing
cvec_CH4   = e2c_CH4(evec_CH4) + cpath_lCH4; %CH4 concentration
fvec_CH4   = rf_CH4(cvec_CH4);               %CH4 radiative forcing
cvec_N2O   = cpath_lN2O;                     %N2O concentration  
fvec_N2O   = rf_N2O(cvec_N2O);               %N2O radiative forcing
fvec_other = -0.5175*ones(n,1);              %other radiative forcing
% Calculate total radiative forcing
fvec       = fvec_CO2 + fvec_CH4 + fvec_N2O + fvec_other;

%% Define constraints (c: a < alpha; ceq: b = beta):
C   = [fvec - forcing_c];
%C   = [fvec - forcing_c, egrowth - egrowth_c];
%C   = [fvec - forcing_c, fgrowth - fgrowth_c];
Ceq = [];
%Ceq = [energy0 - energy0_c];

end