function [ rf1,rf2,rf_vec ] = rf_CO2( conc )
% RF_CO2 calcualtes the radiative forcing due to a given concentration of
% CO2. RF2 gives the radiative forcing used to calculate metrics (which is
% always a linear approximation of the radiative forcing function.  The
% input FORM determines if the radiative forcing RF1 is a full funcion or a
% linear approximation (1 == full function; 2 == linear approximation).

%% INPUT VARIABLES:
constants; %loads constants
[~,cols] = size(conc); %number of columns

%% Define CO2 concentrations and other constants.
a_CO2  = 5.35;    %constant (units W/m^2)
CO2_t0 = 278;     %pre-industrial CO2 concentration (ppm)
c0_CO2 = 389.324; %current CO2 concentration (ppm)

% Note: Current concentrations are for the year 2010 and taken from the
% MESSAGE model, available on the RCP Database.

%% Calculate vector of radaitive forcing calculations.
rf_vec = ...
    [RFcalc_CO2(conc,a_CO2,CO2_t0) RFlin_CO2(conc,a_CO2,c0_CO2,CO2_t0)]; 

%% Assign values to RF1 and RF2.
rf2 = rf_vec(:,cols + 1 : end);
if form == 1
   rf1 = rf_vec(:,1:cols);
else
   rf1 = rf2;
end

end



%% Helper function: Define radiative forcing function.
function [ rf ] = RFcalc_CO2( conc,a_CO2,CO2_t0 )
rf = a_CO2*log(conc/CO2_t0);
end

%% Helper function: Define linear approximation function.
function [ rf ] = RFlin_CO2( conc,a_CO2,c0_CO2,CO2_t0)
rf = (a_CO2/c0_CO2)*(conc - c0_CO2)...
   + RFcalc_CO2(c0_CO2,a_CO2,CO2_t0);
end