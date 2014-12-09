% This script generates a set of emission (CO2-only), concentration, and
% radiative forcing scenarios for a given maximum radiative forcing level.

% It saves an emission and radiative forcing sceanario in a .mat file for
% use in the optimization program (selected below).

addpath('./tools')

global_vars; %load global variables

%% Define mitigation years for five scenarios:
t1_A = 2013; %mitigation year A
t1_B = 2016; %mitigation year B
t1_C = 2022; %mitigation year C
t1_D = 2027; %mitigation year D
t1_E = 2030; %mitigation year E

%% Generate emissions, concentraiton, and radiative forcing vectors:
[ evec_A,cvec_A,fvec_A,t2_A,fvecO_A,rate_A,evecO_A,cvecO_A ] = scenario_generator( t1_A );
[ evec_B,cvec_B,fvec_B,t2_B,fvecO_B,rate_B,evecO_B,cvecO_B ] = scenario_generator( t1_B );
[ evec_C,cvec_C,fvec_C,t2_C,fvecO_C,rate_C,evecO_C,cvecO_C ] = scenario_generator( t1_C );
[ evec_D,cvec_D,fvec_D,t2_D,fvecO_D,rate_D,evecO_D,cvecO_D ] = scenario_generator( t1_D );
[ evec_E,cvec_E,fvec_E,t2_E,fvecO_E,rate_E,evecO_E,cvecO_E ] = scenario_generator( t1_E );

%% Select a scenario (A through E):
rf_constraint = fvec_C;
ek_constraint = evec_C;
t_old         = t;

%% Clear variables (before saving .mat file):
clear('cvecO_A','cvecO_B','cvecO_C','cvecO_D','cvecO_E','cvec_A',...
    'cvec_B','cvec_C','cvec_D','cvec_E','evecO_A','evecO_B','evecO_C',...
    'evecO_D','evecO_E','evec_A','evec_B','evec_C','evec_D','evec_E',...
    'fvecO_A','fvecO_B','fvecO_C','fvecO_D','fvecO_E','fvec_A','fvec_B',...
    'fvec_C','fvec_D','fvec_E','rate_A','rate_B','rate_C','rate_D',...
    'rate_E','t1_A','t1_B','t1_C','t1_D','t1_E','t2_A','t2_B','t2_C',...
    't2_D','t2_E','Ak','dt','ems1','ems1_k','ems1_m','ems2','ems2_k',...
    'ems2_m','ems_mat','eta1','eta2','eta_vec','first_year','form',...
    'fuel_count','gCH4_per_molCH4','gCO2_per_molCO2','ide_s',...
    'last_year','m','n','peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t');

save('constraints.mat')