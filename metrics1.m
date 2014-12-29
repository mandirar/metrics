% This script calculates equivalency metric values for generic use with a
% 2050 stabiliation horizon.

addpath('./tools')
addpath('./tools/EqMetrics')

constants;

GWP_100 = eqMetric(@lambda_GWP,t,100)';
GWP_100N = eqMetricN(@lambda_GWP,t,100)';

ICI_CH4 = eqMetric(@lambda_ICI,t,2050)'; 
ICI_N2O = eqMetricN(@lambda_ICI,t,2050)'; 
CCI_CH4 = eqMetric(@lambda_CCI,t,2050)'; 
CCI_N2O = eqMetricN(@lambda_CCI,t,2050)'; 

CCI_N2O_check = eqMetricN(@lambda_CCI,t,2110)'; 
CCI_CH4_check = eqMetric(@lambda_CCI,t,2110)'; 


clear('Ak','Am','dt','ems1','ems1_k','ems1_m','ems2','ems2_k','ems2_m',...
    'ems_mat','eta1','eta2','eta_vec','first_year','form','fuel_count',...
    'gCH4_per_molCH4','gCO2_per_molCO2','ide_s','last_year','m','n',...
    'ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','t1','CH4_t0','CO2_t0',...
    'N2O_t0','a_CH4','a_CO2','a_N2O','c0_CH4','c0_CO2','c0_N2O','c1',...
    'c2','c3','conversion','e0','e1','e2','fe','t3')

save('metrics.mat')