clear
clf

addpath('./variables')

load('energyPolicy_data.mat')
variables
constants

impact1 = ems_mat(1,1) * (44/12) + ems_mat(1,2) .* metric * (1/1000);
impact2 = ems_mat(2,1) * (44/12) + ems_mat(2,2) .* metric * (1/1000);
fuel_use1 = fuel_use(:,1);
fuel_use2 = fuel_use(:,2);

figureA = figure;
hold on
plot(t,impact1*10,'Linewidth',2)
plot(t,impact2*10,'Linewidth',2)
plot(t,fuel_use1,'Linewidth',2)
plot(t,fuel_use2,'Linewidth',2)
hold off
set(gca,'FontSize',16,'box','on');
legend('Impact I','Impact II','Fuel Use I','Fuel Use II');
set(legend,'Location','Northwest','FontSize',16,'Color','w','Box','off');
xlabel('Year');
ylabel('Impact (g CO_2-eq) or Energy');
title('Fuel Use and Valuation of Impact');

clearvars -except metric impact1 impact2 fuel_use1 fuel_use2 a1 a2