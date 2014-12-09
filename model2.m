%eta_CO2 =
%eta_CH4 =

% Set emissions intensity and "sector" size.

% Simulate technology use given budget (and calculate energy consumption).

% Calculate actual radiative forcing.



%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Load input variables.
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
%global_variables  ; %defines dt, form, and peak
%addpath('./tools');
%make_scenarios    ; %generates CO2-only scenarios
%make_metrics      ; %calculates metrics for these scenairos
%rf_nonCO2         ; %output: fpath_nonCO2; fpath_CH4
%load emissions    ; %output: emissions data in g/mile
%legacy_CO2        ; %output: cpath_lCO2
%clear('fpath_CH4','fpath_N2O');

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Define simulation variables.
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Time variables:
%first_year = 2010                               ;
%last_year  = 2110                               ;
%t          = (first_year : dt : last_year - dt)';
%n          = length(t)                          ;
%clear('t')
% Sector variables:
%frac_e = 0.028773179; %fraction of emissions allocated to sector (U.S. passenger vehicle fleet = 0.28773179)
%frac_l = 0          ; %fraction of legacy concentrations allocated to sector
%frac_o = 0          ; %fraction of other radiative forcing allocated to sector
% Metric variables:
%metric = CCI_mat; %select metric
%metric_N2O = CCI_matN;
%clear('ICI_mat','CCI_mat','GWP_mat')
% Fuel variabes:
%fuel     = LCA_abl; %select fuel (bda, bdo, e85, cng, gas, nge, cle)
%fuel_CO2 = fuel(1);
%fuel_CH4 = fuel(2);
%fuel_N2O = fuel(3);
%clear('LCA_bda','LCA_bdo','LCA_e85','LCA_cng','LCA_gas','fuel',...
%    'LCA_col','LCA_gtl','LCA_gel')
% Pre-compute all possible values of impulse response function.
%Delta_t_vec = (last_year - first_year : -dt :first_year - last_year)';
%IRFvec      = decay_CO2(Delta_t_vec);

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Calculate sector budget.
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
%% Calculate background CO2 emissions.
%ek_BACK      = emat_ALL*(1 - frac_e);
%ek_BACK(1,:) = emat_ALL(1,:);
%% Calculate background greenhouse gas concentrations.
% Calculate legacy CH4, N2O, and CO2 concentrations.
%cm_BACK      = (1 - frac_l)*[cpath_CH4  cpath_CH4  cpath_CH4  cpath_CH4  cpath_CH4];
%cm_BACK(1,:) = [cpath_CH4(1,:)  cpath_CH4(1,:)  cpath_CH4(1,:)  cpath_CH4(1,:)  cpath_CH4(1,:) ];
%cn_BACK      = (1 - frac_l)*[cpath_N2O  cpath_N2O  cpath_N2O  cpath_N2O  cpath_N2O];
%cn_BACK(1,:) = [cpath_N2O(1,:)  cpath_N2O(1,:)  cpath_N2O(1,:)  cpath_N2O(1,:)  cpath_N2O(1,:)];
%cl_BACK      = (1 - frac_l)*[cpath_lCO2 cpath_lCO2 cpath_lCO2 cpath_lCO2 cpath_lCO2];
%cl_BACK(1,:) = [cpath_lCO2(1,:) cpath_lCO2(1,:) cpath_lCO2(1,:) cpath_lCO2(1,:) cpath_lCO2(1,:)];
% Calculate CO2 concentrations due to new emissions.
%ctemp = zeros(n,5);
%c0    = 0;
%it    = 0;
%for t = first_year : dt : last_year - dt
%   it          = it + 1;
%   iFirst      = (n + 2) + 1 - it;  % select range of indices corresponding
%   iLast       = (n + 2) + n - it;  % to range of needed Delta_t's
%   IRFvec_t    = IRFvec(iFirst : iLast);
%   IRFmat_t    = [IRFvec_t IRFvec_t IRFvec_t IRFvec_t IRFvec_t];
%   ctemp(it,:) = c0 + sum(IRFmat_t .* ek_BACK .* dt);
%end
%ck_BACK = ctemp/2.12 + cl_BACK; %convert from GtC to ppm and add legacy CO2
%% Calculate background radiative forcing values.
%fk_BACK = rf_CO2(ck_BACK);
%fm_BACK = rf_CH4(cm_BACK);
%fn_BACK = rf_N2O(cn_BACK);
%fo_BACK = (1 - frac_o)*[fpath_other fpath_other fpath_other fpath_other fpath_other];
%ft_BACK  = fk_BACK + fm_BACK + fn_BACK + fo_BACK;
%% Calculate sector allocated radiative forcing.
%fb_SECT = fmat_ALL - ft_BACK;
%compare = [fmat_ALL(:,3) ft_BACK(:,3) fb_SECT(:,3) ];

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Calculate sector emissions and concentrations.
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
%% Calculate sector greenhouse gas emissions.
% Calculate fuel CO2-eq emissions using metric (g CO2-eq/mile).
%fuel_GHG = fuel_CO2 + fuel_N2O*metric_N2O + fuel_CH4*metric;
% Calculate allowed miles driven for the sector.
%eb_SECT      = emat_ALL*frac_e*10^15*(44/12); %sector emissions budget (g CO2)
%eb_SECT(1,:) = [0 0 0 0 0];
%miles        = eb_SECT./fuel_GHG;             %allowed miles
% Calculate actual greenhouse gas emissions from the sector (GtC and ppb CH4).
%ek_SECT = miles.*fuel_CO2*12/(44*10^15);
%em_SECT = miles.*fuel_CH4*12/(16*2.12*10^12);
%en_SECT = miles.*fuel_N2O*12/(44*2.12*10^12);
%% Calculate sector greenhouse gas concentrations.
% Calculate CO2 concentrations due to new emissions.
%ctemp = zeros(n,5);
%c0    = 0;
%it    = 0;
%for t = first_year : dt : last_year - dt
%   it          = it + 1;
%   iFirst      = (n + 1) + 1 - it;  % select range of indices corresponding
%   iLast       = (n + 1) + n - it;  % to range of needed Delta_t's
%   IRFvec_t    = IRFvec(iFirst : iLast);
%   IRFmat_t    = [IRFvec_t IRFvec_t IRFvec_t IRFvec_t IRFvec_t];
%   ctemp(it,:) = c0 + sum(IRFmat_t .* ek_SECT .* dt);
%end
%ck_SECT = ctemp/2.12; %convert from GtC to ppm
% Calculate CH4 concentrations due to new emissions.
%ctemp = zeros(n,5);
%it = 1;
%for t = first_year + dt : dt : last_year - dt
%    it = it + 1;
%    ctemp(it,:) = (ctemp(it - 1,:) + em_SECT(it,:)*dt)*decay_CH4(dt);
%end
%cm_SECT = ctemp;
% Calculate N2O concentrations due to new emissions.
%ctemp = zeros(n,5);
%it = 1;
%for t = first_year + dt : dt : last_year - dt
%    it = it + 1;
%    ctemp(it,:) = (ctemp(it - 1,:) + en_SECT(it,:)*dt)*decay_N2O(dt);
%end
%cn_SECT = ctemp;
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Calculate updated radiative forcing.
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
%fk_NEW = rf_CO2(ck_BACK + ck_SECT);
%fm_NEW = rf_CH4(cm_BACK + cm_SECT);
%fn_NEW = rf_N2O(cn_BACK + cn_SECT);
%ft_NEW = fk_NEW + fm_NEW + fn_NEW + fo_BACK;
%fs_NEW = ft_NEW - ft_BACK;

%clear('Delta_t_vec','IRFvec_t','adjust','c0',...
%    'ctemp','chist_CO2','cpath_CH4','cpath_N2O','cpath_lCO2','c_temp',...
%    'delta_CO2','ehist_CO2','first_year','fpath_nonCO2','fpath_other',...
%    'frac_e','frac_l','frac_o','fuel_CH4','fuel_CO2','fuel_N2O',...
%    'iFirst','iLast','i_t_e','i_year','it','last_year','n','t','t_e',...
%    'year')