function lambda = lambda_CDM(ti,te,helper)
% This is the raditaitve forcing pricing function for the CDM. It gives the
% radiative forcing price (or something proportional to it) in impact year 
% ti for an emission in year te. Input "ti" can be a vector; te must be a
% scalar. Input helper is used to pass in the value of lambda.
%
% Note: The CDM is independent of te, so the second argument has no effect
% on the output, but is include to maintain the form of the function
% argument list so that the functions unitImpact_CO2, unitImpact_CH4, and
% eqMetric will function correctly.

constants;

lambdaSim = helper;
lambda    = interp1(t,lambdaSim, ti);

% Interpolation produces NaNs if the query points are outside the range of
% the underlying points. This happens when an impact year exceeds the end
% of the simulation. At these times, lambda should be zero since no value
% is place on energy after the time horizon.
lambda( isnan(lambda) ) = 0;

% Also set lambda before the emission year to zero.
lambda(ti < te) = 0;