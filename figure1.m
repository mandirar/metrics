% This script plots metric values under differnent stabilization levels and
% stabilization years. This is the Figure 1 in the metric testing article.

clear all
close all
constants;
load('output1.mat')
addpath('./tools')

% Create the new figure:
fig1 = figure; %initializes the figure
set(gcf, 'Position',[200 200 800 425])

fs   = 14;                    
xmin = 2010;
xmax = 2060;
ymin = 0;
ymax = 130;
pos1 = [0.11 0.60 0.40 0.37]; %position of sub-figure (a)
pos2 = [0.60 0.60 0.40 0.37]; %position of sub-figure (b)
pos3 = [0.11 0.10 0.40 0.37]; %position of sub-figure (c)
pos4 = [0.60 0.10 0.40 0.37]; %position of sub-figure (d)

% Create axes for the sub-figures:
axes1 = axes('Parent',fig1,'Tag','subaxis',...
        'FontSize',fs,...
        'Position',pos1,...
        'box'     ,'on');
xlim([xmin xmax]);
ylim([ymin ymax]);
xlabel('year');
ylabel('g CO_2-eq/g CH_4');
hold(axes1,'all');

axes2 = axes('Parent',fig1,'Tag','subaxis',...
        'FontSize',fs,...
        'Position',pos2,...
        'box'     ,'on');
xlim([xmin xmax]);
ylim([ymin ymax]);
xlabel('year');
ylabel('g CO_2-eq/g CH_4');
hold(axes2,'all');

axes3 = axes('Parent',fig1,'Tag','subaxis',...
        'FontSize',fs,...
        'Position',pos3,...
        'box'     ,'on');
xlim([xmin xmax]);
ylim([ymin ymax]);
xlabel('year');
ylabel('g CO_2-eq/g CH_4');
hold(axes3,'all');

axes4 = axes('Parent',fig1,'Tag','subaxis',...
        'FontSize',fs,...
        'Position',pos4,...
        'box'     ,'on');
xlim([xmin xmax]);
ylim([ymin ymax]);
xlabel('year');
ylabel('g CO_2-eq/g CH_4');
hold(axes4,'all');
    
% Plot data on the sub-figures:
hold on
plot(t,GWP_100,'Parent',axes1,'Color',rgb('FireBrick'));
plot(t,GWP_020,'Parent',axes1,'Color',rgb('MediumAquaMarine'));
plot(t,ICI_30e,'Parent',axes1,'Color',rgb('CornflowerBlue'));
plot(t,CCI_30e,'Parent',axes1,'Color',rgb('Amethyst'));
legend(axes1,'GWP(100)','GWP(20)','ICI 3.0E','CCI 3.0E')
legend1 = legend(axes1,'show');
set(legend1,'Location','EastOutside','Box','off');
hold off

hold on
plot(t,GWP_100,'Parent',axes2,'Color',rgb('FireBrick'));
plot(t,GWP_020,'Parent',axes2,'Color',rgb('MediumAquaMarine'));
plot(t,ICI_30l,'Parent',axes2,'Color',rgb('CornflowerBlue'));
plot(t,CCI_30l,'Parent',axes2,'Color',rgb('Amethyst'));
legend(axes2,'GWP(100)','GWP(20)','ICI 3.0L','CCI 3.0L')
legend2 = legend(axes2,'show');
set(legend2,'Location','EastOutside','Box','off');
hold off

hold on
plot(t,GWP_100,'Parent',axes3,'Color',rgb('FireBrick'));
plot(t,GWP_020,'Parent',axes3,'Color',rgb('MediumAquaMarine'));
plot(t,ICI_45e,'Parent',axes3,'Color',rgb('CornflowerBlue'));
plot(t,CCI_45e,'Parent',axes3,'Color',rgb('Amethyst'));
legend(axes3,'GWP(100)','GWP(20)','ICI 4.5E','CCI 4.5E')
legend3 = legend(axes3,'show');
set(legend3,'Location','EastOutside','Box','off');
hold off

hold on
plot(t,GWP_100,'Parent',axes4,'Color',rgb('FireBrick'));
plot(t,GWP_020,'Parent',axes4,'Color',rgb('MediumAquaMarine'));
plot(t,ICI_45l,'Parent',axes4,'Color',rgb('CornflowerBlue'));
plot(t,CCI_45l,'Parent',axes4,'Color',rgb('Amethyst'));
legend(axes4,'GWP(100)','GWP(20)','ICI 4.5L','CCI 4.5L')
legend4 = legend(axes4,'show');
set(legend4,'Location','EastOutside','Box','off');
hold off