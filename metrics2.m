load('metrics.mat')

constants;

dt2 = 1;
first_year2  = 2010;                                %initial year
last_year2   = 2110;                                %final year (2037-2046 +1; EV: 2041)
t2           = (first_year2 : dt2 : last_year2 - dt2)'; %time vector

CCI2_CH4 = interp1(t,CCI_CH4,t2);
ICI2_CH4 = interp1(t,ICI_CH4,t2);
CCI2_N2O = interp1(t,CCI_N2O,t2);
ICI2_N2O = interp1(t,ICI_N2O,t2);