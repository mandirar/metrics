function lambda = lambda_ICI(ti,te,helper)
% This is the raditaitve forcing pricing function for the ICI. It gives the
% radiative forcing price (or something proportional to it) in impact year 
% ti for an emission in year te. Input ti can be a vector; te must be a
% scalar. Input helper is used to pass in the stabilizaton time ts.
%
% Note: The ICI is independent of te, so the second argument has no effect
% on the output, but is include to maintain the form of the function
% argument list so that the functions unitImpact_CO2, unitImpact_CH4, and
% eqMetric will function correctly.

constants;

ts      = helper;
[~,i_s] = min( abs(ti - ts) );
lambda  = (ti == ti(i_s)) * dt;