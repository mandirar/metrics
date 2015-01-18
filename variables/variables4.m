%% Fuel parameters:
ems1_k   = 1;               %tech. 1 CO2 intensity (Pg C/Tg Fuel)
ems1_m   = 0;               %tech. 1 CH4 intensity (Tg CH4/Tg Fuel)
ems2_k   = 0;               %tech. 1 CO2 intensity (Pg C/Tg Fuel)
ems2_m   = 130.95;          %tech. 1 CH4 intensity (Tg CH4/Tg Fuel)
ems1     = [ems1_k ems1_m]; %tech. 1 GHG intensity (1 x gases) 
ems2     = [ems2_k ems2_m]; %tech. 2 GHG intensity (1 x gases)
ems_mat4 = [ems1 ; ems2];   %all tech. GHG intensity (fuels x gases)

clear('ems1_k','ems1_m','ems2_k','ems2_m','ems1','ems2')