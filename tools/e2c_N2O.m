function [ cvec ] = e2c_N2O( evec )
%cvec = e2c_CH4(evec) computes the additional CH4 concentration pathway
%cvec (in units of ppb) that results from from an emissions pathway evec
%(in units ppb).

global_vars;  %load global variabes

cvec = zeros(n,1); %initialize concentration pathway

it = 1;
for t2 = first_year + dt : dt : last_year - dt
    it = it + 1;
    cvec(it,:) = (cvec(it - 1,:) + evec(it,:)*dt)*decay_N2O(dt);
end

end
