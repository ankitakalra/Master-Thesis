clc; clear;
%pyversion C:\Users\akaira\AppData\Local\Programs\Python\Python37\Python.exe;

%% Initials
vmax = 2;
rmax = 50;
ratio_vradial = 0;
alpha = 1.256;

%% rcore
rcore = rmax / alpha^0.5;

%% gamma , rmax , vmax , vcore 
gamma = 2*pi*vmax*rmax*(1+1/(2*alpha));

if (gamma ~=	 0) && (rcore ~=	 0)
    rmax = rcore*alpha^0.5;
    vmax = gamma/(2*pi*rmax*(1+1/(2*alpha)));
    vcore = (1 - exp(-1))*gamma/(2*pi*rcore);
else
    disp('Error');
end

%% Range (Input these values)
x = zeros(200,200);
y = zeros(200,200);
for i = 1:200
       x(i,:) = -100:99 ;
       y(:,i) = -100:99;
end
xx = x; yy = y;

%% Vector Field
% m = randi(9); n = randi(9);
xs = [4,5];
% m = randi(9); n = randi(9);
ys = [5,6];
minx = py.min(xs);
maxx = py.max(xs);
miny = py.min(ys);
maxy = py.max(ys);

for i = 1:2
newpoly(i,:) = [(xs(i) - minx),(ys(i) - miny)];
end

X = (maxx - minx) + 1;
Y = (maxy - miny) + 1;

grid = zeros(X,Y);
figure(2)
fill(newpoly,grid,'b');

%% vradial & vtheta
r = radius(x,y);
r = r + 1^(-10);
vtheta = gamma.*(1 - exp(-r.^2)./(rcore^2))./(2*pi.*r);
vradial = vtheta .* ratio_vradial;

%% Vx and Vy at point (x,y)
vector = [(0 - vtheta ).* yy + (vradial .* xx); (vtheta .* xx) + (vradial .* yy) ];
Vx = vector(1:200,:)./r;
Vy = vector(201:400,:)./r;
figure(1)
quiver(x, y, Vx, Vy);

% disp(rcore);
% disp(vcore);

%% Vortex detection based on Graftieaux et al. 2001

% Gamma values
factor = 1;

