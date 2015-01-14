clear all
close all
constants;
load('output2.mat')
addpath('./tools')

figureA = figure;
hold on
plot(t,rf_30e,'k','Linewidth',2);
plot(t,GWP30e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[ICI30e30e ICI30e30l]',rgb('Orange'));
plot(t,ICI30e30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,ICI30e30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,ICI30e30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Early Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureA,'figureA')

figureB = figure;
hold on
plot(t,rf_30m,'k','Linewidth',2);
plot(t,GWP30m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[ICI30m30e ICI30m30l]',rgb('Orange'));
plot(t,ICI30m30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,ICI30m30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,ICI30m30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Middle Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureB,'figureB')

figureC = figure;
hold on
plot(t,rf_30l,'k','Linewidth',2);
plot(t,GWP30l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[ICI30l30e ICI30l30l]',rgb('Orange'));
plot(t,ICI30l30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,ICI30l30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,ICI30l30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Late Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureC,'figureC')

figureD = figure;
hold on
plot(t,rf_45e,'k','Linewidth',2);
plot(t,GWP45e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[ICI45e45e ICI45e45l]',rgb('Orange'));
plot(t,ICI45e45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,ICI45e45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,ICI45e45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Early Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureD,'figureD')

figureE = figure;
hold on
plot(t,rf_45m,'k','Linewidth',2);
plot(t,GWP45m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[ICI45m45e ICI45m45l]',rgb('Orange'));
plot(t,ICI45m45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,ICI45m45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,ICI45m45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Middle Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureE,'figureE')

figureF = figure;
hold on
plot(t,rf_45l,'k','Linewidth',2);
plot(t,GWP45l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[ICI45l45e ICI45l45l]',rgb('Orange'));
plot(t,ICI45l45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,ICI45l45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,ICI45l45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('ICI Performance Late Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureF,'figureF')