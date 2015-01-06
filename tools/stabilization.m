function [evec_k,evec_m,evec_n] = ...
    stabilization(evec_kO,evec_mO,evec_nO,fvec_old)
% This function converts a peak-and-decline scenario into a stabilization 
% scenario by adding exactly enough additional CO2 and CH4 emissions (in
% proportion to their current emissions ratio) following the peak to keep 
% radiative forcing constant.

% INPUTS:
% evec_kO:  peak and decline CO2 emissions pathway (GtC)
% evec_mO:  peak and decline CH4 emissions pathway (Tg CH4)
% fvec_old: peak and decline radiative foricng pathyway

% OUTPUTS:
% fraction: fraction by which emissions pathways are multiplied
% fvec_new: stabiliation radiative forcing pathway

constants; 

% PRELIMINARY CALCULATIONS:

% Calculate year when radiative forcing peaks.
[rf_max,i_peak] = max(fvec_old);

% Calculate intended radiative forcing pathway.
fvec_new = [fvec_old(1:i_peak) ; rf_max * ones(n - i_peak,1)];
   
% EMISSIONS OPTIMIZATION PROBLEM:

% maximize fraction
% subject to radiative forcing equal to what we expect

% Set optimizaton inputs:
guess = ones(n,1);     %initial guess for fuel use
lb    = zeros(n,1);    %lower bounds
ub    = inf*ones(n,1); %upper bounds
A     = [];            %linear inequality constraint...
b     = [];            %...of the form Ax <= b
Aeq   = [];            %linear equality constraint...
beq   = [];            %...of the form Ax = b

% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-3;

% Run optimization problem:
fraction = fmincon(@(fraction) -objective(fraction),guess,...
    A,b,Aeq,beq,lb,ub,@(fraction)...
    constraint(fraction,evec_kO,evec_mO,evec_nO,fvec_new),options);

% Calculate emissions:
evec_k = evec_kO .* fraction;
evec_m = evec_mO .* fraction;
evec_n = evec_nO .* fraction;

end

% OBJECTIVE FUNCTION:

function [ sum_fraction ] = objective( fraction )
% This objective function maximizes the fraction multiplied by emissions 
% across all years.

sum_fraction = sum(fraction);

end

% CONSTRAINT FUNCTION:

function [ C,Ceq ] = constraint(fraction,evec_kO,evec_mO,evec_nO,fvec_new)
% This constraint function calculates radiative forcing for a given value
% of fraction and compares it to the constraint value.

constants;

% Calculate new emissions vectors:
evec_kG = evec_kO .* fraction;
evec_mG = evec_mO .* fraction;
evec_nG = evec_nO .* fraction;

% Calculate new concentration  vectors:
cpath_lCO2 = legacy_CO2();                  %legacy CO2 concentrations (ppm)
cpath_lCH4 = legacy_CH4();                  %legacy CH4 concentrations (ppb)
cpath_lN2O = legacy_N2O();                  %legacy N2O concentrations (ppb)
cvec_kG    = e2c_CO2(evec_kG) + cpath_lCO2; %CO2 concentrations
cvec_mG    = e2c_CH4(evec_mG) + cpath_lCH4; %CH4 concentrations
cvec_nG    = e2c_N2O(evec_nG) + cpath_lN2O; %N2O concentrations

% Calculate new radiative forcing vectors:
fpath_other  = rf_other * ones(n,1);
fvec_guess   = rf_CO2(cvec_kG) + rf_CH4(cvec_mG) + rf_N2O(cvec_nG)...
               + fpath_other;

% Define constraints (c: a < alpha; ceq: b = beta):
C   = [];
Ceq = fvec_guess - fvec_new;

end