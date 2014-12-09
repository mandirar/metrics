function [ evec_new,cvec_new,fvec_new,t2,fvec_old,rate,evec_old,cvec_old ] = scenario_generator( t1 )

%% INPUT VARIABLES:
% Define input variables.
e0   = 13.7205; 
fe   = 0.017;     
t3   = 10;
t2   = find_t2(e0,fe,t1,t3);

% Make a peak-and-decline scenario.
rf_nonCO2;              %output: fpath_nonCO2
legacy_CO2;             %output: cpath_lCO2
[~,evec_old,cvec_add,rate] = conc_in_year(fe,t1,t2,t3,e0);
cvec_old                   = cvec_add + cpath_lCO2;           %ppm
fvec_old                   = fpath_nonCO2 + rf_CO2(cvec_old);

% Convert to a stabilization scenario.
[evec_new,cvec_new,fvec_new] = peakdecline2stabilization(evec_old,cvec_old,fvec_old);

end

