function lambda = lambda_CCI(ti,te)
% lambda = lambda_CCI(ti,te) returns the RF pricing function for the CCI.
% It gives the RF-price (or something proportional to it) in impact year ti
% for an emission in year te.
%
% ti can be a vector of impact years. te must be a scalar.
%
% Note: The CCI is independent of te, so the second argument has no effect
% on the output, but is include to maintain the form of the function
% argument list so that the functions unitImpact_CO2, unitImpact_CH4, and
% eqMetric will function correctly.

t_s    = 2041;
lambda = (ti >= te) & (ti <= t_s);