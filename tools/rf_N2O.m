function [ rf1,rf2 ] = rf_N2O( conc )
% This function calculates the radaitive forcing due to a given
% concentration of N2O. If form = 1, the full radiative forcing  function 
% is used. If form = 2, the linear approximation is used. 

constants;             %load constants
[~,cols] = size(conc); %number of c pathways (columns in conc)

% Calculate vector of radiative forcing calcuations.
rf_vec = [RFcalc_N2O(conc,a_N2O,CH4_t0,N2O_t0)...
    RFlin_N2O(conc,a_N2O,c0_N2O,CH4_t0,N2O_t0)];

% Assign values to RF1 and RF2.]
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
function [ rf ] = RFcalc_N2O( conc,a_N2O,CH4_t0,N2O_t0 )
rf = RFcalc_GHG(conc,a_N2O,N2O_t0)...
   - (interact(CH4_t0,conc) - interact (CH4_t0,N2O_t0));
end

% Helper function: Define linear approxiamtion function.
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