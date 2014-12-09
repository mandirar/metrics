% Generates a general equivalency metric for metric testing (metrics can
% also be generated using the bilevel or lambda optimization problems).

clear all
global_vars;

metric_conversion = (1/1000) * (12/44);

% GWP with time horizon of 100 years:
gwp_100 = 25.*ones(n,1);                %units: g CO2-eq/g CH4
gwp_100 = gwp_100 * metric_conversion;  %units: GtC/Tg CH4

% ICI and CCI with mitigatin year t1:
%t1 = 2015; 
%[~,~,rf_metrics] = scenario_generator( t1 );

ICI = eqMetric(@lambda_ICI,t)' * metric_conversion; %units: GtC/Tg CH4 
CCI = eqMetric(@lambda_CCI,t)' * metric_conversion; %units: GtC/Tg CH4

clear('Ak','Am','dt','ems1','ems1_k','ems1_m','ems2','ems2_k','ems2_m',...
    'ems_mat','eta1','eta2','eta_vec','first_year','form','fuel_count',...
    'gCH4_per_molCH4','gCO2_per_molCO2','ide_s','last_year','m','n',...
    'peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','t1');

save('metrics.mat')