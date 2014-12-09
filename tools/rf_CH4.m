function [ rf1,rf2 ] = rf_CH4 ( conc )
% This function calculates the radaitive forcing due to a given
% concentration of CH4. If form = 1, the full radiative forcing  function 
% is used. If form = 2, the linear approximation is used. 

constants;             %loads constants
[~,cols] = size(conc); %number of c pathways (columns in conc)

% Calculate vector of radaitive forcing calculations.
rf_vec = ide_s*[RFcalc_CH4(conc,a_CH4,CH4_t0,N2O_t0)...
   RFlin_CH4(conc,a_CH4,c0_CH4,CH4_t0,N2O_t0)];

% Assign values to RF1 and RF2.
rf2 = rf_vec(:,cols + 1 : cols*2);
if form == 1
   rf1 = rf_vec(:,1:cols);
else
   rf1 = rf2;
end

end

% Helper function: Define simple radiative forcing function.
function [ rf ] = RFcalc_GHG( conc,a,c_t0 )
rf = a*(sqrt(conc) - sqrt(c_t0));
end

% Helper function: Define band overlap function.
function [ overlap ] = interact( CH4,N2O )
% Define constants.
c1 = 0.47;        %units W/m^2
c2 = 2.01*10^-5;  %unitless
c3 = 5.31*10^-15; %unitless
e1 = 0.75;        %unitless
e2 = 1.52;        %unitless
overlap = c1*log(1 + c2*(CH4*N2O).^e1 + c3*CH4.*(CH4*N2O).^e2);
end

% Helper function: Define full radiative forcing function.
function [ rf ] = RFcalc_CH4( conc,a_CH4,CH4_t0,N2O_t0 )
rf = RFcalc_GHG(conc,a_CH4,CH4_t0) ...
   - (interact(conc,N2O_t0) - interact(CH4_t0,N2O_t0));
end

% Helper function: Define linear aproximation function.
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