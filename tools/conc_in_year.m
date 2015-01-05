function [ cvec_k,cvec_m,evec_k,evec_m ] = conc_in_year(t1,t2)
% This function calculates the incremental CO2 and CH4 concentrations in a
% given year, as specified by fe, t1, t2, t3, and e0.

% INPUTS:
% fe: initial fractional rate of change in emissions (unitless).
% t1: year when fe(t) begins to decline (years).
% t2: time from t1 until emissions stabilization [fe(t)=0] (years).
% t3: -1/min[fe(t)] (unitless).
% e0: initial emissions (GtC).

% OUTPUTS:
% cvec_k: CO2 concentration pathway (ppm)
% cvec_m: CH4 concentration pathway (ppb)

constants;

% CONSTRUCT GROWTH RATE PATHWAY:

% Translate Allen et al's notation into better notation.
s1 = t1 - first_year;               % end time of segment #1 (as measured from first_year)
s2 = s1 + t2;                       % peak time (as measured from first_year)
g0 = fe;                            % initial growth rate
gf = -1/t3;                         % final growth rate
m  = (0 - g0)/(s2 - s1);            % slope of segment #2
s3 = s1 + (g0 - gf)/g0 * (s2 - s1); % start time of segment #3 (as measured from first_year)

% Splice three straight line segments to construct Allen's growth rate path.
tseg1 = t( (t>=first_year)      & (t<first_year + s1) );  % segment #1
tseg2 = t( (t>=first_year + s1) & (t<first_year + s3) );  % segment #2
tseg3 = t( (t>=first_year + s3) & (t<=last_year) );       % segment #3

gseg1 = g0*ones(length(tseg1),1);                         % segment #1
gseg2 = g0 + m*(tseg2 - (first_year + s1));               % segment #2
gseg3 = gf*ones(length(tseg3),1);                         % segment #3
rate  = [gseg1; gseg2; gseg3];

% CONSTRUCT EMISSIONS PATHWAY:

evec_k = e0_k * exp( [0; cumsum(rate(1:end - 1)*dt)] );
evec_m = e0_m * exp( [0; cumsum(rate(1:end - 1)*dt)] );

% CONSTRUCT CONCENTRATION PATHWAY:

cvec_k = e2c_CO2(evec_k);
cvec_m = e2c_CH4(evec_m);

end