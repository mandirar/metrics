function [ rf ] = rf_CO2( conc,pick_form )
% This calculates the RF (W/m^2) due to a concentration of CO2 (ppm).

% Form = 1: full radiatiev foricng function.
% Form = 2: linear approxiamtion.

% If form is not specified, default from consants script is used.

constants; %load constants

rf_lin = lin_CO2(conc,a_CO2,c0_CO2,CO2_t0); %linearized radiative foricng
rf_nln = nln_CO2(conc,a_CO2,CO2_t0);        %nonlinear radiative forcing

% Default to form in constants if not specified:
if exist('pick_form','var') == 0
   pick_form = form;
end

% Select the radiative forcing ouput based on form:
if pick_form == 1
    rf = rf_nln;
elseif pick_form == 0
    rf = rf_lin;
end
   
end

% Nonlinaer radiative forcing function:
function [ rf ] = nln_CO2(conc,a,c_t0)
rf = a * log(conc/c_t0);
end

% Linear radiative forcing approximation:
function [ rf ] = lin_CO2(conc,a,c0,c_t0)
rf = a/c0 * (conc - c0) + nln_CO2(c0,a,c_t0);
end