clear all
addpath('./tools')
addpath('./tools/EqMetrics')
constants;

% Define t1 (the mitigation onset year) for each scenario. Numbers
% indicate stabilzation level (3.0 vs 4.5 W/m^2); letters indicate
% mitigaiton onest year (early vs. late).

t1_30e = 2015;
t1_30m = 2023;
t1_30l = 2035;

t1_45e = 2015;
t1_45m = 2039;
t1_45l = 2060; 

% Calculate CO2-eq emissions and resulting radiative forcing pathway for 
% each scenario: 

[ ek_30e,~,~,rf_30e,ts_30e ] = make_scenarios( t1_30e,3.0 );
[ ek_30m,~,~,rf_30m,ts_30m ] = make_scenarios( t1_30m,3.0 );
[ ek_30l,~,~,rf_30l,ts_30l ] = make_scenarios( t1_30l,3.0 );
[ ek_45e,~,~,rf_45e,ts_45e ] = make_scenarios( t1_45e,4.5 );
[ ek_45m,~,~,rf_45m,ts_45m ] = make_scenarios( t1_45m,4.5 );
[ ek_45l,~,~,rf_45l,ts_45l ] = make_scenarios( t1_45l,4.5 );

% Calculate metrics based on ts for each scenario (early and late) and a
% middle ts found by taking the average:

GWP_100 = eqMetric(@lambda_GWP,t,100)';
GWP_020 = eqMetric(@lambda_GWP,t,20)';

ICI_30e = eqMetric(@lambda_ICI,t,ts_30e)'; 
ICI_30m = eqMetric(@lambda_ICI,t,ts_30m)'; 
ICI_30l = eqMetric(@lambda_ICI,t,ts_30l)'; 
ICI_45e = eqMetric(@lambda_ICI,t,ts_45e)'; 
ICI_45m = eqMetric(@lambda_ICI,t,ts_45m)';
ICI_45l = eqMetric(@lambda_ICI,t,ts_45l)'; 

CCI_30e = eqMetric(@lambda_CCI,t,ts_30e)'; 
CCI_30m = eqMetric(@lambda_CCI,t,ts_30m)'; 
CCI_30l = eqMetric(@lambda_CCI,t,ts_30l)'; 
CCI_45e = eqMetric(@lambda_CCI,t,ts_45e)'; 
CCI_45m = eqMetric(@lambda_CCI,t,ts_45m)';
CCI_45l = eqMetric(@lambda_CCI,t,ts_45l)'; 

% Clear variables (before saving .mat file):
clear('Ak','Am','dt','ems1','ems1_k','ems1_m','ems2','ems2_k','ems2_m',...
    'ems_mat','eta1','eta2','eta_vec','first_year','form','fuel_count',...
    'gCH4_per_molCH4','gCO2_per_molCO2','ide_s','last_year','m','n',...
    'ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','t1','CH4_t0','CO2_t0',...
    'N2O_t0','a_CH4','a_CO2','a_N2O','c0_CH4','c0_CO2','c0_N2O','c1',...
    'c2','c3','conversion','e0','e1','e2','fe','t3')

save('output1.mat')