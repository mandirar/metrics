% RF_NONCO2 calculates the background, exogenous radiative forcing for
% the climate scenario simulator, assuming that CH4 and N2O are allowed to 
% decay with no replacement, and other radiative forcing contributions are 
% held constant at current values.

%% INPUT VARIABLES:
% Declare global variables.
global dt

% Define time variable T and the length of the time variable N.
first_year = 2010;
last_year  = 2110;
t          = (first_year : dt : last_year - dt)';
n          = length(t);

%% Define variables
c0_CH4      = 1778.675; %current CH4 concentrations (ppb)
c0_N2O      = 323.061;  %current N2O concentrations (ppb)
CH4_t0      = 700;      %pre-industiral CH4 concentraitons (ppb)
N2O_t0      = 270;      %pre-industrial N2O concentrations (ppb)

%% Calculate CH4 radiative forcing pathway.
% Vector of multiplicative change in CH4 perturbation.
delta_CH4 = cumprod([1; ones(n - 1,1)*decay_CH4(dt)]);

% CH4 concentration pathway (assumes no new emissions).
cpath_CH4 = (c0_CH4 - CH4_t0)*delta_CH4 + CH4_t0;

% CH4 radiative forcing pathway.
fpath_CH4 = rf_CH4(cpath_CH4);

%% Calculate N2O radiative forcing pathway.
% Vector of multiplicative change in N2O perturbation.
delta_N2O = cumprod([1; ones(n - 1,1)*decay_N2O(dt)]);

% N2O concentration pathway (assumes no new emissions).
cpath_N2O = (c0_N2O - N2O_t0)*delta_N2O + N2O_t0;

% N2O radiative forcing pathway.
fpath_N2O = rf_N2O(cpath_N2O);

%% Calculate other radiative forcing pathway (constant).
fpath_other = -0.5175*ones(n,1);
% Value without including indirect effects: -0.3506.

%% Calculate total non-CO2 radiative forcing.
fpath_nonCO2 = fpath_CH4 + fpath_N2O + fpath_other;
  
%% Clear variables.
clear('t','CH4_t0','c0_CH4','N2O_t0','c0_N2O','delta_CH4','delta_N2O',...
    'first_year','last_year','n');