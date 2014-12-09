%% COMPARE_METRICSA compares the actual radiative foricng resulting from
%% using different metrics to repalce a portion of total CO2-only emissions
%% with CH4.

%% Load input data and run associated programs.
global_variables  ; 
addpath('./tools');
make_scenarios    ; %emission, concentration, and radiative forcing values
make_metrics      ; %ICI, CCI, and GWP metric values
rf_nonCO2         ; %output: rfpath_nonCO2; rfpath_CH4

%% Define REPLACE, the amount of CO2 emissions repalced with CH4.
replace      = frac.*emat_ALL; %amount of emissions replaced
replace(1,:) = 0             ; %emissions in 2010 are all CO2
metric       = CCI_mat       ; %emissions metric (select ICI, CCI, or GWP)
clear('ICI_mat','CCI_mat','GWP_mat','frac');
% Note: definig replace in this way makes it possible to easily convert to
% a fixed amount across different scenarios, which may be desirable when
% comparing 3 W/m^2 and 4.5 W/m^2 scenarios.

%% Calculate new CO2 and CH4 emissions pathways.
e_CO2   = emat_ALL - replace;    %calculate new CO2 emissions
metric  = metric*(16/44);        %convert metric from g CO2/g CH4 to parts CO2/parts CH4
replace = replace*(1/2.12)*1000; %convert allowed CH4 emissions from GtC to ppb CO2
e_CH4   = replace./metric;       %calcualte new CH4 emissions in ppb CH4

%% Calculate new CO2 concentration and radiative forcing pathways.
% Run legacy CO2 concentrations calculator.
legacy_CO2; %output:cpath_lCO2
legacy_mat = [cpath_lCO2 cpath_lCO2 cpath_lCO2 cpath_lCO2 cpath_lCO2];
clear('cpath_lCO2')

% Construct time vector.
first_year = 2010;
last_year  = 2110;
t          = (first_year : dt : last_year - dt)';

% Pre-compute all possible values of impulse response function.
Delta_t_vec = (last_year - first_year : -dt :first_year - last_year)';
IRFvec      = decay_CO2(Delta_t_vec);

% Compute the integral over emissions for each impact year t2.
n    = length(t);
cvec = zeros(n,5);
c0   = 0;
it   = 0;
for t2 = first_year : dt : last_year - dt
   it         = it + 1;
   iFirst     = (n + 2) + 1 - it; %select range of indices corresponding
   iLast      = (n + 2) + n - it; %to range of needed Delta_t's
   IRFvec_t   = IRFvec(iFirst : iLast);
   IRFmat_t   = [IRFvec_t IRFvec_t IRFvec_t IRFvec_t IRFvec_t];
   %cvec(it)  = c0 + IRFvec_t' * e_CO2 * dt;       %compute integral
   cvec(it,:) = c0 + sum(IRFmat_t .* e_CO2 .* dt); %compute integral
end
c_CO2 = cvec / 2.12 + legacy_mat; %convert from GtC to ppm

% Calculate CO2 radiative forcing vector.
f_CO2 = rf_CO2(c_CO2);

%% Calculate new non-CO2, non_CH4 radiative forcing pathway.
% Calculate previous radiative forcing from non-CO2 sources (this figure
% includes CH4) and subtract out CH4 portion.
f_other = fpath_nonCO2 - fpath_CH4;
fmat_O  = [f_other f_other f_other f_other f_other];
clear('f_other','fpath_nonCO2','fpath_CH4');

%% Calculate new CH4 concentration and radiative forcing pathways.
c0_CH4     = 700         ; %pre-industrial CH4 concentration
CH4_t0     = 1778.675    ; %initial CH4 concentration in 2010
c_CH4      = zeros(n,5)  ; %initialize CH4 concentration vector
c_CH4(1,:) = CH4_t0      ; %set initial CH4 concentration to 2010 value

% Calculate CH4 concentration vector.
it = 1;
for t2 = first_year + dt : dt : last_year - dt
    it = it + 1;
    c_CH4(it,:) = (c_CH4(it - 1,:) + e_CH4(it,:)*dt - c0_CH4)*decay_CH4(dt) + c0_CH4;
end

% Calculate CH4 radiative forcing vector.
f_CH4 = rf_CH4(c_CH4);

%% Calculate new total radiative forcing pathway.
f_total = f_CO2 + fmat_O + f_CH4;

clear('first_year','last_year','t','c0','it','CH4_t0','c0_CH4',...
    'c_temp','chist_CO2',...%'cpath_CH4','cpath_N2O','cvec','delta_CO2',...
    'ehist_CO2','fpath_N2O','iFirst','iLast','IRFmat_t','IRFvec',...
    'i_t_e','i_year','ide','n','t2','t_e','year','adjust','Delta_t_vec',...
    'IRFvec_t','fpath_other','legacy_mat');
