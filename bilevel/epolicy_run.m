% This script executes the emissions and metric optimizaton problem and
% returns an endogenous metric.

clear all
tic

addpath('./tools')
addpath('./tools/EqMetrics')
addpath('./fuel_user')

constants; %loads constants
variables; %loads default variables

%% Set optimization inputs:
guess = (25 * conversion) * ones(n,1); %initial guess for metric
lb    = zeros(n,1);                    %lower bounds
ub    = inf*ones(n,1);                 %upper bounds
A     = [];                            %linear inequality constraint...
b     = [];                            %...of the form Ax <= b
Aeq   = [];                            %linear equality constraint...
beq   = [];                            %...of the form Ax = b

%% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

%% Run optimizaton problem:
metric = fmincon(@(metric) -epolicy_obj(metric,ems_mat),guess,A,b,Aeq,beq,lb,ub,@(metric) epolicy_con(metric,ems_mat),options);

metric = metric./conversion; %converts metric to g CO2-eq/g CH4

toc

clear('A','Aeq','Ak','Am','b','beq','conversion','dt','eta1','eta2',...
    'eta_vec','first_year','form','fuel_count','gCH4_per_molCH4',...
    'gCO2_per_molCO2','guess','ide_s','last_year','lb','n','options',...
    'peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t','ub')