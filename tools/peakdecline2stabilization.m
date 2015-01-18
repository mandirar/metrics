function [evec_new,cvec_new,fvec_new,f_budget] = peakdecline2stabilization(evec_old,cvec_old,fvec_old)
% [evec_new,cvec_new,fvec_new,f_budget] =
% peakdecline2stabilization(evec_old,cvec_old,fvec_old,dt) converts the a
% peak-and-decline scenario into a stabilization scenario. It adds exactly
% exactly enough additional CO2 emissions following the peak to make RF
% remain constant.
%
% INPUTS:
% evec_old: P&D emissions pathway
% cvec_old: P&D concentration pathway
% fvec_old: P&D RF pathway
% dt:       Time step
%
% OUTPUTS:
% evec_new: Stabilization emissions pathway
% cvec_new: Stabilization concentration pathway
% fvec_new: Stabilization RF pathway
% f_budget: The post-peak CO2 budget giving the CO2 that must be replaced
%           following the peak.

global_vars; %load glaobal variables

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Preliminary calculations
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Calculate year when radiative forcing peaks.
[rf_max,i_peak] = max(fvec_old);

% Split the old pathways into two parts: before the peak year and after.
evec1 = evec_old( 1:i_peak       );
cvec1 = cvec_old( 1:i_peak       );
fvec1 = fvec_old( 1:i_peak       );
evec2 = evec_old( i_peak + 1:end );
cvec2 = cvec_old( i_peak + 1:end );
fvec2 = fvec_old( i_peak + 1:end );

fpath_nonCO2 = rf_nonCO2(); %output: fpath_nonCO2
fpath_nonCO2_2 = fpath_nonCO2( i_peak + 1:end );

% Calculate RF budget and concentration budget for each time after the
% peaking year.
f_budget = rf_max - fpath_nonCO2_2;
c_budget = inverse_rf_CO2( f_budget ) * 2.12;   % Express budget in GtC for later on


%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Create new CO2 emissions, concentrations, and RF pathways
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Calculate new pathways consistent with a stabilization scenario.
% The following loop goes through each time step following the peak year
% to determine how much additional CO2 is needed to make up the RF gap
% occuring in the peak-and-decline scenario. The RF gap was converted into
% CO2 terms above, yielding the CO2 budget c_budget needed in each year.
% The entire CO2 budget at a given time step must be accounted for by 3
% sources: (1) residual concentrations from existing P&D emissions, (2)
% residual concentrations from additional post-peak emissions, (3)
% emissions at that time step (which have not had time to decay yet).
% 
% 'cvec2' are residual concentrations from existing P&D emissions.
% 'c_res_i' are residual concentrations from additional post-peak emissions.
% 'evec_add' are additional post-peak emissions.
% 'cvec_add' are additional post-peak concentrations. cvec_add(i) is
%     therefore cvec_add(i) = c_res_i + evec_add(i); i.e. residual
%     concentration up to time step i plus the emissions right at time step i.
%
% Together, these variables must satisfy
%
% c_budget(i) = cvec2(i) + c_res_i + evec_add(i)
%             = cvec2(i) + cvec_add(i).
%
% The algorithm works in the following way. At each time, we first compute
% the residual concentration c_res_i of all post-peak emissions up to that
% time. Since previous concentrations will have decayed a little, we then
% compute the additional emissions evec_add needed at that time step to
% fill the remaining gap. Then cvec_add is simply their sum.
%
% After completing the loop, we simply add the additional emissions and
% concentrations computed onto the existing P&D emissions and
% concentrations to form the correct post-peak pathways. We then splice
% these with the pre-peak pathways, which remain unchanged.

n        = length(evec2);
evec_add = zeros(n,1);
cvec_add = zeros(n,1);
cvec2    = cvec2*2.12;  % Temporarily convert from ppm to GtC to make compatible with units of evec_add.

% For each time step i after the peak..
for i = 1:n
   % Compute residual concentration of post-peak emissions leading up to i.
   jvec        = (1:i);
   Delta_t_vec = (i - jvec)*dt;
   IRFvec_add  = decay_CO2( Delta_t_vec );
   c_res_i     = IRFvec_add * evec_add(jvec);
   
   % Compute additional emissions needed at i to fill the remaining gap.
   evec_add(i) = c_budget(i) - cvec2(i) - c_res_i;

   % Sum all additional concentrations needed at i.
   cvec_add(i) = c_res_i + evec_add(i);
end
cvec2    = cvec2/2.12;     % Convert back from GtC to ppm
cvec_add = cvec_add/2.12;  % Convert from GtC to ppm

% Convert evec_add from an amount to a rate.
% (Above, evec_add had units of GtC, and was the *amount* of
% additional emissions needed during each time step of length dt. To
% convert this to a *rate* in units of Gtc/year, divide by dt.)
evec_add = evec_add/dt;

% Update post-peak pathways and splice with unchanged pre-peak pathways.
evec_new = [evec1; evec2 + evec_add];
cvec_new = [cvec1; cvec2 + cvec_add];
fvec_new = fpath_nonCO2 + rf_CO2(cvec_new);
end

% Helper function.
function conc = inverse_rf_CO2( f_K )
% Compute the concentration of CO2 that produces a given radiative forcing
% (the inverse of CO2's radiative forcing function.)  FORM determines
% whether radiative forcing is calculated using a function (FORM == 1) or a
% lienar approximation (FORM == 2)
    % Define constants.
    global_vars;
    a_CO2  = 5.35;    %W/m^2
    CO2_t0 = 278;     %ppm
    c0_CO2 = 389.324; %ppm
    % Calculate full inverse function.
    c_KF = CO2_t0*exp(f_K/a_CO2); %ppm
    % Calculate linear inverse function.
    c_KL = (f_K - a_CO2*log(c0_CO2/CO2_t0))*(c0_CO2/a_CO2) + c0_CO2;
    % Calculate matrix of concentration vectors.
    c_KFL = [c_KF c_KL];
    % Output linear or nonlinear option.
    conc = c_KFL(:,form);
end