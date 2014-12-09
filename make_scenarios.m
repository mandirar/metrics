%% This script generates a set of emission (CO2-only), concentration, and
%% radiative forcing scenarios for a given maximum radiative forcing level.

addpath('./tools')

%% INPUT VARIABLES:
global_vars; %load global variables

if form == 1
    t1_A = 2013; %mitigation year A
    t1_B = 2016; %mitigation year B
    t1_C = 2022; %mitigation year C
    t1_D = 2027; %mitigation year D
    t1_E = 2030; %mitigation year E
else
    t1_A = 2011; %mitigation year A
    t1_B = 2015; %mitigation year B
    t1_C = 2020; %mitigation year C
    t1_D = 2024; %mitigation year D
    t1_E = 2028; %mitigation year E
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

% Select scenario (in columns 1-5:
const_vec = fmat_ALL(:,3); 

% Clear variables again
clear('cmat_ALL','cmat_OLD','cvecO_A','cvecO_B','cvecO_C','cvecO_D',...
    'cvecO_E','cvec_A','cvec_B','cvec_C','cvec_D','cvec_E','emat_ALL',...
    'emat_OLD','evecO_A','evecO_B','evecO_C','evecO_D','evecO_E',...
    'evec_A','evec_B','evec_C','evec_D','evec_E','fmat_OLD','fvecO_A',...
    'fvecO_B','fvecO_C','fvecO_D','fvecO_E','fvec_A','fvec_B','fvec_C',...
    'fvec_D','fvec_E','rate_A','rate_B','rate_C','rate_D','rate_E',...
    'rmat_ALL','t1_A','t1_B','t1_C','t1_D','t1_E','t1mat_ALL','t2_A',...
    't2_B','t2_C','t2_D','t2_E','t2mat_ALL','t3mat_ALL','dt','ems_mat',...
    'eta_vec','first_year','fmat_ALL','form','fuel_count','ide_s',...
    'last_year','n','peak','t');

save('const_vec.mat')
