%% This script defines the global variables used in the background
%% emissions and climate metrics simulations.

% Declare global variables.
global dt form peak ide_m ide_s frac

% Define input variables.
dt     = 0.1   ; %time step (years)
form   = 2   ; %radiative forcing functional form (1 = full function; 2 = linear approximation)
peak   = 3   ; %maximum radiative forcing (W/m^2)
ide_s  = 1.4   ; %CH4 indirect effect in simulation (1 = no indirect effect; 1.4 = current IPCC recommendation)
ide_m  = 1   ; %additional indirect effect for metric (1 = same indirect effect as simulation)
frac   = 0.15; %fraction of emissions allocated to CH4 (compare_metricsA)