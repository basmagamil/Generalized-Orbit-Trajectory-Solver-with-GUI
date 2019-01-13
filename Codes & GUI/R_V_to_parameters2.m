function [inc,e,a,energy,Tp] = R_V_to_parameters2(R_vec,V_vec,mue)
%Constants
% Mass_Earth=6.66*10^26;
% Grav_const=5.972*10^24;
% mue=Mass_Earth*Grav_const;
% mueearth=3.986*10^5; %gravitational parameter - - - km^3/s^2
% muesun=1.327e11;

%vernier equinox axis
I = [1 0 0];
J = [0 1 0];
K = [0 0 1];

%obtaining specific angular momentum by cross multiplying RxV
h_vec=cross(R_vec,V_vec);

%obtaining magnitudes
v_0=norm(V_vec);
r_0=norm(R_vec);
h=sqrt(dot(h_vec,h_vec));

%calculating orbit specifications
energy=v_0.^2/2 - mue/r_0;          %specific energy %MJ/kg
a= -mue/(2*energy);             %semi-major axis
e_vec = (1/mue)*((((v_0^2)-(mue/r_0))*R_vec)-((dot(R_vec,V_vec))*V_vec));   % Eccentricity vector
e=sqrt(dot(e_vec,e_vec));
Tp = 2*pi*sqrt((a^3)/mue);
inc = acosd(dot(K,h_vec)/h);  % Inclination angle
