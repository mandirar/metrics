function [ c1,c2 ] = constraint( x )
%Test constraint function.

c1 = 2*x(3)^2 - x(2)^2;
c2 = x(1)^2 + x(2)^2 + x(3)^2 -1;

end

