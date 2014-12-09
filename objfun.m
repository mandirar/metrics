function [ f ] = objfun( x )
%% This is the objective function for the optimization problem.
% Currently maximizes emissions (later energy consumption, which may or may
% not include some weighting).

f = sum(x);

end

