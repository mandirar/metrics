% LEGACY_CO2 calculates the legacy CO2 concentrations resulting from
% historical CO2 emissions and adjusting for actual concentrations at time
% zero (2010).
% 
% Initially, legacy concentrations may be computed directly from emissions
% using impulse response functions. The result is saved in a mat file and
% subsequently legacy concentrations can be computed by interpolating this
% result to save processing time.

global_vars; %load global variables

% Set switch: interpolate legacy CO2 pathway or construct it from emissions
interpolate_pathway = true;

if interpolate_pathway
   load interpolation_basis.mat  % Contains t_basis and cpath_basis
   
   % For an underlying function approximated by the vectors t_basis &
   % cpath_basis, interp1 grabs the values of this function at locations t.
   cpath_lCO2 = interp1(t_basis,cpath_basis, t);
   
else
   %=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
   % Setup
   %=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
   % Load emissions and concentrations data.
   load historical_data.mat;
   
   % historical_data.mat contains:
   % t_hist:    historical years vector.
   % ehist_CO2: historical CO2 emissions vector.
   % chist_CO2: historical CO2 concentration vector.
   
   if false
      figure(1)
      plot(t_hist, ehist_CO2,'o')
      
      figure(2)
      plot(t_hist, chist_CO2,'o')
   end
   
   
   %=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
   % Compute adjustment term
   %=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
   % Calculate modeled change in concentration from 1850 to 2010.
   delta_CO2 = zeros(161,1);
   for year = 1850:2010
      for t_e = 1850:year
         delta_CO2(year - 1849) = delta_CO2(year - 1849) + ehist_CO2(t_e - 1849)*decay_CO2(year - t_e);
      end
   end
   delta_CO2 = delta_CO2/2.12; %convert from GtC to ppm CO2
   
   % Calculate adjustment term, the difference between actual and modeled
   % concentrations in the final year of the historical data, 2010. This is
   % also the first year of the simulation.
   adjust = chist_CO2(end) - delta_CO2(end);
   
   
   %=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
   % Compute legacy concentrations
   %=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=%
   cpath_lCO2 = zeros(n,1);
   i_year = 1;
   for year = 2010:dt:(2110 - dt)
      c_temp = 0;
      for t_e = 1850:2010
         i_t_e = t_e - 1849;
         c_temp = c_temp + ehist_CO2(i_t_e)*decay_CO2(year - t_e);
      end
      cpath_lCO2(i_year) = c_temp;
      i_year = i_year + 1;
   end
   
   % Convert from GtC to ppm CO2 and add in adjustment term.
   cpath_lCO2 = cpath_lCO2/2.12 + adjust;
   
   % One-time code. Use only when one wishes to update the basis pathways.
   %t_basis     = t;
   %cpath_basis = cpath_lCO2;
   %save('interpolation_basis.mat','t_basis','cpath_basis')
end

% Clear intermediate variables.
clear('cpath_basis','interpolate_pathway','t_basis');