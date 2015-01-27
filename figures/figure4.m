clear
close all;
addpath('./tools')

load('output2.mat')
constants;

te_ICI30m30e = sum(en_ICI30m30e(1:42/dt)) * dt /(42-10); 
te_ICI30m30m = sum(en_ICI30m30m(1:42/dt)) * dt/(42-10); 
te_ICI30m30l = sum(en_ICI30m30l(1:42/dt)) * dt/(42-10); 
te_CCI30m30e = sum(en_CCI30m30e(1:42/dt)) * dt/(42-10); 
te_CCI30m30m = sum(en_CCI30m30m(1:42/dt)) * dt/(42-10); 
te_CCI30m30l = sum(en_CCI30m30l(1:42/dt)) * dt/(42-10); 
te_GWP30m    = sum(en_GWP30m(1:42/dt)   ) * dt/(42-10);
te_ICI45m45e = sum(en_ICI45m45e(1:85/dt)) * dt/(75-10); 
te_ICI45m45m = sum(en_ICI45m45m(1:85/dt)) * dt/(75-10); 
te_ICI45m45l = sum(en_ICI45m45l(1:85/dt)) * dt/(75-10); 
te_CCI45m45e = sum(en_CCI45m45e(1:85/dt)) * dt/(75-10); 
te_CCI45m45m = sum(en_CCI45m45m(1:85/dt)) * dt/(75-10); 
te_CCI45m45l = sum(en_CCI45m45l(1:85/dt)) * dt/(75-10); 
te_GWP45m    = sum(en_GWP45m(1:85/dt)   ) * dt/(75-10);

ov_ICI30m30e = max(rf_ICI30m30e(1:42/dt)) - 3; 
ov_ICI30m30m = max(rf_ICI30m30m(1:42/dt)) - 3; 
ov_ICI30m30l = max(rf_ICI30m30l(1:42/dt)) - 3; 
ov_CCI30m30e = max(rf_CCI30m30e(1:42/dt)) - 3; 
ov_CCI30m30m = max(rf_CCI30m30m(1:42/dt)) - 3; 
ov_CCI30m30l = max(rf_CCI30m30l(1:42/dt)) - 3; 
ov_GWP30m    = max(rf_GWP30m(1:42/dt)   ) - 3;
ov_ICI45m45e = max(rf_ICI45m45e(1:75/dt)) - 4.5; 
ov_ICI45m45m = max(rf_ICI45m45m(1:75/dt)) - 4.5; 
ov_ICI45m45l = max(rf_ICI45m45l(1:75/dt)) - 4.5; 
ov_CCI45m45e = max(rf_CCI45m45e(1:75/dt)) - 4.5; 
ov_CCI45m45m = max(rf_CCI45m45m(1:75/dt)) - 4.5; 
ov_CCI45m45l = max(rf_CCI45m45l(1:75/dt)) - 4.5; 
ov_GWP45m    = max(rf_GWP45m(1:75/dt)   ) - 4.5;

zero_vec30   = zeros(42/dt,1);
zero_vec45   = zeros(75/dt,1);

io_ICI30m30e = sum(max(rf_ICI30m30e(1:42/dt) - 3,zero_vec30));
io_ICI30m30m = sum(max(rf_ICI30m30m(1:42/dt) - 3,zero_vec30));
io_ICI30m30l = sum(max(rf_ICI30m30l(1:42/dt) - 3,zero_vec30));
io_CCI30m30e = sum(max(rf_CCI30m30e(1:42/dt) - 3,zero_vec30));
io_CCI30m30m = sum(max(rf_CCI30m30m(1:42/dt) - 3,zero_vec30));
io_CCI30m30l = sum(max(rf_CCI30m30l(1:42/dt) - 3,zero_vec30));
io_GWP30m    = sum(max(rf_GWP30m(1:42/dt)    - 3,zero_vec30));

io_ICI45m45e = sum(max(rf_ICI45m45e(1:75/dt) - 4.5,zero_vec45));
io_ICI45m45m = sum(max(rf_ICI45m45m(1:75/dt) - 4.5,zero_vec45));
io_ICI45m45l = sum(max(rf_ICI45m45l(1:75/dt) - 4.5,zero_vec45));
io_CCI45m45e = sum(max(rf_CCI45m45e(1:75/dt) - 4.5,zero_vec45));
io_CCI45m45m = sum(max(rf_CCI45m45m(1:75/dt) - 4.5,zero_vec45));
io_CCI45m45l = sum(max(rf_CCI45m45l(1:75/dt) - 4.5,zero_vec45));
io_GWP45m    = sum(max(rf_GWP45m(1:75/dt   ) - 4.5,zero_vec45));

energy30 = [te_ICI30m30e te_ICI30m30m te_ICI30m30l te_CCI30m30e ...
            te_CCI30m30m te_CCI30m30l te_GWP30m];
ovrsht30 = [ov_ICI30m30e ov_ICI30m30m ov_ICI30m30l ov_CCI30m30e ...
            ov_CCI30m30m ov_CCI30m30l ov_GWP30m];
cshoot30 = [io_ICI30m30e io_ICI30m30m io_ICI30m30l io_CCI30m30e ...
            io_CCI30m30m io_CCI30m30l io_GWP30m];

energy45 = [te_ICI45m45e te_ICI45m45m te_ICI45m45l te_CCI45m45e ...
            te_CCI45m45m te_CCI45m45l te_GWP45m];
ovrsht45 = [ov_ICI45m45e ov_ICI45m45m ov_ICI45m45l ov_CCI45m45e ...
            ov_CCI45m45m ov_CCI45m45l ov_GWP45m];
cshoot45 = [io_ICI45m45e io_ICI45m45m io_ICI45m45l io_CCI45m45e ...
            io_CCI45m45m io_CCI45m45l io_GWP45m];
      
figureA = figure;
hold on
set(gca,'FontSize',30,'box','on');
colors = [rgb('Orange');rgb('Orange');rgb('Orange');rgb('Green');rgb('Green');rgb('Green');rgb('Purple')];
scatter(energy30,ovrsht30,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP  '];
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
%axis([550 800 -0.01 0.4])
%set(gca,'YTick', 0:0.1:4);
hold off
print(figureA,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure4A','-depsc2')

figureB = figure;
hold on
set(gca,'FontSize',30,'box','on');
scatter(energy45,ovrsht45,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP  '];
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
%axis([550 800 -0.1 0.6])
%set(gca,'YTick', 0:0.1:0.6);
hold off
print(figureB,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure4B','-depsc2')

figureC = figure;
hold on
set(gca,'FontSize',30,'box','on');
colors = [rgb('Orange');rgb('Orange');rgb('Orange');rgb('Green');rgb('Green');rgb('Green');rgb('Purple')];
scatter(energy30,cshoot30,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP  '];
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
%axis([550 800 -2.5 60])
%set(gca,'YTick', 0:10:60);
hold off
print(figureC,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure4C','-depsc2')

figureD = figure;
hold on
set(gca,'FontSize',30,'box','on');
scatter(energy45,cshoot45,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP  '];
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
%axis([550 800 -10 200])
%set(gca,'YTick', 0:50:200);
%set(gca,'XTick', 550:50:800);
hold off
print(figureD,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure4D','-depsc2')

clearvars