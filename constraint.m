function [ C,Ceq ] = constraint( variables )
% Constraint function for our optimization problem, which takes the 
% decision variable and outputs a column vector of inequality constraints
% (c) and a column vector of equality constraints (ceq)

% Load supporting functions, scripts, and data files.
global_vars;                        %global variables
cpath_lCO2 = legacy_CO2();          %legacy CO2 concentrations
cpath_lCH4 = legacy_CH4();          %legacy CH4 concentrations
cpath_lN2O = legacy_N2O();          %legacy N2O concentrations
load('constraints.mat');            %emissions and radiative forcing
%load('metric.mat');                 %metric value

fuel_use = variables(:,1:(end - 1));
metric   = variables(:,end)';

% Calculate CO2-eq emissions intensities:
emsd1_k  = ems1_k * ones(1,n);                %fuel 1 dynamic CO2 intensity (1 x t)
emsd2_k  = ems2_k * ones(1,n);                %fuel 2 dynamic CO2 intensity (1 x t)
emsd_k   = [emsd1_k; emsd2_k];                %all fuel dynamic CO2 intensity (fuels x t)
emsd1_m  = ems1_m * ones(1,n);                %fuel 1 dynamic CH4 intensity (1 x t)
emsd2_m  = ems2_m * ones(1,n);                %fuel 2 dynamic CH4 intensity (1 x t)
emsd_m   = [emsd1_m; emsd2_m];                %all fuel dynamic CH4 intensity (fuels x t)
emsd_mat = emsd_k + emsd_m.*[metric; metric]; %all fuel dynamic GHG intensity (fuels x t)

% Interpolate radiative forcing pathway.
forcing_c      = interp1(t_old,rf_constraint,t);

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
Ceq = [emsd_mat.*0];

end