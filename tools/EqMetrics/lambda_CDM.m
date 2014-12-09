function lambda = lambda_CDM(ti,te)
% lambda = lambda_CDM(ti,te) returns the RF pricing function for the CDM.
% It gives the RF-price (or something proportional to it) in impact year ti
% for an emission in year te.
%
% ti can be a vector of impact years. te must be a scalar.
%
% Note: The CDM is independent of te, so the second argument has no effect
% on the output, but is include to maintain the form of the function
% argument list so that the functions unitImpact_CO2, unitImpact_CH4, and
% eqMetric will function correctly.

% Construct lambda by interpolating the vector output of main.m. Treat t
% and lambda from the simulation as the underlying basis for interpolation,
% and treat the passed-in impact years ti as the query points.

% Load tSim and lambdaSim.
load lambda_CDM.mat

lambda = interp1(tSim,lambdaSim, ti);

% Interpolation produces NaNs if the query points are outside the range of
% the underlying points. This happens when an impact year exceeds the end
% of the simulation. At these times, lambda should be zero since no value
% is place on energy after the time horizon.
lambda( isnan(lambda) ) = 0;

% Also set lambda before the emission year to zero.
lambda(ti < te) = 0;