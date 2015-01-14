load('output2.mat')

te_ICI30e30e = sum(en_ICI30e30e); 
te_ICI30e30m = sum(en_ICI30e30m); 
te_ICI30e30l = sum(en_ICI30e30l); 
te_CCI30e30e = sum(en_CCI30e30e); 
te_CCI30e30m = sum(en_CCI30e30m); 
te_CCI30e30l = sum(en_CCI30e30l); 
te_GWP30e    = sum(en_GWP30e   ); 
te_ICI30m30e = sum(en_ICI30m30e); 
te_ICI30m30m = sum(en_ICI30m30m); 
te_ICI30m30l = sum(en_ICI30m30l); 
te_CCI30m30e = sum(en_CCI30m30e); 
te_CCI30m30m = sum(en_CCI30m30m); 
te_CCI30m30l = sum(en_CCI30m30l); 
te_GWP30m    = sum(en_GWP30m   );
te_ICI30l30e = sum(en_ICI30l30e); 
te_ICI30l30m = sum(en_ICI30l30m); 
te_ICI30l30l = sum(en_ICI30l30l); 
te_CCI30l30e = sum(en_CCI30l30e); 
te_CCI30l30m = sum(en_CCI30l30m); 
te_CCI30l30l = sum(en_CCI30l30l); 
te_GWP30l    = sum(en_GWP30l   ); 
te_ICI45e45e = sum(en_ICI45e45e); 
te_ICI45e45m = sum(en_ICI45e45m); 
te_ICI45e45l = sum(en_ICI45e45l); 
te_CCI45e45e = sum(en_CCI45e45e); 
te_CCI45e45m = sum(en_CCI45e45m); 
te_CCI45e45l = sum(en_CCI45e45l); 
te_GWP45e    = sum(en_GWP45e   ); 
te_ICI45m45e = sum(en_ICI45m45e); 
te_ICI45m45m = sum(en_ICI45m45m); 
te_ICI45m45l = sum(en_ICI45m45l); 
te_CCI45m45e = sum(en_CCI45m45e); 
te_CCI45m45m = sum(en_CCI45m45m); 
te_CCI45m45l = sum(en_CCI45m45l); 
te_GWP45m    = sum(en_GWP45m   );
te_ICI45l45e = sum(en_ICI45l45e); 
te_ICI45l45m = sum(en_ICI45l45m); 
te_ICI45l45l = sum(en_ICI45l45l); 
te_CCI45l45e = sum(en_CCI45l45e); 
te_CCI45l45m = sum(en_CCI45l45m); 
te_CCI45l45l = sum(en_CCI45l45l); 
te_GWP45l    = sum(en_GWP45l   ); 

ov_ICI30e30e = max(en_ICI30e30e); 
ov_ICI30e30m = max(en_ICI30e30m); 
ov_ICI30e30l = max(en_ICI30e30l); 
ov_CCI30e30e = max(en_CCI30e30e); 
ov_CCI30e30m = max(en_CCI30e30m); 
ov_CCI30e30l = max(en_CCI30e30l); 
ov_GWP30e    = max(en_GWP30e   ); 
ov_ICI30m30e = max(en_ICI30m30e); 
ov_ICI30m30m = max(en_ICI30m30m); 
ov_ICI30m30l = max(en_ICI30m30l); 
ov_CCI30m30e = max(en_CCI30m30e); 
ov_CCI30m30m = max(en_CCI30m30m); 
ov_CCI30m30l = max(en_CCI30m30l); 
ov_GWP30m    = max(en_GWP30m   );
ov_ICI30l30e = max(en_ICI30l30e); 
ov_ICI30l30m = max(en_ICI30l30m); 
ov_ICI30l30l = max(en_ICI30l30l); 
ov_CCI30l30e = max(en_CCI30l30e); 
ov_CCI30l30m = max(en_CCI30l30m); 
ov_CCI30l30l = max(en_CCI30l30l); 
ov_GWP30l    = max(en_GWP30l   ); 
ov_ICI45e45e = max(en_ICI45e45e); 
ov_ICI45e45m = max(en_ICI45e45m); 
ov_ICI45e45l = max(en_ICI45e45l); 
ov_CCI45e45e = max(en_CCI45e45e); 
ov_CCI45e45m = max(en_CCI45e45m); 
ov_CCI45e45l = max(en_CCI45e45l); 
ov_GWP45e    = max(en_GWP45e   ); 
ov_ICI45m45e = max(en_ICI45m45e); 
ov_ICI45m45m = max(en_ICI45m45m); 
ov_ICI45m45l = max(en_ICI45m45l); 
ov_CCI45m45e = max(en_CCI45m45e); 
ov_CCI45m45m = max(en_CCI45m45m); 
ov_CCI45m45l = max(en_CCI45m45l); 
ov_GWP45m    = max(en_GWP45m   );
ov_ICI45l45e = max(en_ICI45l45e); 
ov_ICI45l45m = max(en_ICI45l45m); 
ov_ICI45l45l = max(en_ICI45l45l); 
ov_CCI45l45e = max(en_CCI45l45e); 
ov_CCI45l45m = max(en_CCI45l45m); 
ov_CCI45l45l = max(en_CCI45l45l); 
ov_GWP45l    = max(en_GWP45l   ); 

energy = [en_ICI30m30e en_ICI30m30m en_ICI30m30l en_ICI45m45e en_ICI45m45m en_ICI45m45l ...
          en_CCI30m30e en_CCI30m30m en_CCI30m30l en_CCI45m45e en_CCI45m45m en_CCI45m45l];
ovrsht = [ov_ICI30m30e ov_ICI30m30m ov_ICI30m30l ov_ICI45m45e ov_ICI45m45m ov_ICI45m45l ...
          ov_CCI30m30e ov_CCI30m30m ov_CCI30m30l ov_CCI45m45e ov_CCI45m45m ov_CCI45m45l];

figureA = figure;
hold on
set(gca,'FontSize',16,'box','on');
scatter(energy,overshoot,'Filled')
%legend('Intended','GWP','ICI','CCI');
%set(legend,'Location','Southeast','Box','off','FontSize',16);
%xlabel('Year');
%ylabel('Radiative Forcing (W/m^2)');
%title('Nonlinear Simulation with Late Stabilization');
hold off
savefig(figureA,'figureA')


%p = rand(10,2);
%scatter(p(:,1), p(:,2), 'filled')
%axis([0 1 0 1])

%labels = num2str((1:size(p,1))','%d');    %'
%text(p(:,1), p(:,2), labels, 'horizontal','left', 'vertical','bottom')