%addpath('./tools')
addpath('./tools/EqMetrics')

ti = t;

te0 = 2020;

GWP = eqMetric(@lambda_GWP,t); % g CO2-eq/g CH4
conversion = (10^12/10^15)*(12/44); % THESE SHOULDN'T BE HARD CODED IN (ADD TO GLOBAL VARS)
mu = GWP.*conversion;

emsd_mat = emsd_k + emsd_m.*[GWP_sim; GWP_sim];

save('metric.mat')

energy = main();

