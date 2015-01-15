clear
close all
constants;
load('output2.mat')
addpath('./tools')

figureF = figure;
hold on
plot(t,rf_30e,'k','Linewidth',2);
plot(t,rf_GWP30e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30e30e rf_CCI30e30l]',rgb('Green'));
plot(t,rf_CCI30e30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30e30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30e30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureF,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','F',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2060 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2060,'k--');
hold off
saveas(figureF,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2F','eps')

figureE = figure;
hold on
plot(t,rf_30m,'k','Linewidth',2);
plot(t,rf_GWP30m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30m30e rf_CCI30m30l]',rgb('Green'));
plot(t,rf_CCI30m30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30m30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30m30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureE,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','E',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2052 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2052,'k--');
hold off
saveas(figureE,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2E.eps')

figureD = figure;
hold on
plot(t,rf_30l,'k','Linewidth',2);
plot(t,rf_GWP30l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI30l30e rf_CCI30l30l]',rgb('Green'));
plot(t,rf_CCI30l30m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI30l30e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI30l30l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureD,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','D',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2044 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2044,'k--');
hold off
saveas(figureD,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2D.eps')

figureL = figure;
hold on
plot(t,rf_45e,'k','Linewidth',2);
plot(t,rf_GWP45e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45e45e rf_CCI45e45l]',rgb('Green'));
plot(t,rf_CCI45e45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45e45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45e45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureL,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','L',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2110 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2110,'k--');
hold off
saveas(figureL,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2L.eps')

figureK = figure;
hold on
plot(t,rf_45m,'k','Linewidth',2);
plot(t,rf_GWP45m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45m45e rf_CCI45m45l]',rgb('Green'));
plot(t,rf_CCI45m45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45m45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45m45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureK,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','K',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2085 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2085,'k--');
hold off
saveas(figureK,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2K.eps')

figureJ = figure;
hold on
plot(t,rf_45l,'k','Linewidth',2);
plot(t,rf_GWP45l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_CCI45l45e rf_CCI45l45l]',rgb('Green'));
plot(t,rf_CCI45l45m,'Linewidth',2,'Color',rgb('Green'),'Linestyle','--');
plot(t,rf_CCI45l45e,'Linewidth',2,'Color',rgb('Green'));
plot(t,rf_CCI45l45l,'Linewidth',2,'Color',rgb('Green'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','CCI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureJ,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','J',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');%
%title('Metric 2070-2110 L, Budget 2070 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--')
vline(2070,'k--');
hold off
saveas(figureJ,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2J.eps')

figureC = figure;
hold on
plot(t,rf_30e,'k','Linewidth',2);
plot(t,rf_GWP30e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30e30e rf_ICI30e30l]',rgb('Orange'));
plot(t,rf_ICI30e30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30e30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30e30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureC,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','C',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2060 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2060,'k--');
hold off
saveas(figureC,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2C.eps')

figureB = figure;
hold on
plot(t,rf_30m,'k','Linewidth',2);
plot(t,rf_GWP30m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30m30e rf_ICI30m30l]',rgb('Orange'));
plot(t,rf_ICI30m30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30m30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30m30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureB,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','B',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2052 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2052,'k--');
hold off
saveas(figureB,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2B.eps')

figureA = figure;
hold on
plot(t,rf_30l,'k','Linewidth',2);
plot(t,rf_GWP30l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI30l30e rf_ICI30l30l]',rgb('Orange'));
plot(t,rf_ICI30l30m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI30l30e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI30l30l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureA,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','A',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2044-2060 L, Budget 2044 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2060 2 3.5])
hline(3,'k--');
vline(2044,'k--');
hold off
saveas(figureA,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2A.eps')

figureI = figure;
hold on
plot(t,rf_45e,'k','Linewidth',2);
plot(t,rf_GWP45e,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45e45e rf_ICI45e45l]',rgb('Orange'));
plot(t,rf_ICI45e45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45e45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45e45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureI,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','I',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2110 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2110,'k--');
hold off
saveas(figureI,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2I.eps')

figureH = figure;
hold on
plot(t,rf_45m,'k','Linewidth',2);
plot(t,rf_GWP45m,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45m45e rf_ICI45m45l]',rgb('Orange'));
plot(t,rf_ICI45m45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45m45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45m45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureH,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','H',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2085 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2085,'k--');
hold off
saveas(figureH,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2H.eps')

figureG = figure;
hold on
plot(t,rf_45l,'k','Linewidth',2);
plot(t,rf_GWP45l,'Linewidth',2,'Color',rgb('Purple'));
plotshaded(t',[rf_ICI45l45e rf_ICI45l45l]',rgb('Orange'));
plot(t,rf_ICI45l45m,'Linewidth',2,'Color',rgb('Orange'),'Linestyle','--');
plot(t,rf_ICI45l45e,'Linewidth',2,'Color',rgb('Orange'));
plot(t,rf_ICI45l45l,'Linewidth',2,'Color',rgb('Orange'));
set(gca,'FontSize',16,'box','on');
legend('Intended','GWP','ICI');
set(legend,'Location','Southeast','FontSize',16,'Color','w');
xlabel('Year');
ylabel('Radiative Forcing (W/m^2)');
annotation(figureG,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','G',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
%title('Metric 2070-2110 L, Budget 2070 N, 71%, 0.12 g CH4, 33 g CO2');
axis([2010 2110 2 5.5])
hline(4.5,'k--');
vline(2070,'k--');
hold off
saveas(figureG,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure2G.eps')
