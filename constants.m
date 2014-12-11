%% General parameters:
dt          = 0.1;                                 %time step (years)
decimals    = 1;                                   %number of digets in time step
first_year  = 2010;                                %initial year
last_year   = 2110;                                %final year (2037-2046 +1; EV: 2041)
t           = (first_year : dt : last_year - dt)'; %time vector
[n,~]       = size(t);                             %length of time vector

%% Fuel parameters:
eta_k = 32.73;  %global technolgoy CO2 intensity (g CO2/J)
eta_m = 0.1165; %global technology CH4 intensity (g CH4/J)
frac  = 0.7155; %fraction of technology emissions controlled

%% Climate parameters:
Ak              = 5.35 / 389.324;     %Wm^-2 / ppm CO2
Am              = 3.718e-4;           %Wm^-2 / ppb CH4
form            = 1;                  %forcing function (1 = non-lienar; 2 = linear)
ide_s           = 1.65;               %indirect effect of CH4
gCO2_per_molCO2 = 44.01;              %g CO2 / mol CO2
gCH4_per_molCH4 = 16.04;              %g CH4 / mol CH4
ppmCO2_to_GtC   = 2.12;               %Gt C / ppm CO2
ppbCH4_to_GtCH4 = 1/353.8;            %Gt CH4 / ppb CH4
conversion      = (1/1000) * (12/44); %g CO2-eq/ g CH4 to GtC-eq/Tg CH4
rf_other        = -0.6425;            %constant RF from other sources

a_N2O  = 0.12;     %N2O rf parameter (W/m^2 / ppb^0.5)
N2O_t0 = 270;      %N2O pre-industrial concentration (ppb)
c0_N2O = 323.061;  %N2O current concentration (ppb)

a_CH4  = 0.036;    %CH4 rf parameter (W/m^2 / ppb^0.5)
CH4_t0 = 700;      %CH4 pre-industrial concentration (ppb)
c0_CH4 = 1778.675; %CH4 current concentraiton (ppb)

a_CO2  = 5.35;     %CO2 rf parameter (W/m^2)
CO2_t0 = 278;      %CO2 pre-industrial concentration (ppm)
c0_CO2 = 389.324;  %CO2 current concentration (ppm)

c1 = 0.47;         %CH4/N2O overlap parameter (W/m^2)
c2 = 2.01*10^-5;   %CH4/N2O overlap parameter (unitless)
c3 = 5.31*10^-15;  %CH4/N2O overlap parameter (unitless)
e1 = 0.75;         %CH4/N2O overlap parameter (unitless)
e2 = 1.52;         %CH4/N2O overlap parameter (unitless)

%% Scenario parameters:
e0   = 13.72; %initial emissions (GtC)
fe   = 0.017; %initial emissions growth rate (as a fraction)     
t3   = 10;    %maximum emissions decay rate (fraction of the form -1/t3)