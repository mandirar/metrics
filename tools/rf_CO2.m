function [ rf ] = rf_CO2( conc,pick_form )
% This function calculates the radaitive forcing due to a given
% concentration of CO2. If form = 1, the full radiative forcing function 
% is used. If form = 2, the linear approximation is used. 

constants; %load constants

rf_lin = lin_CO2(conc,a_CO2,c0_CO2,CO2_t0); %linearized radiative foricng
rf_nln = nln_CO2(conc,a_CO2,CO2_t0);       %nonlinear radiative forcing

% Use form in constants form is not specified as input:
if exist('pick_form','var') == 0
   pick_form = form;
end

% Select the radiative forcing ouput based on the form picked:
if pick_form == 1
    rf = rf_nln;
elseif pick_form == 0
    rf = rf_lin;
end
   
end

% Nonlinaer radiative forcing function:
function [ rf ] = nln_CO2( conc,a_CO2,CO2_t0 )
rf = a_CO2 * log( conc/CO2_t0 );
end

% Linear radiative forcing approximation:
function [ rf ] = lin_CO2( conc,a_CO2,c0_CO2,CO2_t0)
rf = ( a_CO2/c0_CO2 ) * ( conc - c0_CO2 )...
     + nln_CO2( c0_CO2 , a_CO2 , CO2_t0 );
end