% This script executes the technology optimization problem for a default
% set of variables and returns a lambda metric.

clear
tic

addpath('./tools')
addpath('./variables')

constants; %loads constants
variables; %loads default variables

%% Set optimization inputs:
guess = 10*rand(n,fuel_count);  %initial guess for fuel use
A     = [];                     %linear inequality constraint...
b     = [];                     %...of the form Ax <= b
Aeq   = [];                     %linear equality constraint...
beq   = [];                     %...of the form Ax = b
lb    = zeros(n,fuel_count);    %lower bounds
ub    = inf*ones(n,fuel_count); %upper bounds

%% Set optimization options:
options             = optimset('fmincon'); 
options.Algorithm   = 'interior-point';    
options.MaxFunEvals = 10^7;
options.MaxIter     = 10^7;
options.TolX        = 10^-20;

%% Run optimization problem:
[fuel_use,~,~,~,Lmultipliers] = fmincon(@(fuel_use) -energyPolicy_obj(fuel_use),guess,A,b,Aeq,beq,lb,ub,@(fuel_use) energyPolicy_con(fuel_use,ems_mat),options);

lambdaSim = Lmultipliers.ineqnonlin(1:n);
tSim = t;
save('./tools/EqMetrics/lambda_CDM.mat', 'tSim','lambdaSim')

metric = eqMetric(@lambda_CDM,t)';

clear('A','Aeq','Ak','Am','Lmultipliers','b','beq','conversion','dt',...
    'eta1','eta2','eta_vec','first_year','form','fuel_count',...
    'gCH4_per_molCH4','gCO2_per_molCO2','guess','ide_s','last_year',...
    'lb','n','options','peak','ppbCH4_to_GtCH4','ppmCO2_to_GtC','t',...
    'ub','lambdaSim','tSim')

toc