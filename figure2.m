clear all
close all
constants;
load('output2.mat')
addpath('./tools')

figureA = figure;
hold on
plot(t,rf_30e);
plot(t,GWP30e);
plot(t,ICI30e30e);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Nonlinear Simulation with Late Stabilization');
hold off
savefig(figureA,'figureA')

figureB = figure;
hold on
plot(t,rf_30l);
plot(t,GWP30l);
plot(t,ICI30l30l);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Nonlinear Simulation with Early Stabilization');
hold off
savefig(figureB,'figureB')

figureC = figure;
hold on
plot(t,rf_45e);
plot(t,GWP45e);
plot(t,ICI45e45e);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Nonlinear Simulation with Late Stabilization');
hold off
savefig(figureC,'figureC')

figureD = figure;
hold on
plot(t,rf_45l);
plot(t,GWP45l);
plot(t,ICI45l45l);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Nonlinear Simulation with Late Stabilization');
hold off
savefig(figureD,'figureD')