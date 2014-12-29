function I = unitImpact_N2O(lambdaFun,te,helper)
% This function computes the absolute impact of emitting CH4 in an emission
% year te under the radiative forcing pricing function lambdaFun.

constants; %load constants

% For each emissions time t1(i), compute the integral from t1(i) to the 
% time horizon:

for i = 1:length(te)
   
   % Compute integral from emissions time t(i) out to "infinity":
   aLongTime = 1000;                 
   infinity  = te(i) + aLongTime;   
   tprime    = [te(i) : dt : infinity];
   I(i)      = An * sum(lambdaFun(tprime,te(i),helper) .* decay_N2O(tprime - te(i)) * dt );
  
end

% Convert units:
I = I * 1000 / gN2O_per_molN2O;

end