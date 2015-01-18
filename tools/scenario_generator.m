function [ evec_new,cvec_new,fvec_new,t2,fvec_old,rate,evec_old,cvec_old ] = scenario_generator( t1,peak )

% Define input variables.
constants;
t2   = find_t2(e0,fe,t1,t3,peak); %time when emissions peak (growth rate is zero)

% Make a peak-and-decline scenario.
fpath_nonCO2               = rf_nonCO2();                     %legacy CO2 concentrations (ppm)
cpath_lCO2                 = legacy_CO2();                    %non-CO2 radiative forcing (W/m^2)
[~,evec_old,cvec_add,rate] = conc_in_year(fe,t1,t2,t3,e0);    %emissions (GtC), additional concentrations (ppm)
cvec_old                   = cvec_add + cpath_lCO2;           %total concentrations (ppm)
fvec_old                   = fpath_nonCO2 + rf_CO2(cvec_old); %total radiative forcing (W/m^2)

% Convert to a stabilization scenario.
[evec_new,cvec_new,fvec_new] = peakdecline2stabilization(evec_old,cvec_old,fvec_old);

end

