function [ C,Ceq ] = constraint( fuel_use )
% Constraint function for our optimization problem, which takes the 
% decision variable and outputs a column vector of inequality constraints
% (c) and a column vector of equality constraints (ceq)

%% Load supporting functions and scripts:
global_vars; %global variables
cpath_lCO2 = legacy_CO2(); %legacy CO2 concentrations
cpath_lCH4 = legacy_CH4(); %legacy CH4 concentrations
cpath_lN2O = legacy_N2O(); %legacy N2O concentrations

% Define emissions matrix. An element e_ti gives the emissions of gas i in
% year t.
emissions = fuel_use * ems_mat;

evec_CO2  = emissions(:,1); %extract CO2 emissions
evec_CH4  = emissions(:,2); %extract CH4 emissions

%% Calculate radiative forcing from CO2.
cvec_CO2 = e2c_CO2(evec_CO2) + cpath_lCO2; %concentration
fvec_CO2 = rf_CO2(cvec_CO2);               %radiative forcing

%% Calculate radiative forcing from CH4.
cvec_CH4 = e2c_CH4(evec_CH4) + cpath_lCH4; %concentration
fvec_CH4 = rf_CH4(cvec_CH4);               %radiative forcing

%% Calculate radiative forcing from N2O.
cvec_N2O = cpath_lN2O;                     %concentration  
fvec_N2O = rf_N2O(cvec_N2O);               %radiative forcing
% Note: We assume no new N2O emssions.

%% Calculate other forcings (constant).
fvec_other = -0.5175*ones(n,1);

%% Calculate total radaitive forcing.
fvec = fvec_CO2 + fvec_CH4 + fvec_N2O + fvec_other;

%% Calculate radiative forcing constraint.
load('const_vec.mat')

% Define new time variables:
dt_old         = 0.01; %time step (years)
first_year_old = 2010; %initial year
last_year_old  = 2110; %final year
t_old          = (first_year_old : dt_old : last_year_old - dt_old)';
% Interpolate radiative forcing pathway:
const_vec = interp1(t_old,const_vec,t);

RF_C = const_vec; 
Ceq  = fvec - RF_C; % Inequality constraint: RF < RF_C for all t.
C    = [];          % No equality constraints (ceq is blank).

end