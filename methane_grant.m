global_variables;

time = [0:100]';
co2_dvec = decay_CO2(time);
ch4_dvec = decay_CH4(time);
n2o_dvec = decay_N2O(time);

co2_fvec = rf_CO2(co2_dvec);
ch4_fvec = rf_CH4(ch4_dvec);
n2o_fvec = rf_N2O(n2o_dvec);