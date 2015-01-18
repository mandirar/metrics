function [ cvec ] = e2c_N2O( evec )
% This function computes the additional N2O concentrations (ppb) that
% result from an emissions pathway evec (Tg N2O).

constants;
cvec    = zeros(n,1); %initialize concentration pathway
it      = 1;
cvec(1) = evec(1) * dt;

for t2 = first_year + dt : dt : last_year - dt
    it = it + 1;
    cvec(it) = cvec(it - 1)*decay_N2O(dt) + evec(it)*dt;
end
cvec = cvec * 1/2.12; %convert from Tg CH4 to ppb

end
