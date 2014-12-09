function [ C,Ceq ] = constraint2( variables )
% Constraint function for our optimization problem, which takes the 
% decision variable and outputs a column vector of inequality constraints
% (c) and a column vector of equality constraints (ceq)

%% Load supporting functions, scripts, and data files.
global_vars;                        %global variables
cpath_lCO2 = legacy_CO2();          %legacy CO2 concentrations
cpath_lCH4 = legacy_CH4();          %legacy CH4 concentrations
cpath_lN2O = legacy_N2O();          %legacy N2O concentrations
load('constraints.mat'); %emissions and radiative forcing

% Interpolate emissions and radiative forcing pathways.
forcing_c      = interp1(t_old,rf_constraint,t);
emissions_c    = interp1(t_old,ek_constraint,t);

% Calculate fuel use and metric pathways.
fuel_use = variables(:,1:fuel_count);
mu       = variables(:,end);

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

%% Calculate emissions equivalnecy constraint:
% Calculate CO2-equivalent emissions 
evec_CO2eq = evec_CO2 + evec_CH4 .* mu;

%% Define constraints (c: a < alpha; ceq: b = beta):
C   = [fvec - forcing_c];
%C   = [fvec - forcing_c, evec_CO2eq - emissions_c];
%C   = [fvec - forcing_c, egrowth - egrowth_c];
%C   = [fvec - forcing_c, fgrowth - fgrowth_c];
%Ceq = [];
Ceq = [evec_CO2eq - emissions_c];
%Ceq = [energy0 - energy0_c];

end