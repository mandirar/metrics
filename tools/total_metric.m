% Load CO2-eq emissions vector.

load 'scenarios.mat';

eCO2eq_9 = emat_ALL(:,3);

clear('cmat_ALL','cmat_OLD','dt','emat_ALL','emat_OLD','ems_mat',...
    'eta_vec','first_year','fmat_ALL','fmat_OLD','form','fuel_count',...
    'ide_s','last_year','n','peak','rmat_ALL','t','t1mat_ALL',...
    't2mat_ALL','t3mat_ALL')

global_vars; %load global variables

% Calculate CO2 and CH4 emissions.
energy    = fuel_use * eta_vec;        %calculate energy vector
emissions = fuel_use * ems_mat;        %calculate emissions matrix
evec_CO2  = emissions(:,1);            %extract CO2 emissions vector
evec_CH4  = emissions(:,2);            %extract CH4 emissions vector

% Put CO2-eq emissions in the same number of time steps as CO2 and CH4
% emissions.
% Define new time variables:
dt_old         = 1; %time step (years)
first_year_old = 2010; %initial year
last_year_old  = 2110; %final year
t_old          = (first_year_old : dt_old : last_year_old - dt_old)';
% Interpolate radiative forcing pathway:
eCO2eq_9 = interp1(t_old,eCO2eq_9,t);

% Calculate metric: 
mu_TOT = (eCO2eq_9 - evec_CO2)./evec_CH4;
test = eCO2eq_9 - evec_CO2;