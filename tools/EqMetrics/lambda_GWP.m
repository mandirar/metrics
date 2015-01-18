function lambda = lambda_GWP(ti,te)
% lambda = lambda_GWP(ti,te) returns the RF pricing function for the GWP.
% It gives the RF price (or something proportional to it) in impact year ti
% for an emission in year te.
%
% ti can be a vector of impact years. te must be a scalar.

T      = 100;
lambda = (ti >= te) & (ti <= te + T);