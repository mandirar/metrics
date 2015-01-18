function [ cpath_lN2O ] = legacy_N2O( )
% LEGACY_N2O calculates the legacy CH4 concentrations resulting from
% historical N2O emissions.  Since removal does not depend on the timing of
% emissions, only the concentration at time zero (the year 2010) is needed.

constants; %loads constants

c0_N2O      = 323.061;  %current N2O concentrations (ppb)
N2O_t0      = 270;      %pre-industrial N2O concentrations (ppb)

% Vector of multiplicative change in N2O perturbation.
delta_N2O = cumprod([1; ones(n - 1,1)*decay_N2O(dt)]);

% N2O concentration pathway (assumes no new emissions).
cpath_lN2O = (c0_N2O - N2O_t0)*delta_N2O + N2O_t0;

end
 
