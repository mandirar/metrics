function lambda = lambda_ICI(ti,te)
% lambda = lambda_ICI(ti,te) returns the RF pricing function for the ICI.
% It gives the RF-price (or something proportional to it) in impact year ti
% for an emission in year te.
%
% ti can be a vector of impact years. te must be a scalar.
%
% Note: The ICI is independent of te, so the second argument has no effect
% on the output, but is include to maintain the form of the function
% argument list so that the functions unitImpact_CO2, unitImpact_CH4, and
% eqMetric will function correctly.

global_vars % Needed to grab dt.

t_s     = 2046;
[~,i_s] = min( abs(ti - t_s) );
lambda  = (ti == ti(i_s)) * dt;