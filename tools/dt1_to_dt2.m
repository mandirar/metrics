function [ new_mat ] = dt1_to_dt2( old_mat,dt_old,dt_new )
%DT1_TO_DT2 takes a matrix incremented in time DT_OLD and changes it to 
%annual (or larger) steps DT_NEW.

% Define time vectors for OLD_MAT and NEW_MAT:
first_year = 2010;
last_year  = 2110;
tvec_old   = (first_year : dt_old : last_year - dt_old)';
tvec_new   = (first_year : dt_new : last_year - dt_new)';

% Define NEW_MAT size parameters from OLD_MAT:
[~,w_new] = size(old_mat);
[l_new,~] = size(tvec_new);

% Assign values from OLD_MAT to NEW_MAT:
new_mat   = zeros(l_new,w_new);
old_index = 1; %initialize index for OLD_MAT
new_index = 1; %initialize index for NEW_MAT
for i = first_year : dt_new : last_year - dt_new
    new_mat(new_index,:) = old_mat(old_index,:);
    old_index = old_index + round(dt_new/dt_old);
    new_index = new_index + 1;
end   

end