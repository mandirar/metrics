clear
close all
constants;
load('output2.mat')
addpath('./tools')

figureF = figure;
hold on
%set(figureF, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_30e,'k','Linewidth',2);
plot(t,rf_GWP30e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30e30e rf_CCI30e30l]',rgb('Green'));
plot(t,rf_CCI30e30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30e30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30e30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureF,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','F',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2060 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 1.9 4])
set(gca,'YTick', 2:0.5:4);
hline(3,'k--');
vline(2060,'k--');
hold off
print(figureF,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2F','-depsc2')

figureE = figure;
hold on
%set(figureE, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_30m,'k','Linewidth',2);
plot(t,rf_GWP30m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30m30e rf_CCI30m30l]',rgb('Green'));
plot(t,rf_CCI30m30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30m30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30m30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureE,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','E',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2052 N, 7Orange%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 1.9 4])
set(gca,'YTick', 2:0.5:4);
hline(3,'k--');
vline(2052,'k--');
hold off
print(figureE,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2E','-depsc2')

figureD = figure;
hold on
%set(figureD, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_30l,'k','Linewidth',2);
plot(t,rf_GWP30l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30l30e rf_CCI30l30l]',rgb('Green'));
plot(t,rf_CCI30l30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30l30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30l30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureD,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','D',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2044 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 1.9 4])
set(gca,'YTick', 2:0.5:4);
hline(3,'k--');
vline(2044,'k--');
hold off
print(figureD,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2D','-depsc2')

figureL = figure;
hold on
%set(figureL, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_45e,'k','Linewidth',2);
plot(t,rf_GWP45e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45e45e rf_CCI45e45l]',rgb('Green'));
plot(t,rf_CCI45e45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45e45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45e45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureL,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','L',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2110 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 1.9 7])
set(gca,'YTick', 2:1:7);
set(gca,'XTick', 2010:20:2110);
hline(4.5,'k--');
vline(2110,'k--');
hold off
print(figureL,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2L','-depsc2')

figureK = figure;
hold on
%set(figureK, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_45m,'k','Linewidth',2);
plot(t,rf_GWP45m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45m45e rf_CCI45m45l]',rgb('Green'));
plot(t,rf_CCI45m45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45m45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45m45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureK,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','K',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2085 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 1.9 7])
set(gca,'XTick', 2010:20:2110);
set(gca,'YTick', 2:1:7);
hline(4.5,'k--');
vline(2085,'k--');
hold off
print(figureK,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2K','-depsc2')

figureJ = figure;
hold on
%set(figureJ, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_45l,'k','Linewidth',2);
plot(t,rf_GWP45l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45l45e rf_CCI45l45l]',rgb('Green'));
plot(t,rf_CCI45l45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45l45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45l45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureJ,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','J',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');%
%title('Metric 2070-2110 L, Budget 2070 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 1.9 7])
set(gca,'XTick', 2010:20:2110);
set(gca,'YTick', 2:1:7);
hline(4.5,'k--')
vline(2070,'k--');
hold off
print(figureJ,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2J','-depsc2')

figureC = figure;
hold on
%set(figureC, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_30e,'k','Linewidth',2);
plot(t,rf_GWP30e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30e30e rf_ICI30e30l]',rgb('Orange'));
plot(t,rf_ICI30e30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30e30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30e30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureC,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','C',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2060 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 1.9 4])
set(gca,'YTick', 2:0.5:4);
hline(3,'k--');
vline(2060,'k--');
hold off
print(figureC,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2C','-depsc2')

figureB = figure;
hold on
%set(figureB, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_30m,'k','Linewidth',2);
plot(t,rf_GWP30m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30m30e rf_ICI30m30l]',rgb('Orange'));
plot(t,rf_ICI30m30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30m30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30m30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureB,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','B',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2052 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 1.9 4])
set(gca,'YTick', 2:0.5:4);
hline(3,'k--');
vline(2052,'k--');
hold off
print(figureB,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2B','-depsc2')

figureA = figure;
hold on
%set(figureA, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_30l,'k','Linewidth',2);
plot(t,rf_GWP30l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30l30e rf_ICI30l30l]',rgb('Orange'));
plot(t,rf_ICI30l30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30l30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30l30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureA,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','A',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2044 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 1.9 4])
set(gca,'YTick', 2:0.5:4);
hline(3,'k--');
vline(2044,'k--');
hold off
print(figureA,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2A','-depsc2')

figureI = figure;
hold on
%set(figureI, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_45e,'k','Linewidth',2);
plot(t,rf_GWP45e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45e45e rf_ICI45e45l]',rgb('Orange'));
plot(t,rf_ICI45e45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45e45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45e45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureI,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','I',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2110 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 1.9 7])
set(gca,'YTick', 2:1:7);
set(gca,'XTick', 2010:20:2110);
hline(4.5,'k--');
vline(2110,'k--');
hold off
print(figureI,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2I','-depsc2')

figureH = figure;
hold on
%set(figureH, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_45m,'k','Linewidth',2);
plot(t,rf_GWP45m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45m45e rf_ICI45m45l]',rgb('Orange'));
plot(t,rf_ICI45m45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45m45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45m45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureH,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','H',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2085 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 1.9 7])
set(gca,'YTick', 2:1:7);
set(gca,'XTick', 2010:20:2110);
hline(4.5,'k--');
vline(2085,'k--');
hold off
print(figureH,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2H','-depsc2')

figureG = figure;
hold on
%set(figureG, 'units','centimeters','position', [10 10 30 20])
plot(t,rf_45l,'k','Linewidth',2);
plot(t,rf_GWP45l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45l45e rf_ICI45l45l]',rgb('Orange'));
plot(t,rf_ICI45l45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45l45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45l45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',30,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureG,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0535544378698225],...
    'String','G',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2070 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 1.9 7])
set(gca,'XTick', 2010:20:2110);
set(gca,'YTick', 2:1:7);
hline(4.5,'k--');
vline(2070,'k--');
hold off
print(figureG,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2G','-depsc2')

clearvars