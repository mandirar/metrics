function plotResults(t,eta_vec,ems_mat,fuel_use)

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Preliminary calculations.
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%

energy    = fuel_use * eta_vec;        %calculate energy vector
emissions = fuel_use * ems_mat;        %calculate emissions matrix
evec_CO2  = emissions(:,1);            %extract CO2 emissions vector
evec_CH4  = emissions(:,2);            %extract CH4 emissions vector

% Re-compute RF pathway.
legacy_CO2 ;                          %calculate legacy CO2 concentrations
legacy_CH4 ;                          %calculate legacy CH4 concentrations
legacy_N2O ;                          %calculate legacy N2O concentrations
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

% Cut off last year of plots (since it's unconstrained).
t_graph        = t(1:end-1);
fuel_use_graph = fuel_use(1:end-1,:);
evec_CO2_graph = evec_CO2(1:end-1);
evec_CH4_graph = evec_CH4(1:end-1);
energy_graph   = energy(1:end-1);
fvec_graph     = fvec(1:end-1);            %cut off radiative forcing vector


%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Plots
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Create new figure.
figure(1)
clf
set(gcf, 'Position',[25         180        1076         549])
fs = 16;

% Use subaxis instead of subaxis to get finer control over plot.
addpath('./tools/SubAxis/')
marginSize  = 0.05;
paddingSize = 0.0;
spacingSize = 0.08;

% Plot fuel use over time:
subaxis(2,3,1, 'Margin',marginSize, 'Padding',paddingSize, 'SpacingVert',spacingSize)
hold on
plot(t_graph,fuel_use_graph(:,1), 'b');
plot(t_graph,fuel_use_graph(:,2), 'r');
hold off
set(gca, 'FontSize',fs)
%xlabel('time (years)')
ylabel('fuel use ()')
legend('fuel 1','fuel 2')
set(gca, 'Box','on')

% Plot energy consumption over time:
subaxis(2,3,4)
plot(t_graph,energy_graph)
set(gca, 'FontSize',fs)
%xlabel('time (years)')
ylabel('energy consumption ()')
legend('energy consumption')

% Plot CO2 emissions over time:
subaxis(2,3,2)
plot(t_graph,evec_CO2_graph)
set(gca, 'FontSize',fs)
%xlabel('time (years)')
ylabel('CO2 emissions ()')
legend('CO2 emissions')

% Plot CH4 emissions over time:
subaxis(2,3,5)
plot(t_graph,evec_CH4_graph)
set(gca, 'FontSize',fs)
%xlabel('time (years)')
ylabel('CH4 emissions ()')
legend('CH4 emissions')

% Plot radiative forcing over time:
subaxis(2,3,3)
plot(t_graph,fvec_graph)
set(gca, 'FontSize',fs)
%xlabel('time (years)')
ylabel('radiative forcing (W/m^2)')
legend('radiative forcing')