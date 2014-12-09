%% These are the global variables for the metric comparison project.

%% Declare global variables.
global dt first_year last_year t n form ide_s ems_mat eta_vec fuel_count;

%% Define basic variables.
dt          = 2;                                   %time step (years)
first_year  = 2010;                                %initial year
last_year   = 2110;                                %final year
t           = (first_year : dt : last_year - dt)'; %time vector
[n,~]       = size(t);                             %length of time vector
form        = 2;                                   %form of RF function (1=non-lienar; 2=linear)
ide_s       = 1.4;                                 %indirect effect of CH4 (default 1.4)
%kgCO2_PgC   = 10^-12*(12/44);                      %converts kg CO2 to Pg (or Gt) C  
%kgCH4_TgCH4 = 10^-9;                               %converts kg CH4 to Tg CH4
%kgCO2_PgC   = 10^-12*(12/44);                      %converts kg CO2 to Pg (or Gt) C  
%kgCH4_TgCH4 = 10^-9;                               %converts kg CH4 to Tg CH4

%% Define optimization variables.
% Energy density: A column vector, with length of # of fuels
eta1    = 0;       %tech. 1 energy (MJ/Tg fuel)
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
ems2_m  = 150;             %tech. 2 CH4 intensity (Tg CH4/Tg fuel)
ems1    = [ems1_k ems1_m]; %tech. 1 GHG intensity vector 
ems2    = [ems2_k ems2_m]; %tech. 2 GHG intensity vector
ems_mat = [ems1 ; ems2];   %all tech. GHG intensity matrix

%convert_CO2 = kgCO2_PgC   * ones(fuel_count,1); %CO2 unit conversion vector
%convert_CH4 = kgCH4_TgCH4 * ones(fuel_count,1); %CH4 unit conversion vector
%convert_GHG = [convert_CO2 convert_CH4];        %GHG unit conversion matrix

%ems_mat = ems_mat .* convert_GHG; %units: PgC or TgCH4/kg fuel

%% Clear intermediate variables.
%clear('ems1_k','ems1_m','ems2_k','ems2_m','ems1','ems2','eta1','eta2',...
%    'eta1_vec','eta2_vec','convert_CO2','convert_CH4','convert_GHG',...
%    'kgCO2_PgC','kgCH4_TgCH4');