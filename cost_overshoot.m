clear all
close all

label_list = ['   GWP       ';'   ICI Early ';'   ICI Middle';'   ICI Late  ';'   CCI Early ';'   CCI Middle';'   CCI Late  ';'   CDM Early ';'   CDM Middle';'   CDM Late  '];
load('cost_overshoot.mat');

x = energy_late;
y = overshoot_late;

hold on

scatter(x(1),y(1),'k o','filled')
scatter(x(2),y(2),'g *')
scatter(x(3),y(3),'g o','filled')
scatter(x(4),y(4),'g +')
scatter(x(5),y(5),'r *')
scatter(x(6),y(6),'r o','filled')
scatter(x(7),y(7),'r +')
scatter(x(8),y(8),'b *')
scatter(x(9),y(9),'b o','filled')
scatter(x(10),y(10),'b+')
axis([20 40 -0.1 0.7]);
labels = label_list;
h = legend(labels,'location','Northwest');
%h = findobj('type', 'axes'); 
%set(h(1), 'visible', 'off');
xlabel('Energy Consumption')
ylabel('Overshoot (W/m^2)')
title('Late Overshoot')
set(gca,'FontSize',14,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',14)
%set(0,'DefaultTextFontSize', 14)
%text(x,y,labels);