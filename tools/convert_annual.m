function [ new_mat ] = convert_annual( old_mat )
%CONVERT_ANNUAL takes a matrix incremented in time dt (as defined in 
%GLOBAL_VARIABLES) and changes it to annual (or smaller) steps for easier
%exporting to Excel and other programs.

global_variables; %load the value of dt (units of years)
step = 1;       %define new time step (units of years)

% Define time vectors for OLD_MAT and NEW_MAT:
first_year = 2010;
last_year  = 2110;
tvec_old   = (first_year :  dt  : last_year - dt  )';
tvec_new   = (first_year : step : last_year - step)';

% Define NEW_MAT size parameters from OLD_MAT and STEP:
[~ , w_old] = size(old_mat) ;
l_old       = size(tvec_old);
[l_new,~]       = size(tvec_new);
w_new       = w_old         ;

% Assign values from OLD_MAT to NEW_MAT:
new_mat   = zeros(l_new,w_new);
old_index = 1; %initialize index for OLD_MAT
new_index = 1; %initialize index for NEW_MAT
for i = first_year : step : last_year - step
    new_mat(new_index,:) = old_mat(old_index,:);
    old_index = old_index + round(step/dt);
    new_index = new_index + 1;
end   

end

