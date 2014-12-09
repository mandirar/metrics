function [ CCI ] = CCI_calculator( CCI_values,peak )
%ICI_CALCULATOR calcualtes the instantaneous climate impact metric for a
%given vector of instantaneous impacts (i.e. for CH4 or N2O relative to
%CO2) and an anchor or peaking year.

global dt;
first_year = 2010                               ;
last_year  = 2110                               ;
t          = (first_year : dt : last_year - dt)';
n          = length(t)                          ;

CCI=zeros(n,1);

for i = 1:peak
    CCI(i) = CCI_values(peak - i + 1);
end
for i = peak:n
    CCI(i) = CCI_values(1);
end

end

