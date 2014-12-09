% This script takes the SCENARIOS.MAT file and converts it into a file
% RF_CONSTRAINT.MAT for use in the optimization problem.

load('scenarios.mat'); %load radiative forcing pathway

% Clear variables
clear('cmat_ALL','cmat_OLD','dt','emat_ALL','emat_OLD','ems_mat',...
    'eta_vec','first_year','fmat_OLD','form','fuel_count','ide_s',...
    'last_year','n','peak','rmat_ALL','t','t1mat_ALL','t2mat_ALL',...
    't3mat_ALL');

global_vars; %load global variables

% Calculate radiative forcing constraint
const_vec = dt1_to_dt2(fmat_ALL,0.01,dt);
const_vec = const_vec(:,3); %select one of five options for the constraint

% Clear variables again
clear('dt','ems_mat','eta_vec','first_year','fmat_ALL','form',...
    'fuel_count','ide_s','last_year','n','peak','t');

save('const_vec.mat')

