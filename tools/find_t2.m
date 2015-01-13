function t2 = find_t2(t1,peak)
% This function finds the value of t2 (years), the time when the emisisons 
% rate peaks, for a radiative forcing pathway that just meets peak value
% (W/m^2) and a given time t1 (years) of mitigation onset. 

constants;

cpath_lCO2   = legacy_CO2();         %legacy CO2 concentrations (ppm)
cpath_lCH4   = legacy_CH4();         %legacy CH4 concentrations (ppb)
cpath_lN2O   = legacy_N2O();         %legacy N2O concentrations (ppb)
fpath_other  = rf_other * ones(n,1); %all non-CO2, non-CH4 forcings (W/m^2)

% Set allowed deviation of the maximum of the RF path from the RF ceiling.
tolerance = 0.0001; 

% Obtain an initial estimate of error.
t_low          = 0;                 % initial lower bound on t2
t_hi           = 100;               % initial upper bound on t2
try_t2         = (t_low + t_hi)/2;  % initial guess for t2

[cvec_k,cvec_m,cvec_n] = conc_in_year(t1,try_t2);
fpath_total            = rf_CO2(cvec_k + cpath_lCO2) + ...
                         rf_CH4(cvec_m + cpath_lCH4) + ...
                         rf_N2O(cvec_n + cpath_lN2O) + fpath_other;
err                    = max(fpath_total) - peak;

% Repeatedly bisect the interval until the error is within the tolerance.
num_attempts = 0;
too_many     = 100;
while abs(err) > tolerance
   num_attempts = num_attempts + 1;
   
   if num_attempts > too_many
      error('Too many attempts to find t2. Giving up.')
   end
   
   if err > 0
      t_hi  = try_t2; %try_t2 was too hi; make it the new upper bound
   else
      t_low = try_t2; %try_t2 was too low; make it the new lower bound
   end
   
   try_t2                 = (t_low + t_hi)/2;    
   [cvec_k,cvec_m,cvec_n] = conc_in_year(t1,try_t2);
   fpath_total            = rf_CO2(cvec_k + cpath_lCO2) + ...
                            rf_CH4(cvec_m + cpath_lCH4) + ...
                            rf_N2O(cvec_n + cpath_lN2O) + fpath_other;
   err                    = max(fpath_total) - peak;
end

t2 = try_t2;

end
