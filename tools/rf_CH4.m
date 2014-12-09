function [ rf1,rf2 ] = rf_CH4 ( conc )
% RF_CH4 calcualtes the radiative forcing due to a given concentration of
% CH4.  The sub-function INTERACT corrects for the band overlap between CH4
% and N2O.  RF2 gives the radiative forcing used to calculate metrics
% (which is always a linear approximation of the radiative forcing
% function).  The input FORM determines if the radiative forcing RF1 is a
% full function or a linear approximation (1 == full function; 2 == linear
% approximation).

%% INPUT VARIABLES:
constants; %loads constants
[~,cols] = size(conc); %number of columns

%% Define greenhouse gas concentrations and other constants.
a_CH4  = 0.036;    %constant (units W/m^2 ppb^(-1/2)
CH4_t0 = 700;      %pre-industrial CH4 concentration (ppb)
N2O_t0 = 270;      %pre-industrial N2O concentration (ppb)
c0_CH4 = 1778.675; %current CH4 concentraiton (ppb)

% Note: Current concentrations are for the year 2010 and taken from the
% MESSAGE model, available on the RCP Database.

%% Calculate vector of radaitive forcing calculations.
rf_vec = ide_s*[RFcalc_CH4(conc,a_CH4,CH4_t0,N2O_t0)...
   RFlin_CH4(conc,a_CH4,c0_CH4,CH4_t0,N2O_t0)];

%% Assign values to RF1 and RF2.
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
function [ rf ] = RFcalc_CH4( conc,a_CH4,CH4_t0,N2O_t0 )
rf = RFcalc_GHG(conc,a_CH4,CH4_t0) ...
   - (interact(conc,N2O_t0) - interact(CH4_t0,N2O_t0));
end

%% Helper function: Define linear aproximation function.
function[ rf ] = RFlin_CH4( conc,a_CH4,c0_CH4,CH4_t0,N2O_t0 )
%Define constants.
c1 = 0.47;        %units W/m^2
c2 = 2.01*10^-5;  %unitless
c3 = 5.31*10^-15; %unitless
e1 = 0.75;        %unitless
e2 = 1.52;        %unitless
% Define slope.
m = a_CH4/(2*sqrt(c0_CH4))...
   - c1*((1 + c2*(c0_CH4*N2O_t0)^e1 + c3*c0_CH4*(c0_CH4*N2O_t0)^e2)^-1)*...
   (c2*e1*N2O_t0^e1*c0_CH4^(e1-1) + c3*(e2+1)*(N2O_t0*c0_CH4)^e2);
% Define radiative forcing.
rf = m*(conc - c0_CH4) + RFcalc_CH4(c0_CH4,a_CH4,CH4_t0,N2O_t0);
end