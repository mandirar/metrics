%% These are the global variables for the metric comparison project.

%% Declare global variables.
global dt first_year last_year t n form ide_s ems_mat eta_vec fuel_count;

%% Define basic variables.
dt         = 5;                                   %time step
first_year = 2010;                                %initial year
last_year  = 2110;                                %final year
t          = (first_year : dt : last_year - dt)'; %time vector
[n,~]      = size(t);                             %length of time vector
form       = 2;                                   %form of RF function (1=non-lienar; 2=linear)
ide_s      = 1.4;                                 %indirect effect of CH4 (default 1.4)

%% Define optimization variables.
% Emissions intensity:
% (A matrix of column vectors that gives the greenhouse gas emissions 
% intensity for each gas, with dimensions of # of fuels by the # of gases)
ems1_k         = 1;               %tech. 1 CO2 intensity (mass CO2/mass fuel)
ems1_m         = 0;               %tech. 1 CH4 intensity (mass CH4/mass fuel)
ems2_k         = 0;               %tech. 2 CO2 intensity (mass CO2/mass fuel)
ems2_m         = 100000;            %tech. 2 CH4 intensity (mass CO2/mass fuel)
ems1           = [ems1_k ems1_m]; %tech. 1 GHG intensity vector
ems2           = [ems2_k ems2_m]; %tech. 2 GHG intensity vector
ems_mat        = [ems1 ; ems2];   %all tech. GHG intensity matrix

% Embodied energy:
% (A column vector of the energy embodied in each fuel, with length of # of 
% fuels)
eta1           = 1;              %tech. 1 embodied energy (energy/mass fuel)
eta2           = 1e-6;              %tech. 2 embodied energy (energy/mass fuel)
eta_vec        = [eta1 ; eta2];  %all tech. emboedied energy vector
% Fuel count:
[fuel_count,~] = size(eta_vec);  %total number of fuels (for use in sizing)

%% Clear intermediate variables.
clear('ems1_k','ems1_m','ems2_k','ems2_m','ems1','ems2','eta1','eta2',...
    'eta1_vec','eta2_vec');