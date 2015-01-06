function [evec_k,evec_m,evec_n,fvec,ts] = make_scenarios(t1,peak)
%function [ evec_k,evec_m,fvec_new,t2,fvec_old ] = make_scenarios( t1,peak )
% This function make a scenario given a value for t1 (the time of onset of
% mitigation) and peak radiative forcing level, or returns an error if a
% feasible sceanrio cannot be found.

constants;

t2 = find_t2(t1,peak); %time when emissions rate peaks

% Make a peak-and-decline scenario.
cpath_lCO2   = legacy_CO2();         %legacy CO2 concentrations (ppm)
cpath_lCH4   = legacy_CH4();         %legacy CH4 concentrations (ppb)
cpath_lN2O   = legacy_N2O();         %legacy N2O concentrations (ppb)
fpath_other  = rf_other * ones(n,1); %all non-CO2, non-CH4 forcings (W/m^2)

% Calculate CO2 and CH4 emissions and concentration pathways:
[cvec_kO,cvec_mO,cvec_nO,evec_kO,evec_mO,evec_nO] = conc_in_year(t1,t2);
cvec_kO = cvec_kO + cpath_lCO2;
cvec_mO = cvec_mO + cpath_lCH4;
cvec_nO = cvec_nO + cpath_lN2O;

% Calculate radiative forcing pathway:
fvec_old = rf_CO2(cvec_kO) + rf_CH4(cvec_mO) + rf_N2O(cvec_nO)...
           + fpath_other;

% Convert to a stabilization scenario:
[evec_k,evec_m,evec_n] = stabilization(evec_kO,evec_mO,evec_nO,fvec_old);

cvec_k = e2c_CO2(evec_k) + cpath_lCO2;
cvec_m = e2c_CH4(evec_m) + cpath_lCH4;
cvec_n = e2c_N2O(evec_n) + cpath_lN2O;

rf_CH4(cvec_m)

fvec = rf_CO2(cvec_k) + rf_CH4(cvec_m) + rf_N2O(cvec_n) + fpath_other;

% Calcuate stabilization time:
[~,ts_index] = max(fvec_old);                       
ts           = ts_index * dt + first_year - dt;

end

