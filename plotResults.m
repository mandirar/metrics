function plotResults(fuel_use,lambda)

global_vars; %load global variables

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Preliminary calculations.
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%

energy    = fuel_use * eta_vec;        %calculate energy vector
emissions = fuel_use * ems_mat;        %calculate emissions matrix
evec_CO2  = emissions(:,1);            %extract CO2 emissions vector
evec_CH4  = emissions(:,2);            %extract CH4 emissions vector

% Re-compute RF pathway.
cpath_lCO2 = legacy_CO2(); %calculate legacy CO2 concentrations
cpath_lCH4 = legacy_CH4(); %calculate legacy CH4 concentrations
cpath_lN2O = legacy_N2O(); %calculate legacy N2O concentrations
% Calculate radiative forcing from CO2.
cvec_CO2 = e2c_CO2(evec_CO2) + cpath_lCO2;
fvec_CO2 = rf_CO2(cvec_CO2);
% Calculate radiative forcing from CH4.
cvec_CH4 = e2c_CH4(evec_CH4) + cpath_lCH4;
fvec_CH4 = rf_CH4(cvec_CH4);
% Calculate radiative forcing from N2O.
cvec_N2O = cpath_lN2O;
fvec_N2O = rf_N2O(cvec_N2O);
% Calculate other forcings (constant).
fvec_other = -0.5175*ones(n,1);
% Calculate total radiative forcing.
fvec = fvec_CO2 + fvec_CH4 + fvec_N2O + fvec_other;
% Compute CO2-eq emissions.
addpath('./tools/EqMetrics')
mu         = eqMetric(@lambda_CDM,t)';
gCO2_per_molCO2 = 44.01;      %g CO2 / mol CO2
gC_per_molCO2   = 12.01;      %g C / mol CO2
Pg_per_Tg       = 1e-3;
evec_CO2eq = evec_CO2 + mu.*evec_CH4 * Pg_per_Tg*(gC_per_molCO2/gCO2_per_molCO2); %



%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Plots
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Create new figure.
figure(1)
clf
set(gcf, 'Position',[25         116        1077         613])
fs = 16;

% Use subaxis instead of subplot to get finer control over plot.
addpath('./tools/SubAxis/')
margin       = 0.05;
padding      = 0.0;
spacingVert  = 0.08;
spacingHoriz = 0.06;
%marginLeft  = 0.05;
marginRight  = 0.03;
marginTop    = 0.03;

% Plot fuel use over time:
subaxis(3,3,1, 'Margin',margin, 'Padding',padding, 'SpacingVert',spacingVert, 'SpacingHoriz',spacingHoriz, 'MarginRight',marginRight, 'MarginTop',marginTop)%, 'MarginLeft', marginLeft)
hold on
plot(t,fuel_use(:,1), 'b');
plot(t,fuel_use(:,2), 'r');
hold off
set(gca, 'FontSize',fs)

ylabel('Tg fuel / yr')
legend('fuel 1','fuel 2')
set(gca, 'Box','on')

% Plot energy consumption over time:
subaxis(3,3,4)
plot(t,energy)
set(gca, 'FontSize',fs)
ylabel('MJ / yr')
legend('energy consumption')

% Plot CO2 emissions over time:
subaxis(3,3,2)
plot(t,evec_CO2)
hold on
plot(t,evec_CO2eq,'--')
hold off
set(gca, 'FontSize',fs)
ylabel('Pg C / yr')
legend('e_{CO2}','e_{CO2-eq}')

% Plot CH4 emissions over time:
subaxis(3,3,5)
plot(t,evec_CH4)
set(gca, 'FontSize',fs)
ylabel('Tg CH4 / yr')
legend('e_{CH4}')

% Plot radiative forcing over time:
subaxis(3,3,3)
plot(t,fvec)
set(gca, 'FontSize',fs)
set(gca, 'YLim',[2 3])
ylabel('Wm^{-2}')
legend('radiative forcing')

% Plot lambda over time:
subaxis(3,3,6)
plot(t,lambda)
set(gca, 'FontSize',fs)
set(gca, 'YLim',[0 1e12])
ylabel('MJ / (Wm^{-2} * yr)')
legend('lambda')

% Plot unit impact of CH4 over time:
addpath('./tools/EqMetrics/')
subaxis(3,3,7)
plot(t,unitImpact_CH4(@lambda_CDM,t))
set(gca, 'FontSize',fs)
ylabel('MJ / g CH4')
legend('ACDM_{CH4}', 'location','NorthWest')
set(gca, 'Box','on')
ylimits = get(gca, 'YLim');
set(gca, 'YLim',[0 ylimits(2)])

% Plot unit impact of CO2 over time:
subaxis(3,3,8)
plot(t,unitImpact_CO2(@lambda_CDM,t))
set(gca, 'FontSize',fs)
ylabel('MJ / g CO2')
legend('ACDM_{CO2}', 'location','SouthWest')
set(gca, 'Box','on')
ylimits = get(gca, 'YLim');
set(gca, 'YLim',[0 ylimits(2)])

% Plot equivalency metric over time:
subaxis(3,3,9)
plot(t,eqMetric(@lambda_CDM,t))
set(gca, 'YLim',[0 120])
set(gca, 'FontSize',fs)
ylabel('g CO2 / g CH4')
legend('\mu_{CDM}', 'Location','NorthWest')
set(gca, 'Box','on')