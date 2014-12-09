function I = unitImpact_CO2(lambdaFun,te)
% I = unitImpact_CO2(lambdaFun,te) computes the absolute impact of emitting
% CO2 in an emission year te under the RF pricing function lambdaFun.
% 
% te can be vector.
%
% lambdaFun should be a function handle for one of the lambda functions:
%   @lambda_CDM
%   @lambda_ICI
%   @lambda_CCI
%   @lambda_GWP

constants;

% For each emissions time t1(i), compute integral from t1(i) to time horizon.
for i = 1:length(te)
   
   % Compute integral from emissions time t(i) out to "infinity".
   aLongTime = 300;                 %years
   infinity  = te(i) + aLongTime;   %years
   tprime    = [te(i) : dt : infinity];
   
   I(i)      = Ak*sum( lambdaFun(tprime,te(i)) .* decay_CO2(tprime - te(i)) * dt );
end

% Convert units.
I = I / gCO2_per_molCO2;   %MJ / g CO2 (proportional to)