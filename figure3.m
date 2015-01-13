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
plot(t,ICI30e30m);
plot(t,ICI30e30l);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI Early','ICI Middle','ICI Late');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Early Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureA,'figureA')

figureB = figure;
hold on
plot(t,rf_30m);
plot(t,GWP30m);
plot(t,ICI30m30e);
plot(t,ICI30m30m);
plot(t,ICI30m30l);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI Early','ICI Middle','ICI Late');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Middle Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureB,'figureB')

figureC = figure;
hold on
plot(t,rf_30l);
plot(t,GWP30l);
plot(t,ICI30l30e);
plot(t,ICI30l30m);
plot(t,ICI30l30l);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI Early','ICI Middle','ICI Late');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Late Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureC,'figureC')

figureD = figure;
hold on
plot(t,rf_45e);
plot(t,GWP45e);
plot(t,ICI45e45e);
plot(t,ICI45e45m);
plot(t,ICI45e45l);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI Early','ICI Middle','ICI Late');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Early Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureD,'figureD')

figureE = figure;
hold on
plot(t,rf_45m);
plot(t,GWP45m);
plot(t,ICI45m45e);
plot(t,ICI45m45m);
plot(t,ICI45m45l);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI Early','ICI Middle','ICI Late');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Middle Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureE,'figureE')

figureF = figure;
hold on
plot(t,rf_45l);
plot(t,GWP45l);
plot(t,ICI45l45e);
plot(t,ICI45l45m);
plot(t,ICI45l45l);
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI Early','ICI Middle','ICI Late');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Late Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureF,'figureF')