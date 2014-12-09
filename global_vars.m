%% These are the global variables for the metric comparison project.

%% Declare global variables.
global dt first_year last_year t n form ide_s peak ems_mat eta_vec;

%% Define variables.
dt          = 5;                                   %time step (years)
first_year  = 2010;                                %initial year
last_year   = 2065;                                %final year
t           = (first_year : dt : last_year - dt)'; %time vector
[n,~]       = size(t);                             %length of time vector
form        = 2;                                   %form of RF function (1 = non-lienar; 2 = linear)
ide_s       = 1.4;                                 %indirect effect of CH4 (default = 1.4)
peak        = 3;                                   %maximum radiative forcing (W/m^2)

%% Define optimization variables.
% Energy density: A column vector, with length of # of fuels
eta1    = 50*10^9;       %tech. 1 energy (MJ/Tg fuel)
eta2    = 50*10^9;       %tech. 2 energy (MJ/Tg fuel)
eta_vec = [eta1 ; eta2]; %all tech. energy density vector
% Note: As a reference, the energy density of gasoline is ~46 MJ/kg.

% Fuel count: Total number of fuels (for use in sizing)
[fuel_count,~] = size(eta_vec); 

% Emissions intensity: A matrix of column vectors that gives GHG emissions
% intensity, with dimensions of # of fuels by the # of gases
ems1_k  = 1;               %tech. 1 CO2 intensity (Pg C/Tg fuel)
ems1_m  = 0;               %tech. 1 CH4 intensity (Tg CH4/Tg fuel)
ems2_k  = 0;               %tech. 2 CO2 intensity (Pg C/Tg fuel)
ems2_m  = 100;             %tech. 2 CH4 intensity (Tg CH4/Tg fuel)
ems1    = [ems1_k ems1_m]; %tech. 1 GHG intensity vector 
ems2    = [ems2_k ems2_m]; %tech. 2 GHG intensity vector
ems_mat = [ems1 ; ems2];   %all tech. GHG intensity matrix
 
%% Clear intermediate variables.
%clear('ems1_k','ems1_m','ems2_k','ems2_m','ems1','ems2','eta1','eta2',...
%    'eta1_vec','eta2_vec','convert_CO2','convert_CH4','convert_GHG',...
%    'kgCO2_PgC','kgCH4_TgCH4');

%353.8 ppb CH4 / 1 Gt CH4
Am=3.718e-4;
%mm=(0.036)/(2*sqrt(1778.675));
Ak=(5.35)/(389.324); %Wm^-2 / ppm CO2