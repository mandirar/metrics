function [ C,Ceq ] = test_con( variables )
% This is the constraint function for our optimization problem, which takes 
% the decision variable and outputs a column vector of inequality
% constraints (c) and a column vector of equality constraints (ceq)

% Load supporting functions, scripts, and data files.
global_vars;             %global variables
load('climate_con.mat'); %emissions and radiative forcing

fuel_use   = variables(:,1:fuel_count);
metric_d   = variables(:,end);

% Interpolate emissions constraint to time steps of t:
%emissions_c = interp1(t_old,ek_constraint,t);

% Calculate CO2-eq emissions from fuel use and emissions intensities:
emissions  = fuel_use * ems_mat;                            %GHG emissions (t x fuel) * (fuel x gas) = (t x gas)
                                                            % CO2 units of PgC CH4; units of Tg CH4
evec_CO2eq = emissions(:,1) + (emissions(:,2) .* metric_d); %CO2-eq emissions (t x gas-eq)  

% Define constraints (c: a < alpha; ceq: b = beta):
C   = [];
Ceq = evec_CO2eq - emissions_c;

end