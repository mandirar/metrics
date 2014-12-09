function I = unitImpact_CH4(lambdaFun,te)
% I = unitImpact_CH4(lambdaFun,te) computes the absolute impact of emitting
% CH4 in an emission year te under the RF pricing function lambdaFun.
% 
% te can be vector.
%
% lambdaFun should be a function handle for one of the lambda functions:
%   @lambda_CDM
%   @lambda_ICI
%   @lambda_CCI
%   @lambda_GWP

global_vars

% For each emissions time t1(i), compute integral from t1(i) to time horizon.
for i = 1:length(te)
   
   % Compute integral from emissions time t(i) out to "infinity".
   aLongTime = 300;                 %years
   infinity  = te(i) + aLongTime;   %years
   tprime    = [te(i) : dt : infinity];
   
   I(i)      = ide_s*m * sum( lambdaFun(tprime,te(i)) .* decay_CH4(tprime - te(i)) * dt );
end

% Convert units.
I = I * 1000 / gCH4_per_molCH4;   %MJ / g CH4 (proportional to)