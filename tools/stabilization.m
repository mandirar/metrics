function [fraction,fvec_new] = stabilization(evec_kO,evec_mO,fvec_old)
% This function converts a peak-and-decline scenario into a stabilization 
% scenario by adding exactly enough additional CO2 and CH4 emissions (in
% proportion to their current emissions ratio) following the peak to keep 
% radiative forcing constant.

% INPUTS:
% evec_kO:  peak and decline CO2 emissions pathway (GtC)
% evec_mO:  peak and decline CH4 emissions pathway (Tg CH4)
% fvec_old: peak and decline radiative foricng pathyway

% OUTPUTS:
% fraction: fraction by which emissions pathways are multiplied
% fvec_new: stabiliation radiative forcing pathway

constants; 

% PRELIMINARY CALCULATIONS:

% Calculate year when radiative forcing peaks.
[rf_max,i_peak] = max(fvec_old);

% Calculate intended radiative forcing pathway.
fvec_new = [fvec_old(1:i_peak) ; rf_max * ones(n - i_peak,1)];
   
% EMISSIONS OPTIMIZATION PROBLEM:

% maximize fraction
% subject to radiative forcing equal to what we expect

end