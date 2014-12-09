function [ f ] = objfun( x )
%% This is the objective function for the optimization problem.
% Currently maximizes emissions (later energy consumption, which may or may
% not include some weighting).

evec_CO2 = x(:,1);
evec_CH4 = x(:,2);

%One attempt at incorporating technologies:
%f = sum(evec_CO2 + 0.1*evec_CH4);

%Another attempt at incorporating technologies:
f = sum(tech_1(evec_CO2,evec_CH4));

    function energy = tech_1(eCO2_tech1,eCH4_tech1)
        tech_CO2 = 5;   %CO2 emissions intensity (GtC)
        tech_CH4 = 0.1; %CH4 emissions intensity (ppb)
        energy = min(eCO2_tech1/tech_CO2,eCH4_tech1/tech_CH4);
    end

end

