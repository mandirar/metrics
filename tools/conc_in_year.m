function [ frac,evec,cvec,rate ] = conc_in_year( fe,t1,t2,t3,e0 )
% CONC_IN_YEAR calculates the incremental CO2 concentration (CONC) in a
% given year, after time zero (2010), as specified by fe, t1, t2, t3, and
% e0, defined below.  The second argument returns the emissions vector, and
% the third argument returns the concentration vector.

% fe: initial fractional rate of change in emissions (unitless).
% t1: year when fe(t) begins to decline (years).
% t2: time from t1 until emissions stabilization [fe(t)=0] (years).
% t3: -1/min[fe(t)] (unitless).
% e0: initial emissions (GtC).

%% INPUT VARIABLES:
% Declare global variables.
global dt

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Construct growth rate pathway g(t).
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Construct time vector.
first_year = 2010;
last_year  = 2110;
t          = (first_year : dt : last_year - dt)';

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
%check: t == [tseg1; tseg2; tseg3]

gseg1 = g0*ones(length(tseg1),1);                         % segment #1
gseg2 = g0 + m*(tseg2 - (first_year + s1));               % segment #2
gseg3 = gf*ones(length(tseg3),1);                         % segment #3
rate  = [gseg1; gseg2; gseg3];

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Construct emissions pathway e(t).
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
evec = e0*exp( [0; cumsum(rate(1:end - 1)*dt)] );
frac = exp( [0; cumsum(rate(1:end - 1)*dt)] );

%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
% Construct concentration pathway c(t).
%=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%

% Pre-compute all possible values of impulse response function.
Delta_t_vec = (last_year - first_year : -dt :first_year - last_year)';
IRFvec      = decay_CO2(Delta_t_vec);

% Compute the integral over emissions for each impact year t2.
n    = length(t);
cvec = zeros(n,1);
c0   = 0;
it   = 0;
for t2 = first_year : dt : last_year - dt
   it        = it + 1;
   iFirst    = (n + 1) + 1 - it;           % select range of indices corresponding
   iLast     = (n + 1) + n - it;           % to range of needed Delta_t's
   IRFvec_t  = IRFvec(iFirst : iLast);  
   cvec(it)  = c0 + IRFvec_t' * evec * dt; % compute integral
end
cvec = cvec / 2.12; %convert from GtC to ppm

end