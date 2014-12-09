%% These are the global variables for the metric comparison project.

% Declare global variables.
global dt first_year last_year t n form ide_s;

% Define global variables.
dt         = 5                                  ; %time step
first_year = 2010                               ; %initial year
last_year  = 2110                               ; %final year
t          = (first_year : dt : last_year - dt)'; %time vector
n          = size(t)                            ; %length of time vector
form       = 2                                  ; %form of RF function (1=non-lienar; 2=linear)
ide_s      = 1.4                                ; %indirect effect of CH4 (default 1.4)
                       