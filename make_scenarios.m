%% This script generates a set of emission (CO2-only), concentration, and
%% radiative forcing scenarios for a given maximum radiative forcing level.

clear all;

addpath('./tools')

%% INPUT VARIABLES:
% Declare global variables.
global form dt

global_variables;

if form == 1
    t1_A = 2010; %mitigation year A
    t1_B = 2015; %mitigation year B
    t1_C = 2020; %mitigation year C
    t1_D = 2025; %mitigation year D
    t1_E = 2030; %mitigation year E
else
    t1_A = 2010; %mitigation year A - 2011, 2011
    t1_B = 2011; %mitigation year B - 2015, 2021
    t1_C = 2019; %mitigation year C - 2020, 2030
    t1_D = 2024; %mitigation year D - 2024, 2040
    t1_E = 2027; %mitigation year E - 2028, 2049
end

%% Generate emissions, concentraiton, and radiative forcing vectors.
[ evec_A,cvec_A,fvec_A,t2_A,fvecO_A,rate_A,evecO_A,cvecO_A ] = scenario_generator( t1_A );
[ evec_B,cvec_B,fvec_B,t2_B,fvecO_B,rate_B,evecO_B,cvecO_B ] = scenario_generator( t1_B );
[ evec_C,cvec_C,fvec_C,t2_C,fvecO_C,rate_C,evecO_C,cvecO_C ] = scenario_generator( t1_C );
[ evec_D,cvec_D,fvec_D,t2_D,fvecO_D,rate_D,evecO_D,cvecO_D ] = scenario_generator( t1_D );
[ evec_E,cvec_E,fvec_E,t2_E,fvecO_E,rate_E,evecO_E,cvecO_E ] = scenario_generator( t1_E );

%% Generate matrices with outputs.
rmat_ALL      = [rate_A  rate_B  rate_C  rate_D  rate_E ] ;
emat_ALL      = [evec_A  evec_B  evec_C  evec_D  evec_E ] ; 
cmat_ALL      = [cvec_A  cvec_B  cvec_C  cvec_D  cvec_E ] ;
fmat_ALL      = [fvec_A  fvec_B  fvec_C  fvec_D  fvec_E ] ;
t1mat_ALL     = [t1_A    t1_B    t1_C    t1_D    t1_E   ] ;
t2mat_ALL     = [t2_A    t2_B    t2_C    t2_D    t2_E   ] ;
emat_OLD      = [evecO_A evecO_B evecO_C evecO_D evecO_E] ;
cmat_OLD      = [cvecO_A cvecO_B cvecO_C cvecO_D cvecO_E] ;
fmat_OLD      = [fvecO_A fvecO_B fvecO_C fvecO_D fvecO_E] ;
[~,t3mat_ALL] = max(fmat_OLD)                             ;
t2mat_ALL     = (t2mat_ALL + t1mat_ALL)                   ;
t3mat_ALL     = t3mat_ALL + 2009                          ;

%% Calculate legacy emissions.

%Load supporting vectors:
rf_nonCO2;              %output: fpath_nonCO2
legacy_CO2;             %output: cpath_lCO2

%Calculate vector of new emissions until 2015:

rf_pathway  = convert_annual(fvec_A);

size_mat                     = size(evec_E);
pre_2015                     = (2010:dt:2015)';
size_pre2015                 = size(pre_2015);
ecO2_pre2015                 = zeros(size_mat);
ecO2_pre2015(1:size_pre2015) = evec_E(1:size_pre2015);
ccO2_pre2015                 = e2c_CO2(ecO2_pre2015);

rf_legacy2010   = convert_annual(fpath_nonCO2 + rf_CO2(cpath_lCO2));
rf_legacy2015   = convert_annual(fpath_nonCO2 + rf_CO2(cpath_lCO2 + ccO2_pre2015));

%clear('t1_A','t1_B','t1_C','t1_D','t1_E','evec_A','evec_B',...
%    'evec_C','evec_D','evec_E','cvec_A','cvec_B','cvec_C','cvec_D',...
%    'cvec_E','fvec_A','fvec_B','fvec_C','fvec_D','fvec_E','fvecO_A',...
%    'fvecO_B','fvecO_C','fvecO_D','fvecO_E','t2_A','t2_B','t2_C',...
%    't2_D','t2_E','rate_A','rate_B','rate_C','rate_D','rate_E',...
%    'evecO_A','evecO_B','evecO_C','evecO_D','evecO_E','cvecO_A',...
%    'cvecO_B','cvecO_C','cvecO_D','cvecO_E')

save('scenarios.mat');