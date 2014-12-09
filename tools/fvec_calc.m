function [ fvec] = fvec_calc( evec_CO2,evec_CH4,evec_N2O )
%FVEC_CALC takes a CO2, CH4, and N2O emissions pathway (evec) and returns
%the corresponding radaitive forcing pathway (fvec), assuming default
%legacy concentrations and contributions from other forcing agents.

%% Load global variables and supporting functions.
global_vars; %loads global variables
legacy_CO2 ; %calculate legacy CO2 concentrations
legacy_CH4 ; %calculate legacy CH4 concentrations
legacy_N2O ; %calculate legacy N2O concentrations

% If CH4 or N2O emissions are not specified, assume they are zero.
if nargin==1
    evec_CH4 = zeros(n,1);
    evec_N2O = zeros(n,1);
elseif nargin ==2
    evec_N2O = zeros(n,1);
end

%% Calculate radiative forcing from CO2.
cvec_CO2 = e2c_CO2(evec_CO2) + cpath_lCO2;
fvec_CO2 = rf_CO2(cvec_CO2);

%% Calculate radiative forcing from CH4.
cvec_CH4 = e2c_CH4(evec_CH4) + cpath_lCH4;
fvec_CH4 = rf_CH4(cvec_CH4);
% Note: Currently, historical concentrations are the only contribution to
% CH4 concentrations.

%% Calculate radiative forcing from N2O.
cvec_N2O = e2c_N2O(evec_N2O) + cpath_lN2O;
fvec_N2O = rf_N2O(cvec_N2O);
% Note: Currently, historical conentrations are the only contribution to
% N2O concentrations

%% Calcualte other forcings (constant).
fvec_other = -0.5175*ones(n,1);
% Value without including indirect effects: -0.3506.

%% Calculate total radaitive forcing.
fvec = fvec_CO2 + fvec_CH4 + fvec_N2O + fvec_other;

end

