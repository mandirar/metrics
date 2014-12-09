function lambda = lambda_CCI(ti,te,helper)
% This is the raditaitve forcing pricing function for the CCI. It gives the
% radiative forcing price (or something proportional to it) in impact year 
% ti for an emission in year te. Input ti can be a vector; te must be a
% scalar. Input helper is used to pass in the stabilizaton time ts.
%
% Note: The CCI is independent of te, so the second argument has no effect
% on the output, but is include to maintain the form of the function
% argument list so that the functions unitImpact_CO2, unitImpact_CH4, and
% eqMetric will function correctly.

ts     = helper;
lambda = (ti >= te) & (ti <= ts);