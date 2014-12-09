function [ f ] = objfun( x )
%Test objective function.

f = x(1)^3 + x(2)^3 + x(3)^3;
f = -f;

end

