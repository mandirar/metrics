function [ C,Ceq ] = constraint( evec )
% This is the constraint function for our optimization problem.
% The constraint function takes the decision variable (x) and outputs a
% column vector of inequality constraints (c) and equality constraints
% (ceq), which take the form of column vectors.

global_vars; %loads global variables
legacy_CO2 ; %calculate legacy CO2 concentrations
legacy_CH4 ; %calculate legacy CH4 concentrations
legacy_N2O ; %calculate legacy N2O concentrations

%% Calculate radiative forcing from CO2.
cvec_CO2 = e2c_CO2(evec) + cpath_lCO2;
fvec_CO2 = rf_CO2(cvec_CO2);

%% Calculate radiative forcing from CH4.
cvec_CH4 = cpath_lCH4;
fvec_CH4 = rf_CH4(cvec_CH4);
% Note: Currently, historical concentrations are the only contribution to
% CH4 concentrations.

%% Calculate radiative forcing from N2O.
cvec_N2O = cpath_lN2O;
fvec_N2O = rf_N2O(cvec_N2O);
% Note: Currently, historical conentrations are the only contribution to
% N2O concentrations

%% Calcualte other forcings (constant).
fvec_other = -0.5175*ones(n,1);
% Value without including indirect effects: -0.3506.

%% Calculate total radaitive forcing.
fvec = fvec_CO2 + fvec_CH4 + fvec_N2O + fvec_other;

% Return inequality and equality constraints for use in fmincon. The
% inequality constraint C(x) should be constructed as an expression that
% should be less than zero, C(x) < 0. The equality constraint should be
% constructed so that Ceq(x) = 0.
RF_C = 3;
C    = fvec - RF_C; % Inequality constraint: RF < RF_C for all t.
Ceq  = [];          % No equality constraints (ceq is blank).

end