clear
close all

addpath('./tools')
load('output1.mat')

constants;

[rf_ICI30e30e,en_ICI30e30e] = testing1( ICI_30e,ek_30e ); 
[rf_ICI30e30m,en_ICI30e30m] = testing1( ICI_30m,ek_30e ); 
[rf_ICI30e30l,en_ICI30e30l] = testing1( ICI_30l,ek_30e ); 
[rf_CCI30e30e,en_CCI30e30e] = testing1( CCI_30e,ek_30e ); 
[rf_CCI30e30m,en_CCI30e30m] = testing1( CCI_30m,ek_30e ); 
[rf_CCI30e30l,en_CCI30e30l] = testing1( CCI_30l,ek_30e ); 
[rf_GWP30e   ,en_GWP30e   ] = testing1( GWP_100,ek_30e ); 

[rf_ICI30m30e,en_ICI30m30e] = testing1( ICI_30e,ek_30m ); 
[rf_ICI30m30m,en_ICI30m30m] = testing1( ICI_30m,ek_30m ); 
[rf_ICI30m30l,en_ICI30m30l] = testing1( ICI_30l,ek_30m ); 
[rf_CCI30m30e,en_CCI30m30e] = testing1( CCI_30e,ek_30m ); 
[rf_CCI30m30m,en_CCI30m30m] = testing1( CCI_30m,ek_30m ); 
[rf_CCI30m30l,en_CCI30m30l] = testing1( CCI_30l,ek_30m ); 
[rf_GWP30m   ,en_GWP30m   ]= testing1( GWP_100,ek_30m );

[rf_ICI30l30e,en_ICI30l30e] = testing1( ICI_30e,ek_30l ); 
[rf_ICI30l30m,en_ICI30l30m] = testing1( ICI_30m,ek_30l ); 
[rf_ICI30l30l,en_ICI30l30l] = testing1( ICI_30l,ek_30l ); 
[rf_CCI30l30e,en_CCI30l30e] = testing1( CCI_30e,ek_30l ); 
[rf_CCI30l30m,en_CCI30l30m] = testing1( CCI_30m,ek_30l ); 
[rf_CCI30l30l,en_CCI30l30l] = testing1( CCI_30l,ek_30l ); 
[rf_GWP30l   ,en_GWP30l   ] = testing1( GWP_100,ek_30l ); 

[rf_ICI45e45e,en_ICI45e45e] = testing1( ICI_45e,ek_45e ); 
[rf_ICI45e45m,en_ICI45e45m] = testing1( ICI_45m,ek_45e ); 
[rf_ICI45e45l,en_ICI45e45l] = testing1( ICI_45l,ek_45e ); 
[rf_CCI45e45e,en_CCI45e45e] = testing1( CCI_45e,ek_45e ); 
[rf_CCI45e45m,en_CCI45e45m] = testing1( CCI_45m,ek_45e ); 
[rf_CCI45e45l,en_CCI45e45l] = testing1( CCI_45l,ek_45e ); 
[rf_GWP45e   ,en_GWP45e   ] = testing1( GWP_100,ek_45e ); 

[rf_ICI45m45e,en_ICI45m45e] = testing1( ICI_45e,ek_45m ); 
[rf_ICI45m45m,en_ICI45m45m] = testing1( ICI_45m,ek_45m ); 
[rf_ICI45m45l,en_ICI45m45l] = testing1( ICI_45l,ek_45m ); 
[rf_CCI45m45e,en_CCI45m45e] = testing1( CCI_45e,ek_45m ); 
[rf_CCI45m45m,en_CCI45m45m] = testing1( CCI_45m,ek_45m ); 
[rf_CCI45m45l,en_CCI45m45l] = testing1( CCI_45l,ek_45m ); 
[rf_GWP45m   ,en_GWP45m   ] = testing1( GWP_100,ek_45m );

[rf_ICI45l45e,en_ICI45l45e] = testing1( ICI_45e,ek_45l ); 
[rf_ICI45l45m,en_ICI45l45m] = testing1( ICI_45m,ek_45l ); 
[rf_ICI45l45l,en_ICI45l45l] = testing1( ICI_45l,ek_45l ); 
[rf_CCI45l45e,en_CCI45l45e] = testing1( CCI_45e,ek_45l ); 
[rf_CCI45l45m,en_CCI45l45m] = testing1( CCI_45m,ek_45l ); 
[rf_CCI45l45l,en_CCI45l45l] = testing1( CCI_45l,ek_45l ); 
[rf_GWP45l   ,en_GWP45l]    = testing1( GWP_100,ek_45l ); 

clearvars -except en_* rf_*
clear('rf_other')

%clear('a_CH4','a_CO2','a_N2O','Ak','Am','c0_CH4','c0_CO2','c0_N2O','c1',...
%    'c2','c3','CH4_t0','CO2_t0','conversion','dt','e0','e1','e2','fe',...
%    'first_year','form','frac','gCH4_per_molCH4','gCO2_per_molCO2',...
%    'ide_s','last_year','n','N2O_t0','pd_30e','pd_30l','pd_45e',...
%    'pd_45l','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','t1_30e','t1_30l',...
%    't1_45e','t1_45l','t3','ts_30e','ts_30l','ts_30m','ts_45e','ts_45l',...
%    'ts_45m','CCI_30l','CCI_30m','CCI_45e','CCI_45l',...
%    'CCI_45m','ek_30e','ek_30l','ek_30m','ek_45e','ek_45l','ek_45m',...
%    'eta_k','eta_m','GWP_100','GWP_020','ICI_30l','ICI_30m',...
%    'ICI_45e','ICI_45l','ICI_45m','rf_other')

save('output2.mat')