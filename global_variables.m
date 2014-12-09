%% This script defines the global variables used in the background
%% emissions and climate metrics simulations.

% Declare global variables.
global dt peak ide_m ide_s frac ide_n form first_year last_year

% Define input variables.
form   = 2;    %radiative forcing functional form (1 = full function; 2 = linear approximation)
dt     = 0.01   ; %time step (years)
peak   = 3   ; %maximum radiative forcing (W/m^2)
ide_s  = 1.65   ; %CH4 indirect effect in simulation (1 = no indirect effect; 1.4 = current IPCC recommendation)
ide_m  = 1   ; %additional indirect effect for metric (1 = same indirect effect as simulation)
ide_n  = 0.928126; %indirect effect of N2O
frac   = 0.075; %fraction of emissions allocated to CH4 (compare_metricsA)
first_year = 2010;
last_year  = 2110;