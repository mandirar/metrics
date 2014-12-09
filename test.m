energy = fuel_use * eta_vec; %calculate energy use

% Make the first energy vector
energy1 = energy(1:(end-1),:);

% Make a second energy vector
energy2 = energy(2:end,:);

% Calculate growth rate
growth = (energy1 - energy2)./(energy1*dt);
agrowth = abs(growth);