%% General parameters:
dt          = 1;                                   %time step (years)
first_year  = 2010;                                %initial year
last_year   = 2047;                                %final year (2037-2046 +1; EV: 2041)
t           = (first_year : dt : last_year - dt)'; %time vector
[n,~]       = size(t);                             %length of time vector
peak        = 3;                                   %radiative forcing threshold (W/m^2)

%% Fuel parameters:
eta1       = 50*10^9;         %tech. 1 energy density (MJ/Tg fuel)
eta2       = 50*10^9;         %tech. 2 energy density (MJ/Tg fuel)
eta_vec    = [eta1 ; eta2];   %all tech. energy density (# fuels x 1)
fuel_count = length(eta_vec); %number of fuels

%% Climate parameters:
Ak              = 5.35 / 389.324;     %Wm^-2 / ppm CO2
Am              = 3.718e-4;           %Wm^-2 / ppb CH4
form            = 2;                  %forcing function (1 = non-lienar; 2 = linear)
ide_s           = 1.65;               %indirect effect of CH4
gCO2_per_molCO2 = 44.01;              %g CO2 / mol CO2
gCH4_per_molCH4 = 16.04;              %g CH4 / mol CH4
ppmCO2_to_GtC   = 2.12;               %Gt C / ppm CO2
ppbCH4_to_GtCH4 = 1/353.8;            %Gt CH4 / ppb CH4
conversion      = (1/1000) * (12/44); %g CO2-eq/ g CH4 to GtC-eq/Tg CH4