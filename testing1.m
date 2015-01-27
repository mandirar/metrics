function [ rf,energy ] = testing1( metric,emissions )

constants;
variables;

addpath('./tools/fuelUser')

% Calculate fuel use with optimization script:
e_other    = emissions .* (1-frac); %CO2 emissions outside budget (GtC)     
budget     = emissions * frac;
fuel_use   = fuelUser_fun(metric,ems_mat,budget);
ems_gases  = fuel_use * ems_mat;
evec_CO2   = ems_gases(:,1) + e_other;  %CO2 emissions (GtC)
evec_CH4   = ems_gases(:,2);            %CH4 emissions (Tg CH4)
energy     = fuel_use * eta_vec;

% Convert emissions to concentrations:
cpath_lCO2 = legacy_CO2(); %calculate legacy CO2 concentrations
cpath_lCH4 = legacy_CH4(); %calculate legacy CH4 concentrations
cpath_lN2O = legacy_N2O(); %calculate legacy N2O concentrations

cvec_CO2 = e2c_CO2(evec_CO2) + cpath_lCO2; %calculate total CO2 concentrations
cvec_CH4 = e2c_CH4(evec_CH4) + cpath_lCH4; %calculate total CH4 concentrations
cvec_N2O = cpath_lN2O;                     %calculate total N2O concentrations

% Convert concenctrations to radiative forcing:
fvec_CO2   = rf_CO2(cvec_CO2);   %calcualte CO2 radiative forcing
fvec_CH4   = rf_CH4(cvec_CH4);   %calculate CH4 radiative forcing
fvec_N2O   = rf_N2O(cvec_N2O);   %calculate N2O radiative forcing
fvec_other = rf_other*ones(n,1); %other radiative foricng (fixed term)

rf = fvec_CO2 + fvec_CH4 + fvec_N2O + fvec_other; %total radiative forcing

end