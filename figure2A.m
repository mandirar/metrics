clear
close all
constants;
load('output2.mat')
addpath('./tools')

figureA = figure;
hold on
plot(t,rf_30e,'k','Linewidth',2);
plot(t,rf_GWP30e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30e30e rf_CCI30e30l]',rgb('Green'));
plot(t,rf_CCI30e30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30e30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30e30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2044-2060 L, Budget 2060 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2060,'k--');
hold off
savefig(figureA,'figureA')

figureB = figure;
hold on
plot(t,rf_30m,'k','Linewidth',2);
plot(t,rf_GWP30m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30m30e rf_CCI30m30l]',rgb('Green'));
plot(t,rf_CCI30m30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30m30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30m30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2044-2060 L, Budget 2052 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2052,'k--');
hold off
savefig(figureB,'figureB')

figureC = figure;
hold on
plot(t,rf_30l,'k','Linewidth',2);
plot(t,rf_GWP30l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30l30e rf_CCI30l30l]',rgb('Green'));
plot(t,rf_CCI30l30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30l30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30l30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2044-2060 L, Budget 2044 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2044,'k--');
hold off
savefig(figureC,'figureC')

figureD = figure;
hold on
plot(t,rf_45e,'k','Linewidth',2);
plot(t,rf_GWP45e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45e45e rf_CCI45e45l]',rgb('Green'));
plot(t,rf_CCI45e45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45e45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45e45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2070-2110 L, Budget 2110 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2110,'k--');
hold off
savefig(figureD,'figureD')

figureE = figure;
hold on
plot(t,rf_45m,'k','Linewidth',2);
plot(t,rf_GWP45m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45m45e rf_CCI45m45l]',rgb('Green'));
plot(t,rf_CCI45m45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45m45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45m45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2070-2110 L, Budget 2085 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2085,'k--');
hold off
savefig(figureE,'figureE')

figureF = figure;
hold on
plot(t,rf_45l,'k','Linewidth',2);
plot(t,rf_GWP45l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45l45e rf_CCI45l45l]',rgb('Green'));
plot(t,rf_CCI45l45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45l45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45l45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2070-2110 L, Budget 2070 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--')
vline(2070,'k--');
hold off
savefig(figureF,'figureF')

figureG = figure;
hold on
plot(t,rf_30e,'k','Linewidth',2);
plot(t,rf_GWP30e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30e30e rf_ICI30e30l]',rgb('Orange'));
plot(t,rf_ICI30e30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30e30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30e30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2044-2060 L, Budget 2060 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2060,'k--');
hold off
savefig(figureG,'figureG')

figureH = figure;
hold on
plot(t,rf_30m,'k','Linewidth',2);
plot(t,rf_GWP30m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30m30e rf_ICI30m30l]',rgb('Orange'));
plot(t,rf_ICI30m30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30m30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30m30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2044-2060 L, Budget 2052 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2052,'k--');
hold off
savefig(figureH,'figureH')

figureI = figure;
hold on
plot(t,rf_30l,'k','Linewidth',2);
plot(t,rf_GWP30l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30l30e rf_ICI30l30l]',rgb('Orange'));
plot(t,rf_ICI30l30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30l30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30l30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2044-2060 L, Budget 2044 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2044,'k--');
hold off
savefig(figureI,'figureI')

figureJ = figure;
hold on
plot(t,rf_45e,'k','Linewidth',2);
plot(t,rf_GWP45e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45e45e rf_ICI45e45l]',rgb('Orange'));
plot(t,rf_ICI45e45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45e45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45e45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2070-2110 L, Budget 2110 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2110,'k--');
hold off
savefig(figureJ,'figureJ')

figureK = figure;
hold on
plot(t,rf_45m,'k','Linewidth',2);
plot(t,rf_GWP45m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45m45e rf_ICI45m45l]',rgb('Orange'));
plot(t,rf_ICI45m45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45m45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45m45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2070-2110 L, Budget 2085 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2085,'k--');
hold off
savefig(figureK,'figureK')

figureL = figure;
hold on
plot(t,rf_45l,'k','Linewidth',2);
plot(t,rf_GWP45l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45l45e rf_ICI45l45l]',rgb('Orange'));
plot(t,rf_ICI45l45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45l45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45l45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','Box','off','FontSize',16);
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
title('Metric 2070-2110 L, Budget 2070 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2070,'k--');
hold off
savefig(figureL,'figureL')