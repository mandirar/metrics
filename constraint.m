function [ c,ceq ] = constraint( x )
%% This is the constraint function for our optimization problem.

% The constraint function takes the decision variable (x) and outputs a
% column vector of inequality constraints (c) and equality constraints
% (ceq), which take the form of column vectors.

conc = e2c_CO2(x); %calculate concentrations due to emissions vector x
c    = conc - 400; %concentration <= 400 in each time step
ceq  = [];         %no equality constraints (ceq is blank)

end