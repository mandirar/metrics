function [ cvec ] = e2c_CH4( evec )
%This function computes the additional CH4 concentrations (in units ppb)
%that result from from an emissions pathway evec (in units TgCH4).

global_vars;  %load global variabes

cvec = zeros(n,1); %initialize concentration pathway

it = 1;
cvec(1) = evec(1)*dt;
for t2 = first_year + dt : dt : last_year - dt
    it = it + 1;
    cvec(it) = cvec(it-1)*decay_CH4(dt) + evec(it)*dt;
end
cvec = cvec * 12/(16*2.12); %convert from Tg CH4 to ppb

%Step here converting Tg CH4 to ppb.

end