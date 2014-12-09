%% Make metrics creates a vector of metric values for the ICI and CCI for
%% different values of ts - t'.  These values are used to generate metrics
%% in the METRIC_GENERATOR script.

addpath('./tools')

global_variables;

% Define time variable T and the length of the time variable N.
first_year = 2010;
last_year  = 2110;
t          = (first_year : dt : last_year - dt)';
t_index    = t - 2010;
n          = length(t);

%% ICI METRIC
% Calcualte concentrations at each point in time.
c1_CH4 = decay_CH4(t_index);
c1_CO2 = decay_CO2(t_index);
c1_N2O = decay_N2O(t_index);
c2_CH4 = 0; %compare to concentration of zero
c2_CO2 = 0; %compare to concentration of zero
c2_N2O = 0; %compare to concentration of zero
% Calculate radiative forcing at each point in time.
[~,f1_CH4] = rf_CH4(c1_CH4);
[~,f2_CH4] = rf_CH4(c2_CH4);
[~,f1_CO2] = rf_CO2(c1_CO2); 
[~,f2_CO2] = rf_CO2(c2_CO2); 
[~,f1_N2O] = rf_N2O(c1_N2O);
[~,f2_N2O] = rf_N2O(c2_N2O);

% Calculate numerator of metric for CH4.
ICI_CH4 = f1_CH4 - f2_CH4;
% Calculate numerator of metric for N2O.
ICI_N2O = f1_N2O - f2_N2O;
% Calculate deonmenator of metric.
ICI_CO2 = f1_CO2 - f2_CO2;
% Calculate metric, converting from ppb CH4/ppm CO2 to g CH4/g CO2.
ICI_valuesCH4 = ICI_CH4./ICI_CO2*(44/16)*ide_m*1000;
ICI_valuesN2O = ICI_N2O./ICI_CO2*1000;

%% CCI Metric
% Calculate integrated concentrations at each point in time.
c3_CH4 = [1 ; idecay_CH4(t_index(2:end))];
c3_CO2 = [1 ; idecay_CO2(t_index(2:end))];
c3_N2O = [1 ; idecay_N2O(t_index(2:end))];
% Calculate radiative forcing at each point in time.
[~,f3_CH4] = rf_CH4(c3_CH4);
[~,f3_CO2] = rf_CO2(c3_CO2);
[~,f3_N2O] = rf_N2O(c3_N2O);
% Calculate numerator of metric.
CCI_CH4 = f3_CH4 - f2_CH4;
CCI_N2O = f3_N2O - f2_N2O;
% Calculate denomenator of metric.
CCI_CO2 = f3_CO2 - f2_CO2;
% Calculate metric, converting from ppb CH4/ppm CO2 to g CH4/g CO2.
CCI_valuesCH4 = CCI_CH4./CCI_CO2*(44/16)*ide_m*1000;
CCI_valuesN2O = CCI_N2O./CCI_CO2*1000;

%% Clear variables.
%clear('CCI_CH4','CCI_CO2','ICI_CH4','ICI_CO2','c1_CH4','c1_CO2',...
%    'c2_CH4','c2_CO2','c3_CH4','c3_CO2','f1_CH4','f1_CO2','f2_CH4',...
%    'f2_CO2','f3_CH4','f3_CO2','first_year','last_year','t',...
%    't_index','CCI_N2O','ICI_N2O','c1_N2O','c2_N2O','c3_N2O','f1_N2O',...
%    'f2_N2O','f3_N2O')