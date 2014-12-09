clear all
addpath('./tools')
constants;

% Define t1 (the mitigation onset year) for each scenario. Numbers
% indicate stabilzation level (3.0 vs 4.5 W/m^2); letters indicate
% mitigaiton onest year (early vs. late).

t1_30e = 2010; 
t1_30l = 2033;

t1_45e = 2010; 
t1_45l = 2058;

% Calculate CO2-eq emissions and resulting radiative forcing pathway for 
% each scenario: 

[ ek_30e,~,rf_30e ] = scenario_generator( t1_30e,3.0 );
[ ek_30l,~,rf_30l ] = scenario_generator( t1_30l,3.0 );

[ ek_45e,~,rf_45e ] = scenario_generator( t1_45e,4.5 );
[ ek_45l,~,rf_45l ] = scenario_generator( t1_45l,4.5 );

% Calculate ts (stabilization time) for each radiative forcing scenario:
[~,ts_30e] = max(rf_30e);                   %index   
ts_30e     = ts_30e * dt + first_year - dt; %time (years)
[~,ts_30l] = max(rf_30l);                   %index   
ts_30l     = ts_30l * dt + first_year - dt; %time (years)

[~,ts_45e] = max(rf_45e);                   %index   
ts_45e     = ts_45e * dt + first_year - dt; %time (years)
[~,ts_45l] = max(rf_45l);                   %index   
ts_45l     = ts_45l * dt + first_year - dt; %time (years)

% Clear variables (before saving .mat file):
clear('Ak','Am','dt','ems1','ems1_k','ems1_m','ems2','ems2_k','ems2_m',...
    'ems_mat','eta1','eta2','eta_vec','first_year','form','fuel_count',...
    'gCH4_per_molCH4','gCO2_per_molCO2','ide_s','last_year','m','n',...
    'peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','t1','CH4_t0','CO2_t0',...
    'N2O_t0','a_CH4','a_CO2','a_N2O','c0_CH4','c0_CO2','c0_N2O','c1',...
    'c2','c3','conversion','e0','e1','e2','fe','t3')
