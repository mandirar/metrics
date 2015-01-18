function I = unitImpact_CO2(lambdaFun,te,helper)
% This function computes the absolute impact of emitting CO2 in an emission
% year te under the radiative forcing pricing function lambdaFun.

constants; %load constants

% For each emissions time t1(i), compute the integral from t1(i) to the 
% time horizon:

for i = 1:length(te)
   
   % Compute integral from emissions time t(i) out to "infinity":
   aLongTime = 1000;                     
   infinity  = te(i) + aLongTime;       
   tprime    = te(i) : dt : infinity;
   I(i)      = Ak * sum( lambdaFun(tprime,te(i),helper) .* decay_CO2(tprime - te(i)) * dt );

end

% Convert units:
I = I / gCO2_per_molCO2;