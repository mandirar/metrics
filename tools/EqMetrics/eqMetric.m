function mu = eqMetric(lambdaFun,te)
% mu = eqMetric(lambdaFun,te) returns the equivalency metric for emissions
% in year te under RF pricing function lambdaFun.
% 
% te can be vector.
%
% lambdaFun should be a function handle for one of the lambda functions:
%   @lambda_CDM
%   @lambda_ICI
%   @lambda_CCI
%   @lambda_GWP

mu = unitImpact_CH4(lambdaFun,te) ./ unitImpact_CO2(lambdaFun,te);