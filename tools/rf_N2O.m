function [ rf ] = rf_N2O( conc,pick_form )
% This calculates the RF (W/m^2) due to a concentration of N2O (ppb).

% Form = 1: full radiatiev foricng function.
% Form = 2: linear approxiamtion.

% If form is not specified, default from consants script is used.

constants; %load constants

rf_lin = lin_N2O(conc,a_N2O,CH4_t0,N2O_t0);        %linearized radiative foricng
rf_nln = nln_N2Of(conc,a_N2O,CH4_t0,N2O_t0); %nonlinear radiative forcing

% Use form in constants form is not specified as input:
if exist('pick_form','var') == 0
   pick_form = form;
end

% Select the radiative forcing ouput based on the form picked:
if pick_form == 1
    rf = rf_nln;
elseif pick_form == 2
    rf = rf_lin;
end

end

% Nonlinear simple radiative forcing function:
function [ rf ] = nln_N2Os( conc,a,c_t0 )
rf = a*(sqrt(conc) - sqrt(c_t0));
end

% Band overlap function:
function [ overlap ] = interact( CH4,N2O )
constants;
overlap = c1*log(1 + c2*(CH4*N2O).^e1 + c3*CH4.*(CH4*N2O).^e2);
end

% Nonlinear full radaitive forcing function:
function [ rf ] = nln_N2Of( conc,a_N2O,CH4_t0,N2O_t0 )
rf = nln_N2Os(conc,a_N2O,N2O_t0)...
   - (interact(CH4_t0,conc) - interact (CH4_t0,N2O_t0));
end

% Helper function: Define linear approxiamtion function.
function [ rf ] = lin_N2O( conc,a_N2O,c0_N2O,CH4_t0,N2O_t0 )
constants;
% Define slope.
m = a_N2O/(2*sqrt(c0_N2O))...
   - c1*((1 + c2*(CH4_t0*c0_N2O)^e1 + c3*CH4_t0*(CH4_t0*c0_N2O)^e2)^-1)*...
   (c2*e1*CH4_t0^e1*c0_N2O^(e1 - 1) + c3*e2*CH4_t0^(e2 + 1)*c0_N2O^(e2 - 1));
% Define radiative forcing.
rf = m*(conc - c0_N2O) + nln_N2Of(c0_N2O,a_N2O,CH4_t0,N2O_t0 );
end