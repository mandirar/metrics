function t2 = find_t2(e0_k,e0_m,fe,t1,t3,peak)
% This function finds the value of t2, the time when the emisisons rate 
% peaks, such that the maximum radiative forcing pathway just meets the 
% radiative forcing ceiling. It finds t2 by repeatedly bisecting the range 
% 0 to 100, calculating the radiative forcing pathway each time, and 
% repeating until the error between the maximum radiative forcing and the 
% ceiling falls below some tolerance.

% INPUTS:
% fe:   initial fractional rate of change in emissions (unitless)
% t1:   year when fe(t) begins to decline (years)
% peak: the radiative forcing cieling (W/m^2)
% t3:   -1/min[fe(t)] (unitless)
% e0_k: initial CO2 emissions (GtC)
% e0_m: initial CH4 emissions (Tg CH4)

% OUTPUTS:
% t2:   time from t1 until emissions stabilization (years)

constants;

cpath_lCO2   = legacy_CO2();         %legacy CO2 concentrations (ppm)
cpath_lCH4   = legacy_CH4();         %legach CH4 concentrations (ppb)
fpath_other  = rf_other * ones(n,1); %all non-CO2, non-CH4 forcings (W/m^2)

% Set allowed deviation of the maximum of the RF path from the RF ceiling.
tolerance = 0.001; 

% Obtain an initial estimate of error.
t_low          = 0;                 % initial lower bound on t2
t_hi           = 100;               % initial upper bound on t2
try_t2         = (t_low + t_hi)/2;  % initial guess for t2

[cnew_CO2,cnew_CH4] = conc_in_year(fe,t1,try_t2,t3,e0_k,e0_m);
fpath_total         = rf_CO2(cnew_CO2 + cpath_lCO2) + ...
                      rf_CH4(cnew_CH4 + cpath_lCH4) + fpath_other;
err                 = max(fpath_total) - peak;

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
   
   try_t2         = (t_low + t_hi)/2;
   
   
   [cnew_CO2,cnew_CH4] = conc_in_year(fe,t1,try_t2,t3,e0_k,e0_m);
   fpath_total         = rf_CO2(cnew_CO2 + cpath_lCO2) + ...
                         rf_CH4(cnew_CH4 + cpath_lCH4) + fpath_other;
   err                 = max(fpath_total) - peak;
end
t2 = try_t2;