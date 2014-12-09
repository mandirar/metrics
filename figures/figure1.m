% This script plots metric values under differnent stabilization levels and
% stabilization years. This is the Figure 1 in the metric testing article.

clear all
close all
constants;
load('metrics.mat')
addpath('./tools/SubAxis/')
clf

% Create the new figure and define general properties:
figure(1)        %initializes the figure
font_size = 16;  %set font size

% Define axis spacing (from James):
margin       = 0.05; 
padding      = 0.00;
spacingVert  = 0.08;
spacingHoriz = 0.06;
marginLeft   = 0.03;
marginRight  = 0.03;
marginTop    = 0.03;










% Plot fuel use over time:
subaxis(2,2,1, 'Margin',margin, 'Padding',padding, 'SpacingVert',spacingVert, 'SpacingHoriz',spacingHoriz, 'MarginRight',marginRight, 'MarginTop',marginTop)%, 'MarginLeft', marginLeft)
hold on
plot(t,GWP,'b');
%plot(t,fuel_use(:,2), 'r');
hold off
set(gca, 'FontSize',font_size)
ylabel('Tg fuel / yr')
%legend('fuel 1','fuel 2')
set(gca, 'Box','on')

% Plot energy consumption over time:
subaxis(2,2,2)
plot(t,ICI)
set(gca, 'FontSize',font_size)
ylabel('MJ / yr')
%legend('energy consumption')

% Plot CO2 emissions over time:
subaxis(2,2,3)
plot(t,CCI)
%hold on
%plot(t,evec_CO2eq,'--')
%hold off
set(gca, 'FontSize',font_size)
%ylabel('Pg C / yr')
%legend('e_{CO2}','e_{CO2-eq}')

% Plot CH4 emissions over time:
subaxis(2,2,4)
plot(t,IWP)
set(gca, 'FontSize',font_size)
ylabel('Tg CH4 / yr')
%legend('e_{CH4}')

%% USEFUL COMMANDS: 

% Set how figure displays on screen:
%set(gcf, 'Position', [x y xwidth ywidth])

