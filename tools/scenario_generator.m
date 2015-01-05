function [ evec_k,evec_m,cvec_k,cvec_m,fvec,t2,fvec_old ] = scenario_generator( t1,peak )

constants;

t2 = find_t2(e0_k,e0_m,fe,t1,t3,peak); %time when emissions rate peaks

% Make a peak-and-decline scenario.
cpath_lCO2   = legacy_CO2();         %legacy CO2 concentrations (ppm)
cpath_lCH4   = legacy_CH4();         %legach CH4 concentrations (ppb)
fpath_other  = rf_other * ones(n,1); %all non-CO2, non-CH4 forcings (W/m^2)

[evec_kO,evec_mO] = conc_in_year(fe,t1,t2,t3,e0_k,e0_m); %CO2 and CH4 emissions
cvec_kO           = e2c_CO2(evec_kO) + cpath_lCO2; %CO2 concentrations
cvec_mO           = e2c_CH4(evec_mO) + cpath_lCH4; %CH4 concentrations

fvec_old = rf_CO2(cvec_kO) + rf_CH4(cvec_mO) + fpath_other;

% Convert to a stabilization scenario.
[fraction,fvec_new] = stabilization(evec_kO,evec_mO,fvec_old);

end

