clear
close all;
addpath('./tools')

load('output2.mat')
constants;

te_ICI30e30m = sum(en_ICI30m30e(1:420)) * dt /(50-10); 
te_ICI30m30m = sum(en_ICI30m30m(1:420)) * dt/(42-10); 
te_ICI30l30m = sum(en_ICI30m30l(1:420)) * dt/(34-10); 
te_CCI30e30m = sum(en_CCI30m30e(1:420)) * dt/(50-10); 
te_CCI30m30m = sum(en_CCI30m30m(1:420)) * dt/(42-10); 
te_CCI30l30m = sum(en_CCI30m30l(1:420)) * dt/(34-10); 
te_GWP30e    = sum(en_GWP30m(1:420)   ) * dt/(50-10);
te_GWP30m    = sum(en_GWP30m(1:420)   ) * dt/(42-10);
te_GWP30l    = sum(en_GWP30m(1:420)   ) * dt/(34-10);
te_ICI45e45m = sum(en_ICI45m45e(1:850)) * dt/(100-10); 
te_ICI45m45m = sum(en_ICI45m45m(1:850)) * dt/(75-10); 
te_ICI45l45m = sum(en_ICI45m45l(1:850)) * dt/(60-10); 
te_CCI45e45m = sum(en_CCI45m45e(1:850)) * dt/(100-10); 
te_CCI45m45m = sum(en_CCI45m45m(1:850)) * dt/(75-10); 
te_CCI45l45m = sum(en_CCI45m45l(1:850)) * dt/(60-10); 
te_GWP45e    = sum(en_GWP45m(1:850)   ) * dt/(100-10);
te_GWP45m    = sum(en_GWP45m(1:850)   ) * dt/(75-10);
te_GWP45l    = sum(en_GWP45m(1:850)   ) * dt/(60-10);

ov_ICI30e30m = max(rf_ICI30m30e(1:500)) - 3; 
ov_ICI30m30m = max(rf_ICI30m30m(1:420)) - 3; 
ov_ICI30l30m = max(rf_ICI30m30l(1:340)) - 3; 
ov_CCI30e30m = max(rf_CCI30m30e(1:500)) - 3; 
ov_CCI30m30m = max(rf_CCI30m30m(1:420)) - 3; 
ov_CCI30l30m = max(rf_CCI30m30l(1:340)) - 3; 
ov_GWP30e    = max(rf_GWP30m(1:500)   ) - 3;
ov_GWP30m    = max(rf_GWP30m(1:420)   ) - 3;
ov_GWP30l    = max(rf_GWP30m(1:340)   ) - 3;
ov_ICI45e45m = max(rf_ICI45m45e(1:1000)) - 4.5; 
ov_ICI45m45m = max(rf_ICI45m45m(1:750)) - 4.5; 
ov_ICI45l45m = max(rf_ICI45m45l(1:600)) - 4.5; 
ov_CCI45e45m = max(rf_CCI45m45e(1:1000)) - 4.5; 
ov_CCI45m45m = max(rf_CCI45m45m(1:750)) - 4.5; 
ov_CCI45l45m = max(rf_CCI45m45l(1:600)) - 4.5; 
ov_GWP45e    = max(rf_GWP45m(1:1000)   ) - 4.5;
ov_GWP45m    = max(rf_GWP45m(1:750)   ) - 4.5;
ov_GWP45l    = max(rf_GWP45m(1:600)   ) - 4.5;

zero_vec30e  = zeros(500,1);
zero_vec30m  = zeros(420,1);
zero_vec30l  = zeros(340,1);
zero_vec45e  = zeros(1000,1);
zero_vec45m  = zeros(750,1);
zero_vec45l  = zeros(600,1);

io_ICI30e30m = sum(max(rf_ICI30e30m(1:500) - 3,zero_vec30e));
io_ICI30m30m = sum(max(rf_ICI30m30m(1:420) - 3,zero_vec30m));
io_ICI30l30m = sum(max(rf_ICI30l30m(1:340) - 3,zero_vec30l));
io_CCI30e30m = sum(max(rf_CCI30e30m(1:500) - 3,zero_vec30e));
io_CCI30m30m = sum(max(rf_CCI30m30m(1:420) - 3,zero_vec30m));
io_CCI30l30m = sum(max(rf_CCI30l30m(1:340) - 3,zero_vec30l));
io_GWP30e    = sum(max(rf_GWP30e(1:500)    - 3,zero_vec30e));
io_GWP30m    = sum(max(rf_GWP30m(1:420)    - 3,zero_vec30m));
io_GWP30l    = sum(max(rf_GWP30l(1:340)    - 3,zero_vec30l));

io_ICI45e45m = sum(max(rf_ICI45e45m(1:1000) - 4.5,zero_vec45e));
io_ICI45m45m = sum(max(rf_ICI45m45m(1:750)  - 4.5,zero_vec45m));
io_ICI45l45m = sum(max(rf_ICI45l45m(1:600)  - 4.5,zero_vec45l));
io_CCI45e45m = sum(max(rf_CCI45e45m(1:1000) - 4.5,zero_vec45e));
io_CCI45m45m = sum(max(rf_CCI45m45m(1:750)  - 4.5,zero_vec45m));
io_CCI45l45m = sum(max(rf_CCI45l45m(1:600)  - 4.5,zero_vec45l));
io_GWP45e    = sum(max(rf_GWP45e(1:1000)    - 4.5,zero_vec45e));
io_GWP45m    = sum(max(rf_GWP45m(1:750)     - 4.5,zero_vec45m));
io_GWP45l    = sum(max(rf_GWP45l(1:600)     - 4.5,zero_vec45l));

energy30 = [te_ICI30e30m te_ICI30m30m te_ICI30l30m te_CCI30e30m ...
            te_CCI30m30m te_CCI30l30m te_GWP30e te_GWP30m te_GWP30l];
ovrsht30 = [ov_ICI30e30m ov_ICI30m30m ov_ICI30l30m ov_CCI30e30m ...
            ov_CCI30m30m ov_CCI30l30m ov_GWP30e ov_GWP30m ov_GWP30l];
cshoot30 = [io_ICI30e30m io_ICI30m30m io_ICI30l30m io_CCI30e30m ...
            io_CCI30m30m io_CCI30l30m io_GWP30e io_GWP30m io_GWP30l];

energy45 = [te_ICI45e45m te_ICI45m45m te_ICI45l45m te_CCI45e45m ...
            te_CCI45m45m te_CCI45l45m te_GWP45e te_GWP45m te_GWP45l];
ovrsht45 = [ov_ICI45e45m ov_ICI45m45m ov_ICI45l45m ov_CCI45e45m ...
            ov_CCI45m45m ov_CCI45l45m ov_GWP45e ov_GWP45m ov_GWP45l];
cshoot45 = [io_ICI45e45m io_ICI45m45m io_ICI45l45m io_CCI45e45m ...
            io_CCI45m45m io_CCI45l45m io_GWP45e io_GWP45m io_GWP45l];
      
figureA = figure;
hold on
set(gca,'FontSize',30,'box','on');
colors = [rgb('Orange');rgb('Orange');rgb('Orange');rgb('Green');rgb('Green');rgb('Green');rgb('Purple');rgb('Purple');rgb('Purple')];
scatter(energy30,ovrsht30,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP_E';'  GWP_M';'  GWP_L'];
text(energy30(1,:),ovrsht30(1,:),labels,'FontSize',25);
xlabel('Energy (EJ/year)');
ylabel('Maximum Overshoot (W/m^2)');
%title('Energy/Overshoot Plot for 3 W/m^2');
annotation(figureA,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','A',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%axis([400 1100 -0.01 0.4])
%set(gca,'YTick', 0:0.1:4);
%set(gca,'XTick', 0:0.1:4);
hold off
print(figureA,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure5A','-depsc2')

figureB = figure;
hold on
set(gca,'FontSize',30,'box','on');
scatter(energy45,ovrsht45,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP_E';'  GWP_M';'  GWP_L'];
text(energy45(1,:),ovrsht45(1,:),labels,'FontSize',25);
xlabel('Energy (EJ/year)');
ylabel('Maximum Overshoot (W/m^2)');
%title('Energy/Overshoot Plot for 3 W/m^2');
annotation(figureB,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','B',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%axis([500 1300 -0.1 0.6])
%set(gca,'YTick', 0:0.1:0.6);
hold off
print(figureB,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure5B','-depsc2')

figureC = figure;
hold on
set(gca,'FontSize',30,'box','on');
scatter(energy30,cshoot30,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP_E';'  GWP_M';'  GWP_L'];
text(energy30(1,:),cshoot30(1,:),labels,'FontSize',25);
xlabel('Energy (EJ/year)');
ylabel('Cumulative Overshoot (W/m^2)');
%title('Energy/Overshoot Plot for 3 W/m^2');
annotation(figureC,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','C',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%axis([400 1100 -2.5 60])
%set(gca,'YTick', 0:10:60);
hold off
print(figureC,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure5C','-depsc2')

figureD = figure;
hold on
set(gca,'FontSize',30,'box','on');
scatter(energy45,cshoot45,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP_E';'  GWP_M';'  GWP_L'];
text(energy45(1,:),cshoot45(1,:),labels,'FontSize',25);
xlabel('Energy (EJ/year)');
ylabel('Cumulative Overshoot (W/m^2)');
%title('Energy/Overshoot Plot for 3 W/m^2');
annotation(figureD,'textbox',...
    [0.18 0.857988305680473 0.0212634508348794 0.0532544378698225],...
    'String','D',...
    'LineStyle','none',...
    'FontSize',35,...
    'FitBoxToText','off');
%axis([500 1300 -10 100])
%set(gca,'YTick', 0:20:100);
%set(gca,'XTick', 550:50:800);
hold off
print(figureD,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure5D','-depsc2')

clearvars