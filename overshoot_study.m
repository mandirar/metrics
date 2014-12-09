clear all
tic

% Set search paths and global variables.
global_variables
addpath('./tools')
addpath('./tools/SubAxis/')

% Optional: plot RF pathway from compare_metricsA.
if true
   compare_metricsA
   disp('Done calculating compare_metricsA')
   t = [2010:dt:2110-dt];
   figure(3)
   clf
   plot(t,f_total(:,1), 'o')
end

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Compute overshoot components: DeltaRF, RF(t,0), and RF_C
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Scenario parameters
q  = 0.2;
t1 = 2011;

% Form 2 t1's for the five scenarios, reprinted here to make comparisons
% easier:
%A: 2011
%B: 2015
%C: 2019
%D: 2022
%E: 2026

% Generate (stabilization) pathways for emissions, concentration, and RF in
% the CO2-only case.
[evec,cvec,fvec,t2] = scenario_generator(t1);

% For this scenario, get t_s.
first_year = 2010;
last_year  = 2110;
t          = (first_year : dt : last_year - dt)';
i_s        = find(diff(fvec) < 10^-6); % Find the first year
i_s        = i_s(1);                   % when fvec stops
t_s        = t(i_s)                    % rising.

% Compute equivalency metric.
[mu,A_M,A_K,ide] = mu_ICI(t_s,t); %%fix

% Optional: set ide to 1 "by hand" here so that ensuing calculation of mu_s
% does not include indirect effects.
ide = 1;

% Pre-compute all possible values of the IRF and (AK*fK)/(AM*fM) to help
% compute integral in next step.
Delta_t_vec = (last_year - first_year : -dt :first_year - last_year)';
IRFvec      = decay_CH4(Delta_t_vec);
mu_s_vec    = (A_M*decay_CH4(Delta_t_vec)) ./ (A_K*decay_CO2(Delta_t_vec)) *(44/16)*ide*1000;
mu_s_vec(isnan(mu_s_vec)) = mu(end); %Set all NaNs to be the final value of mu_ICI

% Compute the integral for DeltaRF for each impact year t2.
n       = length(t);
DeltaRF = zeros(n,1);
it      = 0;
for t2 = first_year : dt : last_year - dt
   it          = it + 1;
   iFirst      = (n + 2) + 1 - it;           % select range of indices corresponding
   iLast       = (n + 2) + n - it;           % to range of needed Delta_t's
   IRFvec_t    = IRFvec(iFirst : iLast);
   mu_s_vec_t  = mu_s_vec(iFirst : iLast);
   DeltaRF(it) = q*A_M*sum(IRFvec_t .* evec .* (1./mu - 1./mu_s_vec_t) * dt);
end
GtCO2_per_GtC    = 3.66;
ppbCH4_per_GtCH4 = 352.5;
DeltaRF          = DeltaRF * GtCO2_per_GtC * ppbCH4_per_GtCH4; %W/m^2

% Compute RF(t,0) RF_C.
RF0  = fvec;
RF_C = peak;




%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Plots
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%

%---------------------------------%
% Static plots to compare results of sim to RF(t,q) = DeltaRF + RF(t,0) formula
%---------------------------------%
static_plots = false;
if static_plots
   % Metric pathway
   figure(1)
   plot(t,mu)
   set(gca, 'FontSize',16)
   set(gca, 'YLim',[0 130])
   set(gca, 'XLim',[2000 last_year])
   ylabel('\mu(t) (g CO2-eq/g CH4)')
   
   % Emissions and concentration
   figure(2)
   clf
   plot(t,evec)
   set(gca, 'FontSize',16)
   %set(gca, 'YLim',[0 130])
   set(gca, 'XLim',[2000 last_year])
   ylabel('e(t) (GtC)')
   
   % Radiative forcing
   figure(3)
   %clf
   hold on
   plot([first_year last_year], [RF_C RF_C], 'k--')
   plot(t,RF0, 'k-','LineWidth',2)
   plot(t,RF0+DeltaRF, 'r-')
   hold off
   set(gca, 'FontSize',16)
   set(gca, 'YLim',[2 4])
   %set(gca, 'YLim',[2 20.0])
   set(gca, 'XLim',[2010 last_year])
   ylabel('RF (W/m^2)')
end


%---------------------------------%
% Dynamic plots of integral
%---------------------------------%
dynamic_plot = true;
if dynamic_plot
   
   % Plot settings
   figure(4)
   clf
   subaxis(6,1,1)
   [AX,Hleft,Hright] = plotyy([1],[1], [1],[1]);
   set(gca, 'Box','on')
   %set(gca, 'XLim',[first_year last_year])
   set(AX(1), 'YLim', [0 15])
   set(AX(2), 'YLim', [0 2])
   set(AX(1), 'FontSize',16)
   set(AX(2), 'FontSize',16)
   ylabel(AX(1), 'e(t)')
   ylabel(AX(2), 'f_M(t,t'')')
   set(gca, 'XLim',[first_year last_year])
   xlabel('t (left) & t'' (right)')
   
   subaxis(6,1,2)
   set(gca, 'XLim',[first_year last_year])
   set(gca, 'FontSize',16)
   ylabel('f_M(t,t'') e(t'')')
   xlabel('t''')
   
   subaxis(6,1,3)
   set(gca, 'Box','on')
   set(gca, 'XLim',[first_year last_year])
   %legend('\mu(t'')','\mu_*(t,t'')', 'Location','SouthEast')
   set(gca, 'FontSize',16)
   xlabel('t''')
   
   subaxis(6,1,4)
   set(gca, 'XLim',[first_year last_year])
   set(gca, 'FontSize',16)
   xlabel('t''')
   
   subaxis(6,1,5)
   set(gca, 'XLim',[first_year last_year])
   set(gca, 'FontSize',16)
   xlabel('t''')
   
   subaxis(6,1,6)
   set(gca, 'Box','on')
   set(gca, 'XLim',[first_year last_year])
   set(gca, 'YLim',[2 3.5])
   hold on
   plot([first_year last_year], [RF_C RF_C], 'k--')
   plot(t,RF0, 'k-','LineWidth',2)
   plot(t,RF0+DeltaRF, 'r-')
   hold off
   set(gca, 'FontSize',16)
   xlabel('t')
   
   % Plot loop for animation
   it      = 0;
   for t2 = first_year : dt : last_year - dt
      % Compute mu_star for this time
      it          = it + 1;
      iFirst      = (n + 1) + 1 - it;           % select range of indices corresponding
      iLast       = (n + 1) + n - it;           % to range of needed Delta_t's
      IRFvec_t    = IRFvec(iFirst : iLast);
      mu_s_vec_t  = mu_s_vec(iFirst : iLast);
      
      % Update plots.
      figure(4)
      
      % Emissions v. t and f_M(t,t') vs. t', parameterized by t
      subaxis(6,1,1)
      cla
      hold on
      [AX,Hleft,Hright] = plotyy(t(1:it),evec(1:it), t,IRFvec_t);
      %plot(t(1:it),evec(1:it),'bo')
      plot(AX(1),t,evec,'b-')
      hold off
      set(Hleft, 'Marker','o')
      set(AX(1), 'YLim', [0 15])
      set(AX(2), 'YLim', [0 2])
      title( ['t = ',num2str(floor(t2))] )
      set(AX(2), 'FontSize',16)
      ylabel(AX(2), 'f_M(t,t'')')
      
      % f_M(t,t') * e(t') vs. t'
      subaxis(6,1,2)
      plot(t, IRFvec_t .* evec)
      set(gca, 'XLim',[first_year last_year])
      set(gca, 'YLim', [0 15])
      set(gca, 'FontSize',16)
      ylabel('f_M(t,t'') e(t'')')
      xlabel('t''')
      
      % mu(t') and mu_star(t,t') vs. t'
      subaxis(6,1,3)
      cla
      hold on
      plot(t,mu,'b')
      plot(t,mu_s_vec_t,'r')
      hold off
      ylabel('\mu(t'') and \mu_*(t,t'')')
      set(gca, 'YLim', [0 150])
      
      % 1/mu(t') - 1/mu_star(t,t') vs. t'
      subaxis(6,1,4)
      cla
      plot(t, (1./mu - 1./mu_s_vec_t), 'k')
      set(gca, 'YLim',[-.1 .2])
      xlabel('t''')
      ylabel('1/\mu - 1/\mu_*')
      set(gca, 'XLim',[first_year last_year])
      
      % f_M(t,t') * e(t') * [1/mu(t') - 1/mu_star(t,t')] vs. t'
      subaxis(6,1,5)
      cla
      plot(t, IRFvec_t .* evec .* (1./mu - 1./mu_s_vec_t))
      set(gca, 'XLim',[first_year last_year])
      set(gca, 'YLim', [-0.5 1.5])
      xlabel('t''')
      ylabel('integrand(t'')')
      
      % RF(t,q) and RF(t,0) vs. t
      subaxis(6,1,6)
      cla
      hold on
      plot(t(1:it),RF0(1:it) + DeltaRF(1:it), 'ro')
      plot(t,RF0+DeltaRF, 'r-')
      plot(t,RF0, 'k-','LineWidth',2)  
      plot([first_year last_year], [RF_C RF_C], 'k--')
      hold off
      ylabel('RF(t)')
      
      refresh
   end
end



%cumulative_emissions_to_peak = sum(evec(1:i_s))
toc