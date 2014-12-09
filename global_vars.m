%% These are the global variables for the metric comparison project.

%% General parameters.
dt          = 1;                                   %time step (years)
first_year  = 2010;                                %initial year
last_year   = 2075;                                %final year
t           = [first_year : dt : last_year - dt]'; %time vector
[n,~]       = size(t);                             %length of time vector
form        = 2;                                   %form of RF function (1 = non-lienar; 2 = linear)
ide_s       = 1.4;                                 %indirect effect of CH4 (default = 1.4)
peak        = 3;                                   %maximum radiative forcing (W/m^2)

%% Fuel parameters.
% Energy density: A column vector, with length of # of fuels
eta1    = 50*10^9;       %tech. 1 energy (MJ/Tg fuel)
eta2    = 50*10^9;       %tech. 2 energy (MJ/Tg fuel)
eta_vec = [eta1 ; eta2]; %all tech. energy density vector
% Note: As a reference, the energy density of gasoline is ~46 MJ/kg.

% Fuel count: Total number of fuels (for use in sizing)
fuel_count     = length(eta_vec); 
variable_count = fuel_count + 1;

% Emissions intensity: A matrix of column vectors that gives GHG emissions
% intensity, with dimensions of # of fuels by the # of gases
ems1_k  = 1;               %tech. 1 CO2 intensity (Pg C/Tg fuel)
ems1_m  = 0;               %tech. 1 CH4 intensity (Tg CH4/Tg fuel)
ems2_k  = 0;               %tech. 2 CO2 intensity (Pg C/Tg fuel)
ems2_m  = 50;             %tech. 2 CH4 intensity (Tg CH4/Tg fuel)
ems1    = [ems1_k ems1_m]; %tech. 1 GHG intensity vector 
ems2    = [ems2_k ems2_m]; %tech. 2 GHG intensity vector
ems_mat = [ems1 ; ems2];   %all tech. GHG intensity matrix

%% Gas parameters.
Ak      = 5.35 / 389.324; %Wm^-2 / ppm CO2
m       = 3.718e-4;       %Wm^-2 / ppb CH4

%% Conversion constants.
gCO2_per_molCO2 = 44.01;      %g CO2 / mol CO2
gCH4_per_molCH4 = 16.04;      %g CH4 / mol CH4
ppmCO2_to_GtC   = 2.12;       %Gt C / ppm CO2
ppbCH4_to_GtCH4 = 1/353.8;    %Gt CH4 / ppb CH4