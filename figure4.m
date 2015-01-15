clear
close all;

load('output2.mat')

te_ICI30e30e = sum(en_ICI30e30e(1:420)); 
te_ICI30e30m = sum(en_ICI30e30m(1:420)); 
te_ICI30e30l = sum(en_ICI30e30l(1:420)); 
te_CCI30e30e = sum(en_CCI30e30e(1:420)); 
te_CCI30e30m = sum(en_CCI30e30m(1:420)); 
te_CCI30e30l = sum(en_CCI30e30l(1:420)); 
te_GWP30e    = sum(en_GWP30e(1:420)   ); 
te_ICI30m30e = sum(en_ICI30m30e(1:420)); 
te_ICI30m30m = sum(en_ICI30m30m(1:420)); 
te_ICI30m30l = sum(en_ICI30m30l(1:420)); 
te_CCI30m30e = sum(en_CCI30m30e(1:420)); 
te_CCI30m30m = sum(en_CCI30m30m(1:420)); 
te_CCI30m30l = sum(en_CCI30m30l(1:420)); 
te_GWP30m    = sum(en_GWP30m(1:420)   );
te_ICI30l30e = sum(en_ICI30l30e(1:420)); 
te_ICI30l30m = sum(en_ICI30l30m(1:420)); 
te_ICI30l30l = sum(en_ICI30l30l(1:420)); 
te_CCI30l30e = sum(en_CCI30l30e(1:420)); 
te_CCI30l30m = sum(en_CCI30l30m(1:420)); 
te_CCI30l30l = sum(en_CCI30l30l(1:420)); 
te_GWP30l    = sum(en_GWP30l   (1:420)); 
te_ICI45e45e = sum(en_ICI45e45e(1:850)); 
te_ICI45e45m = sum(en_ICI45e45m(1:850)); 
te_ICI45e45l = sum(en_ICI45e45l(1:850)); 
te_CCI45e45e = sum(en_CCI45e45e(1:850)); 
te_CCI45e45m = sum(en_CCI45e45m(1:850)); 
te_CCI45e45l = sum(en_CCI45e45l(1:850)); 
te_GWP45e    = sum(en_GWP45e(1:850)   ); 
te_ICI45m45e = sum(en_ICI45m45e(1:850)); 
te_ICI45m45m = sum(en_ICI45m45m(1:850)); 
te_ICI45m45l = sum(en_ICI45m45l(1:850)); 
te_CCI45m45e = sum(en_CCI45m45e(1:850)); 
te_CCI45m45m = sum(en_CCI45m45m(1:850)); 
te_CCI45m45l = sum(en_CCI45m45l(1:850)); 
te_GWP45m    = sum(en_GWP45m(1:850)   );
te_ICI45l45e = sum(en_ICI45l45e(1:850)); 
te_ICI45l45m = sum(en_ICI45l45m(1:850)); 
te_ICI45l45l = sum(en_ICI45l45l(1:850)); 
te_CCI45l45e = sum(en_CCI45l45e(1:850)); 
te_CCI45l45m = sum(en_CCI45l45m(1:850)); 
te_CCI45l45l = sum(en_CCI45l45l(1:850)); 
te_GWP45l    = sum(en_GWP45l(1:850)   ); 

ov_ICI30e30e = max(rf_ICI30e30e(1:420)) - 3; 
ov_ICI30e30m = max(rf_ICI30e30m(1:420)) - 3; 
ov_ICI30e30l = max(rf_ICI30e30l(1:420)) - 3; 
ov_CCI30e30e = max(rf_CCI30e30e(1:420)) - 3; 
ov_CCI30e30m = max(rf_CCI30e30m(1:420)) - 3; 
ov_CCI30e30l = max(rf_CCI30e30l(1:420)) - 3; 
ov_GWP30e    = max(rf_GWP30e   (1:420)) - 3; 
ov_ICI30m30e = max(rf_ICI30m30e(1:420)) - 3; 
ov_ICI30m30m = max(rf_ICI30m30m(1:420)) - 3; 
ov_ICI30m30l = max(rf_ICI30m30l(1:420)) - 3; 
ov_CCI30m30e = max(rf_CCI30m30e(1:420)) - 3; 
ov_CCI30m30m = max(rf_CCI30m30m(1:420)) - 3; 
ov_CCI30m30l = max(rf_CCI30m30l(1:420)) - 3; 
ov_GWP30m    = max(rf_GWP30m(1:420)   ) - 3;
ov_ICI30l30e = max(rf_ICI30l30e(1:420)) - 3; 
ov_ICI30l30m = max(rf_ICI30l30m(1:420)) - 3; 
ov_ICI30l30l = max(rf_ICI30l30l(1:420)) - 3; 
ov_CCI30l30e = max(rf_CCI30l30e(1:420)) - 3; 
ov_CCI30l30m = max(rf_CCI30l30m(1:420)) - 3; 
ov_CCI30l30l = max(rf_CCI30l30l(1:420)) - 3; 
ov_GWP30l    = max(rf_GWP30l(1:420)   ) - 3; 
ov_ICI45e45e = max(rf_ICI45e45e(1:850)) - 4.5; 
ov_ICI45e45m = max(rf_ICI45e45m(1:850)) - 4.5; 
ov_ICI45e45l = max(rf_ICI45e45l(1:850)) - 4.5; 
ov_CCI45e45e = max(rf_CCI45e45e(1:850)) - 4.5; 
ov_CCI45e45m = max(rf_CCI45e45m(1:850)) - 4.5; 
ov_CCI45e45l = max(rf_CCI45e45l(1:850)) - 4.5; 
ov_GWP45e    = max(rf_GWP45e(1:850)   ) - 4.5; 
ov_ICI45m45e = max(rf_ICI45m45e(1:850)) - 4.5; 
ov_ICI45m45m = max(rf_ICI45m45m(1:850)) - 4.5; 
ov_ICI45m45l = max(rf_ICI45m45l(1:850)) - 4.5; 
ov_CCI45m45e = max(rf_CCI45m45e(1:850)) - 4.5; 
ov_CCI45m45m = max(rf_CCI45m45m(1:850)) - 4.5; 
ov_CCI45m45l = max(rf_CCI45m45l(1:850)) - 4.5; 
ov_GWP45m    = max(rf_GWP45m(1:850)   ) - 4.5;
ov_ICI45l45e = max(rf_ICI45l45e(1:850)) - 4.5; 
ov_ICI45l45m = max(rf_ICI45l45m(1:850)) - 4.5; 
ov_ICI45l45l = max(rf_ICI45l45l(1:850)) - 4.5; 
ov_CCI45l45e = max(rf_CCI45l45e(1:850)) - 4.5; 
ov_CCI45l45m = max(rf_CCI45l45m(1:850)) - 4.5; 
ov_CCI45l45l = max(rf_CCI45l45l(1:850)) - 4.5; 
ov_GWP45l    = max(rf_GWP45l(1:850)   ) - 4.5; 

energy30 = [te_ICI30m30e te_ICI30m30m te_ICI30m30l te_CCI30m30e ...
            te_CCI30m30m te_CCI30m30l te_GWP30m];
ovrsht30 = [ov_ICI30m30e ov_ICI30m30m ov_ICI30m30l ov_CCI30m30e ...
            ov_CCI30m30m ov_CCI30m30l ov_GWP30m];

energy45 = [te_ICI45m45e te_ICI45m45m te_ICI45m45l te_CCI45m45e ...
            te_CCI45m45m te_CCI45m45l te_GWP45m];
ovrsht45 = [ov_ICI45m45e ov_ICI45m45m ov_ICI45m45l ov_CCI45m45e ...
            ov_CCI45m45m ov_CCI45m45l ov_GWP45m];

      
figureA = figure;
hold on
set(gca,'FontSize',16,'box','on');
colors = [rgb('Orange');rgb('Orange');rgb('Orange');rgb('Green');rgb('Green');rgb('Green');rgb('Purple')];
scatter(energy30,ovrsht30,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP  '];
text(energy30(1,:),ovrsht30(1,:),labels,'FontSize',16);
xlabel('Energy');
ylabel('Overshoot (W/m^2)');
%title('Energy/Overshoot Plot for 3 W/m^2');
annotation(figureA,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','A',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
axis([360 480 0 0.35])
hold off
saveas(figureA,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure4A','eps')

figureB = figure;
hold on
set(gca,'FontSize',16,'box','on');
scatter(energy45,ovrsht45,75,colors,'Filled')
labels = ['  ICI_E';'  ICI_M';'  ICI_L';'  CCI_E';'  CCI_M';'  CCI_L';'  GWP  '];
text(energy45(1,:),ovrsht45(1,:),labels,'FontSize',16);
xlabel('Energy');
ylabel('Overshoot (W/m^2)');
%title('Energy/Overshoot Plot for 3 W/m^2');
annotation(figureB,'textbox',...
    [0.134580705009276 0.857988165680473 0.0212634508348794 0.0532544378698225],...
    'String','B',...
    'LineStyle','none',...
    'FontSize',24,...
    'FitBoxToText','off');
axis([900 1250 -0.1 0.6])
hold off
saveas(figureB,'/Users/morgane/Dropbox (MIT)/Trancik Lab/ProjectFolders/Metric Testing/Article/current/figures/figure4B','eps')