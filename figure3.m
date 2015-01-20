% This graphing script plots the performance of middle stabilization year
% metrics (ICI and CCI) over a range of possible budget scenarios.

clear
close all
constants;
load('output2.mat')
addpath('./tools')

figureA = figure;
hold on
plot(t,rf_30m,'k','Linewidth',2);
plotshaded(t',[rf_ICI30e30m rf_ICI30l30m]',rgb('Orange'));
plotshaded(t',[rf_GWP30e    rf_GWP30l   ]',rgb('Purple'));
plot(t,rf_ICI30m30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_GWP30m,'Linewidth',2,'Color',rgb('Purple'),'Linestyle','--');
set(gca,'FontSize',30,'box','on');
legend('Intended','ICI','GWP');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureA,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','A',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2052 L, Budget 2044-2060 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 1.9 3.5])
set(gca,'YTick', 2:0.5:3.5);
hline(3,'k--');
vline(2052,'k--');
hold off
print(figureA,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure3A','-depsc2')

figureB = figure;
hold on
plot(t,rf_30m,'k','Linewidth',2);
plotshaded(t',[rf_CCI30e30m rf_CCI30l30m]',rgb('Green'));
plotshaded(t',[rf_GWP30e    rf_GWP30l   ]',rgb('Purple'));
plot(t,rf_CCI30m30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_GWP30m,'Linewidth',2,'Color',rgb('Purple'),'Linestyle','--');
set(gca,'FontSize',30,'box','on');
legend('Intended','CCI','GWP');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureB,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','B',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2052 L, Budget 2044-2060 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 1.9 3.5])
set(gca,'YTick', 2:0.5:3.5);
hline(3,'k--');
vline(2052,'k--');
hold off
print(figureB,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure3B','-depsc2')

figureC = figure;
hold on
plot(t,rf_45m,'k','Linewidth',2);
plotshaded(t',[rf_ICI45e45m rf_ICI45l45m]',rgb('Orange'));
plotshaded(t',[rf_GWP45e    rf_GWP45l   ]',rgb('Purple'));
plot(t,rf_ICI45m45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_GWP45m,'Linewidth',2,'Color',rgb('Purple'),'Linestyle','--');
set(gca,'FontSize',30,'box','on');
legend('Intended','ICI','GWP');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureC,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','C',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2085 L, Budget 2070-2110 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 1.9 5.5])
set(gca,'XTick', 2010:20:2110);
set(gca,'YTick', 2:0.5:5.5);
hline(4.5,'k--');
vline(2085,'k--');
hold off
print(figureC,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure3C','-depsc2')

figureD = figure;
hold on
plot(t,rf_45m,'k','Linewidth',2);
plotshaded(t',[rf_CCI45e45m rf_CCI45l45m]',rgb('Green'));
plotshaded(t',[rf_GWP45e    rf_GWP45l   ]',rgb('Purple'));
plot(t,rf_CCI45m45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_GWP45m,'Linewidth',2,'Color',rgb('Purple'),'Linestyle','--');
set(gca,'FontSize',30,'box','on');
legend('Intended','CCI','GWP');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)')
annotation(figureD,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','D',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%title('Metric 2085 L, Budget 2070-2110 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 1.9 5.5])
set(gca,'YTick', 2:0.5:5.5);
set(gca,'XTick', 2010:20:2110);
hline(4.5,'k--');
vline(2085,'k--');
hold off
print(figureD,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure3D','-depsc2')

clearvars