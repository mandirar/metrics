% This graphing script plots the performance of middle stabilization year
% metrics (ICI and CCI) over a range of possible budget scenarios.

clear
close all
constants;
load('output1.mat')
addpath('./tools')

figureA = figure;
hold on
plotshaded(t',[ICI_30e ICI_30l]',rgb('Orange'));
plotshaded(t',[CCI_30e CCI_30l]',rgb('Green'));
gwp_line = hline(28.4);
set(gwp_line,'Color',rgb('Purple'),'Linestyle','-','Linewidth',2);
plot(t,-t,'Linewidth',2,'Color',rgb('Purple'),'Linestyle','-');
plot(t,ICI_30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,CCI_30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
set(gca,'FontSize',30,'box','on');
legend('ICI','CCI','GWP');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Emission Year');
ylabel('Impact (g CO_2-eq/g CH_4');
annotation(figureA,'textbox',...
    [0.20 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','A',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
axis([2010 2060 -5 120])
set(gca,'YTick',0:20:120)
hold off
print(figureA,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure1A','-depsc2')

figureB = figure;
hold on
plotshaded(t',[ICI_45e ICI_45l]',rgb('Orange'));
plotshaded(t',[CCI_45e CCI_45l]',rgb('Green'));
gwp_line = hline(28.4);
set(gwp_line,'Color',rgb('Purple'),'Linestyle','-','Linewidth',2);
plot(t,-t,'Linewidth',2,'Color',rgb('Purple'),'Linestyle','-');
plot(t,ICI_45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,CCI_45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
set(gca,'FontSize',30,'box','on');
legend('ICI','CCI','GWP');
set(legend,'Location','Southeast','FontSize',30,'Color','w');
xlabel('Emission Year');
ylabel('Impact (g CO_2-eq/g CH_4');
annotation(figureB,'textbox',...
    [0.20 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','B',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
axis([2010 2110 -5 120])
set(gca,'XTick',2010:20:2110);
set(gca,'YTick',0:20:120)
hold off
print(figureB,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure1B','-depsc2')