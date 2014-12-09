% Plots the complex dynamic metric against other metrics. Creates 4 kinds
% of plots in total:
%
%  1- lambda                  v. impact year tI
%  2- absolute impact of CH4  v. emission year t
%  3- absolute impact of CO2  v. emission year t
%  4- equivalency metric      v. emission year t
%
% Each equivalency metric is plotted on each plot. Run main.m first to
% generate a pathway for lambda for the complex dynamic metric.

global_vars

% Create a vector of impact years ti to plot lambda.
ti = [2010 : dt : 2210]';

% Some metrics (like the GWP) have a lambda that depends not only on the
% impact year but also on the emission year. For these metrics, arbitrarily
% choose some emission year t0.
te0 = 2020;

% Provide scale factors for each metric. These rescale the lambda's and
% the unit impacts for the purposes of plotting to make their shapes
% visible on the same axes.
scale_CDM = 1;
scale_ICI = 1e13;
scale_CCI = 1e12;
scale_GWP = 5e11;

addpath('./tools/EqMetrics/')


%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Plots
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
figure(2)
clf
set(gcf, 'Position',[63         209        1076         520])
fs = 16;

% Use subaxis instead of subplot to get finer control over plot.
addpath('./tools/SubAxis/')
marginTop    = 0.06;
marginBottom = 0.18;
marginLeft   = 0.06;
marginRight  = 0.03;
padding      = 0.0;
spacingVert  = 0.15;
spacingHoriz = 0.07;

% Plot lambda.
subaxis(2,3,3, 'MarginTop',marginTop, 'MarginLeft',marginLeft, 'MarginRight',marginRight, 'Padding',padding, 'SpacingVert',spacingVert, 'SpacingHoriz',spacingHoriz)
hold on
plot(ti, lambda_CDM(ti,te0) * scale_CDM, 'g')
plot(ti, lambda_ICI(ti,te0) * scale_ICI, 'b')
plot(ti, lambda_CCI(ti,te0) * scale_CCI, 'Color',[0.5 0.5 0])
plot(ti, lambda_GWP(ti,te0) * scale_GWP, 'r')
hold off
set(gca, 'FontSize',fs)
xlabel('Impact time t''')
ylabel('MJ / (Wm^{-2} * yr)')
title(['                                            \lambda(t'',t)     @  t = ',num2str(te0)])
set(gca, 'Box','on')
set(gca, 'XLim',[2000 2140])
set(gca, 'YLim',[0 1.5e12])

% Create legend for all plots.
hLegend = legend('CDM','ICI','CCI','GWP');
set(hLegend, 'Position',[0.532092936802973 0.585207371037162 0.104 0.172123719464145]);

% Plot unit impact of CH4.
subaxis(2,3,4)
hold on
plot(t, unitImpact_CH4(@lambda_CDM,t) * scale_CDM, 'g')
plot(t, unitImpact_CH4(@lambda_ICI,t) * scale_ICI, 'b')
plot(t, unitImpact_CH4(@lambda_CCI,t) * scale_CCI, 'Color',[0.5 0.5 0])
plot(t, unitImpact_CH4(@lambda_GWP,t) * scale_GWP, 'r')
hold off
set(gca, 'FontSize',fs)
xlabel('Emission time t')
ylabel('MJ / g CH4')
title('impact_{CH4}(t)')
set(gca, 'Box','on')
ylimits = get(gca, 'YLim');
set(gca, 'YLim',[0 ylimits(2)])

% Plot unit impact of CO2.
subaxis(2,3,5)
hold on
plot(t, unitImpact_CO2(@lambda_CDM,t) * scale_CDM, 'g')
plot(t, unitImpact_CO2(@lambda_ICI,t) * scale_ICI, 'b')
plot(t, unitImpact_CO2(@lambda_CCI,t) * scale_CCI, 'Color',[0.5 0.5 0])
plot(t, unitImpact_CO2(@lambda_GWP,t) * scale_GWP, 'r')
hold off
set(gca, 'FontSize',fs)
xlabel('Emission time t')
ylabel('MJ / g CO2')
title('impact_{CO2}(t)')
set(gca, 'Box','on')
ylimits = get(gca, 'YLim');
set(gca, 'YLim',[0 ylimits(2)])

% Plot equivalency metric.
subaxis(2,3,6)
hold on
plot(t, eqMetric(@lambda_CDM,t), 'g')
plot(t, eqMetric(@lambda_ICI,t), 'b')
plot(t, eqMetric(@lambda_CCI,t), 'Color',[0.5 0.5 0])
plot(t, eqMetric(@lambda_GWP,t), 'r')
hold off
set(gca, 'YLim',[0 120])
set(gca, 'FontSize',fs)
xlabel('Emission time t')
ylabel('g CO2 / g CH4')
title('\mu(t)')
set(gca, 'Box','on')



%scrap code:
%lambda(2) / (eta1/(Ak*ems1_k*(1/2.12)*24))
%lambda(2) / (eta2/(1.4*Am*ems2_m*(353.8*1/1000)*24))

%more scrap code:
%M  = [lambdaFun(tprime(1:60),te(i))' decay_CH4(tprime(1:60) - te(i))'*1e12 lambdaFun(tprime(1:60),te(i))'  .*   decay_CH4(tprime(1:60) - te(i))']
%Phistory(:,i) = lambdaFun(tprime(1:60),te(i))'  .*   decay_CH4(tprime(1:60) - te(i))'
%ide_s*m* sum(Phistory) * dt
%Ii = ide_s*m* M(:,1)'*M(:,2) *dt / 1e11
%pause