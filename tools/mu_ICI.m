function [mu,A_M,A_K,ide] = mu_ICI(t_s,t)

% Physical constants.
alpha_K = 5.35;         %W/m^2
alpha_M = 0.036;        %W/m^2 ppb^(-1/2)
cK_0    = 389.324;      %current CO2 concentration (ppm)
cM_0    = 1778.675;     %current CH4 concentration (ppb)
cK_t0   = 278;          %pre-industrial CO2 concentration (ppm)
cM_t0   = 700;          %pre-industrial CH4 concentration (ppb)
cN_t0   = 270;          %pre-industrial N2O concentration (ppb)

c1      = 0.47;         %W/m^2
c2      = 2.01*10^-5;   %unitless
c3      = 5.31*10^-15;  %unitless
e1      = 0.75;         %unitless
e2      = 1.52;         %unitless

ide     = 1.4;          %unitless

% Compute radiative efficiencies.
m       = cM_0;
n       = cN_t0;
dOMN_dc = c1*(c2 * e1 * m^(e1-1) * n^e1...
            + c3 * (e2+1) * (m*n)^e2) / (1 + c2*(m*n)^e1 + c3*m*(m*n)^e2);
A_M     = alpha_M/(2*sqrt(cM_0)) - dOMN_dc;     %W/m^2 / ppb CH4
A_K     = alpha_K/cK_0;                         %W/m^2 / ppm CO2

% Compute mu.
Delta_t = t_s - t;
Delta_t = Delta_t.*(Delta_t > -10e-6); %If Delta_t is negative, set it to zero. Since Delta_t is negative after the peak year, this change ensures that mu will take on the value of the peak year (when Delta_t = 0) for all subsequent years.
mu      = (A_M*decay_CH4(Delta_t)) ./ (A_K*decay_CO2(Delta_t)) *(44/16)*ide*1000;   %g CO2(eq) / g CH4