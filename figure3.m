clear all
close all
constants;
load('output2.mat')
addpath('./tools')

figureA = figure;
hold on
plot(t,rf_30e,'k','Linewidth',2);
plot(t,GWP30e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[CCI30e30e CCI30e30l]',rgb('Green'));
plot(t,CCI30e30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,CCI30e30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,CCI30e30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('CCI Performance Early Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureA,'figureA')

figureB = figure;
hold on
plot(t,rf_30m,'k','Linewidth',2);
plot(t,GWP30m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[CCI30m30e CCI30m30l]',rgb('Green'));
plot(t,CCI30m30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,CCI30m30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,CCI30m30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('CCI Performance Middle Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureB,'figureB')

figureC = figure;
hold on
plot(t,rf_30l,'k','Linewidth',2);
plot(t,GWP30l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[CCI30l30e CCI30l30l]',rgb('Green'));
plot(t,CCI30l30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,CCI30l30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,CCI30l30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('CCI Performance Late Mitigation');
axis([2010 2060 2 4.5])
hold off
savefig(figureC,'figureC')

figureD = figure;
hold on
plot(t,rf_45e,'k','Linewidth',2);
plot(t,GWP45e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[CCI45e45e CCI45e45l]',rgb('Green'));
plot(t,CCI45e45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,CCI45e45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,CCI45e45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('CCI Performance Early Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureD,'figureD')

figureE = figure;
hold on
plot(t,rf_45m,'k','Linewidth',2);
plot(t,GWP45m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[CCI45m45e CCI45m45l]',rgb('Green'));
plot(t,CCI45m45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,CCI45m45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,CCI45m45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('CCI Performance Middle Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureE,'figureE')

figureF = figure;
hold on
plot(t,rf_45l,'k','Linewidth',2);
plot(t,GWP45l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[CCI45l45e CCI45l45l]',rgb('Green'));
plot(t,CCI45l45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,CCI45l45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,CCI45l45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('CCI Performance Late Mitigation');
axis([2010 2110 2 7])
hold off
savefig(figureF,'figureF')