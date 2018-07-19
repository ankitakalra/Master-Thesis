%% Vortex detection based on Graftieaux et al. 2001

% Gamma values
m = randi(5); n = randi(5); o = randi(5);
arr = zeros(m,n,o); array = arr';
factor = 1;

s = size(array);
nx = size(1);
ny = size(2);
x = 0 : nx;
y = 0 : ny;
xnew = 0: (1/factor) : (nx-1);
ynew = 0:  (1/factor): (ny-1);

congridx = interp2(x,y,array);
