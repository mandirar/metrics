function t2 = find_t2(e0,fe,t1,t3)
% t2 = find_t2(e0,fe,t1,peak,t3,dt) finds the value of t2, the time when
% emissions peak, such that the maximum radiative forcing pathway just
% meets the radiative forcing ceiling. It finds t2 by repeatedly bisecting
% the range t2=[0 100], calculating the RF pathway each time, and repeating
% until the error between the RF pathway maximum and RF ceiling value falls
% below some tolerance.
%
% INPUTS:
% fe:   initial fractional rate of change in emissions (unitless)
% t1:   year when fe(t) begins to decline (years)
% peak: the radiative forcing cieling (W/m^2)
% t3:   -1/min[fe(t)] (unitless)
% e0:   initial emissions (GtC)
%
% OUTPUTS:
% t2:   time from t1 until emissions stabilization [fe(t)=0] (years)

global_vars; %load global variables

% Calculate non-CO2 radiative forcing and legacy CO2 concentrations.
cpath_lCO2   = legacy_CO2(); %legacy CO2 concentrations (ppm)
fpath_nonCO2 = rf_nonCO2();  %non-CO2 radiative forcing (W/m^2)

% Set allowed deviation of the maximum of the RF path from the RF ceiling.
tolerance = 0.001; 

% Obtain an initial estimate of error.
t_low          = 0;                 % Initial lower bound on t2
t_hi           = 100;               % Initial upper bound on t2
try_t2         = (t_low + t_hi)/2;  % Initial guess for t2

[~,~,cnew_CO2] = conc_in_year(fe,t1,try_t2,t3,e0);
fpath_total    = fpath_nonCO2 + rf_CO2(cnew_CO2 + cpath_lCO2);
err            = max(fpath_total) - peak;

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
   [~,~,cnew_CO2] = conc_in_year(fe,t1,try_t2,t3,e0);
   fpath_total    = fpath_nonCO2 + rf_CO2(cnew_CO2 + cpath_lCO2);
   err            = max(fpath_total) - peak;
end
t2 = try_t2;