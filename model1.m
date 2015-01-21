clear
addpath('./tools')
addpath('./tools/EqMetrics')
constants;

% Define t1 (the mitigation onset year) for each scenario. Numbers
% indicate stabilzation level (3.0 vs 4.5 W/m^2); letters indicate
% mitigaiton onest year (early vs. late).

t1_30e = 2015;
t1_30m = 2023;
t1_30l = 2029; %linear small dt
%t1_30l = 2033; %nonlinear large dt
%t1_30l = 2035; %nonlinear small dt

t1_45e = 2015;
t1_45m = 2039;
t1_45l = 2047; %linear large dt
%t1_45l = 2058; %nonlinear large dt
%t1_45l = 2060; %nonlinear small dt

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
clearvars -except GWP_* ICI_* CCI_* ek_* rf_* ts_*
clear('rf_other')
save('output1.mat')