function [BCs] = f4(x0,mues1e0,varargin)
[mue] = findmue(mues1e0);
%propagator
argument = [varargin{:}];
v0 = [argument(1:3)]; 
r0 = [argument(4:6)]; 

v01 = trans(r0,v0,x0(1),x0(2),x0(3));
tspan =  x0(7) ;
n0 = [r0(1,:)'; v01(1,:)'];
OPTIONS = odeset('RelTol',1e-6,'AbsTol',1e-9);
if mues1e0==0
    [t,n] = ode45('two_body_earth', tspan, n0,OPTIONS);
elseif mues1e0==1
    [t,n] = ode45('two_body_sun', tspan, n0,OPTIONS);
end
[p k] = size(n);
rfinal2 = [n(p,1) n(p,2) n(p,3)]; 
vfinal2 = [n(p,4) n(p,5) n(p,6)]; 
rfinal3 = norm(rfinal2); 
vf3 = trans(rfinal2,vfinal2,x0(4),x0(5),x0(6));

I = [1 0 0];
J = [0 1 0];
K = [0 0 1];
h_vec=cross(rfinal2,vf3);
v1=norm(vf3);
r1=norm(rfinal2);
h=sqrt(dot(h_vec,h_vec));
energy=v1.^2/2 - mue/r1;        
a= -mue/(2*energy);             
e_vec = (1/mue)*((((v1^2)-(mue/r1))*rfinal2)-((dot(rfinal2,vf3))*vf3));   
e=sqrt(dot(e_vec,e_vec));
Tp = 2*pi*sqrt((a^3)/mue);
inc = acosd(dot(K,h_vec)/h);

BCs = [vf3(1) vf3(2) vf3(3) rfinal2(1) rfinal2(2) rfinal2(3)]; 
end