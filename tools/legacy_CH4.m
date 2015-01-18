function [ cpath_lCH4 ] = legacy_CH4( )
% LEGACY_CH4 calculates the legacy CH4 concentrations resulting from
% historical CH4 emissions.  Since removal does not depend on the timing of
% emissions, only the concentration at time zero (the year 2010) is needed.

constants; %loads constants

c0_CH4     = 1778.675; %current CH4 concentrations (ppb)
CH4_t0     = 700;      %pre-industiral CH4 concentraitons (ppb)

% Vector of multiplicative change in CH4 perturbation.
delta_CH4  = cumprod([1; ones(n - 1,1)*decay_CH4(dt)]);

% CH4 concentration pathway (assumes no new emissions).
cpath_lCH4 = (c0_CH4 - CH4_t0)*delta_CH4 + CH4_t0;

end

 
