function I = unitImpact_CH4(lambdaFun,te,helper)
% This function computes the absolute impact of emitting CH4 in an emission
% year te under the radiative forcing pricing function lambdaFun.

constants; %load constants

% For each emissions time t1(i), compute the integral from t1(i) to the 
% time horizon:

for i = 1:length(te)
   
   % Compute integral from emissions time t(i) out to "infinity":
   aLongTime = 300;                 
   infinity  = te(i) + aLongTime;   
   tprime    = [te(i) : dt : infinity];
   
   I(i)      = ide_s * Am * sum( lambdaFun(tprime,te(i),helper) .* decay_CH4(tprime - te(i)) * dt );
end

% Convert units:
I = I * 1000 / gCH4_per_molCH4;