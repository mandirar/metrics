function [ rf1,rf2 ] = rf_N2O( conc )
% RF_N2O calcualtes the radiative forcing due to a given concentration of
% N2O.  The sub-function INTERACT corrects for the band overlap between CH4
% and N2O.  RF2 gives the radiative forcing used to calculate metrics
% (which is always a lienar approximation of the radiative forcing 
% function).  The input FORM determines if the radiative forcing RF1 is a
% full function or a linear approximation (1 == full function; 2 == linear
% approximation).

%% INPUT VARIABLES:
constants; %loads constants
[~,cols] = size(conc); %number of columns

%% Define GHG concentrations and other constants.
a_N2O  = 0.12;    %constant (units W/m^2 ppb^(-1/2))
CH4_t0 = 700;     %pre-industrial CH4 concentration (ppb)
N2O_t0 = 270;     %pre-industrial N2O concentration (ppb)
c0_N2O = 323.061; %current N2O concentrations (ppb)

% Note: Current concentrations are for the year 2010 and taken from the
% MESSAGE model, available on the RCP Database.

%% Calculate vector of radiative forcing calcuations.
rf_vec = [RFcalc_N2O(conc,a_N2O,CH4_t0,N2O_t0)...
    RFlin_N2O(conc,a_N2O,c0_N2O,CH4_t0,N2O_t0)];

%% Assign values to RF1 and RF2.]
rf2 = rf_vec(:,cols + 1 : cols*2);
if form == 1
   rf1 = rf_vec(:,1:cols);
else
   rf1 = rf2;
end

end



%% Helper function: Define simple radiative forcing function.
function [ rf ] = RFcalc_GHG( conc,a,c_t0 )
rf = a*(sqrt(conc) - sqrt(c_t0));
end

%% Helper function: Define band overlap function.
function [ overlap ] = interact( CH4,N2O )
% Define constants.
c1 = 0.47;        %units W/m^2
c2 = 2.01*10^-5;  %unitless
c3 = 5.31*10^-15; %unitless
e1 = 0.75;        %unitless
e2 = 1.52;        %unitless
overlap = c1*log(1 + c2*(CH4*N2O).^e1 + c3*CH4.*(CH4*N2O).^e2);
end

%% Helper function: Define full radiative forcing function.
function [ rf ] = RFcalc_N2O( conc,a_N2O,CH4_t0,N2O_t0 )
rf = RFcalc_GHG(conc,a_N2O,N2O_t0)...
   - (interact(CH4_t0,conc) - interact (CH4_t0,N2O_t0));
end

%% Helper function: Define linear approxiamtion function.
function [ rf ] = RFlin_N2O( conc,a_N2O,c0_N2O,CH4_t0,N2O_t0 )
% Define constants.
c1 = 0.47;        %units W/m^2
c2 = 2.01*10^-5;  %unitless
c3 = 5.31*10^-15; %unitless
e1 = 0.75;        %unitless
e2 = 1.52;        %unitless
% Define slope.
m = a_N2O/(2*sqrt(c0_N2O))...
   - c1*((1 + c2*(CH4_t0*c0_N2O)^e1 + c3*CH4_t0*(CH4_t0*c0_N2O)^e2)^-1)*...
   (c2*e1*CH4_t0^e1*c0_N2O^(e1 - 1) + c3*e2*CH4_t0^(e2 + 1)*c0_N2O^(e2 - 1));
% Define radiative forcing.
rf = m*(conc - c0_N2O) + RFcalc_N2O(c0_N2O,a_N2O,CH4_t0,N2O_t0 );
end