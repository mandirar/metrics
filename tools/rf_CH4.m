function [ rf ] = rf_CH4 ( conc,pick_form )
% This calculates the RF (W/m^2) due to a concentration of CH4 (ppb).

% Form = 1: full radiatiev foricng function.
% Form = 2: linear approxiamtion.

% If form is not specified, default from consants script is used.

constants; %load constants

rf_lin = ide_s * lin_CH4(conc,a_CH4,c0_CH4,CH4_t0,N2O_t0);
rf_nln = ide_s * nln_CH4f(conc,a_CH4,CH4_t0,N2O_t0);

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

% Nonlinear simple radiative forcing function:
function [ rf ] = nln_CH4s( conc,a,c_t0 )
rf = a * ( sqrt(conc) - sqrt(c_t0) );
end

% Band overlap function:
function [ overlap ] = interact( CH4,N2O,c1,c2,c3,e1,e2 )
constants;
overlap = c1*log(1 + c2*(CH4*N2O).^e1 + c3*CH4.*(CH4*N2O).^e2);
end

% Nonlinear full radiatve forcing function:
function [ rf ] = nln_CH4f( conc,a_CH4,CH4_t0,N2O_t0 )
rf = nln_CH4s(conc,a_CH4,CH4_t0) ...
     - (interact(conc,N2O_t0) - interact(CH4_t0,N2O_t0));
end

% Linear radiative forcing approximation:
function[ rf ] = lin_CH4( conc,a_CH4,c0_CH4,CH4_t0,N2O_t0 )
constants;
% Define slope.
m = a_CH4/(2*sqrt(c0_CH4))...
   - c1*((1 + c2*(c0_CH4*N2O_t0)^e1 + c3*c0_CH4*(c0_CH4*N2O_t0)^e2)^-1)*...
   (c2*e1*N2O_t0^e1*c0_CH4^(e1-1) + c3*(e2+1)*(N2O_t0*c0_CH4)^e2);
% Define radiative forcing.
rf = m * (conc - c0_CH4) + nln_CH4f(c0_CH4,a_CH4,CH4_t0,N2O_t0);
end