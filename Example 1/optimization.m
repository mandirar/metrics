x0 = [0; 1; 2];
[x, fval] = fmincon('objfun',x0,[],[],[],[],[0;-Inf;-Inf],[Inf,Inf,0],'constraint');