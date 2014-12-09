function cvec = e2c_CO2( evec )
%cvec = e2c_CO2(evec) computes the additional CO2 concentration pathway
%cvec (in units of ppm) that results from from an emissions pathway evec
%(in units GtC).

global_vars; %load global variabes

% Pre-compute all possible values of impulse response function.
Delta_t_vec = (last_year - first_year : -dt : first_year - last_year)';
IRFvec      = decay_CO2(Delta_t_vec);

% Compute the integral over emissions for each impact year t2.
%t    = (first_year : dt : last_year - dt)';
%n    = length(t);
cvec = zeros(n,1);
c0   = 0;
it   = 0;
for t2 = first_year : dt : last_year - dt
   it        = it + 1;
   iFirst    = (n + 2) + 1 - it;           % select range of indices corresponding
   iLast     = (n + 2) + n - it;           % to range of needed Delta_t's
   IRFvec_t  = IRFvec(iFirst : iLast);  
   cvec(it)  = c0 + IRFvec_t' * evec * dt; % compute integral
   %cvec(it) = c0 + sum(IRFvec_t .* evec * dt); %ALT
end
cvec = cvec / 2.12; %convert from GtC to ppm