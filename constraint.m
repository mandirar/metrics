function [ C,Ceq ] = constraint( evec )
% This is the constraint function for our optimization problem.
% The constraint function takes the decision variable (x) and outputs a
% column vector of inequality constraints (c) and equality constraints
% (ceq), which take the form of column vectors.

% Compute the additional concentration pathway and additional RF pathway.
cvec = e2c_CO2(evec);
fvec = rf_CO2(cvec);

% Return inequality and equality constraints for use in fmincon. The
% inequality constraint C(x) should be constructed as an expression that
% should be less than zero, C(x) < 0. The equality constraint should be
% constructed so that Ceq(x) = 0.
RF_C = 3;
C    = fvec - RF_C; % Inequality constraint: RF < RF_C for all t.
Ceq  = [];          % No equality constraints (ceq is blank).

end