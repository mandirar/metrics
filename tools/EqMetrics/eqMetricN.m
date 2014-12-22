function mu = eqMetricN(lambdaFun,te,helper)
% This function returns the equivalency metric for emissions in year te
% under radiative forcing pricing function lambdaFun. Input lambdaFun is a 
% function handle for one of the lambda functions: @lambda_CDM, 
% @lambda_ICI, @lambda_CCI, @lambda_GWP. Input te can be a vector or a 
% scalar. Input helper can be used to pass in additioanl information, such
% as the lagrange multplier for lambda_CDM, the stabilizaton year for
% lambda_CCI and lambda_ICI, or the time horizon for lambda_GWP.

% This version of the function calculates N2O equivalency metrics.

mu = unitImpact_N2O(lambdaFun,te,helper) ./ unitImpact_CO2(lambdaFun,te,helper);

end

