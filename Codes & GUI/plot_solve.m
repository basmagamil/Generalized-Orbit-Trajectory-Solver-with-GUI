function [vresult, rresult] = plot_solve( v0,r0,xx,mues1e0,a )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
mue=findmue(mues1e0);
tof=xx(7);
[vt1] = trans(r0,v0,xx(1),xx(2),xx(3));
rt1=r0;

if mues1e0==0
    [t2,n2] = ode45('two_body_earth', tof, [rt1'; vt1']);
elseif mues1e0==1
    [t2,n2] = ode45('two_body_sun', tof, [rt1'; vt1']);
end

[p2 k2] = size(n2);
rt2 = [n2(p2,1) n2(p2,2) n2(p2,3)]; 
vt2 = [n2(p2,4) n2(p2,5) n2(p2,6)]; 
[vresult] = trans(rt2,vt2,xx(4),xx(5),xx(6));
rresult=rt2;

hold on

% if mues1e0 == 0
%     %%Plotting the Earth%%
%     equat_r=6378.137;
%     polar_r=6356.752;
%     [xx, yy, zz]=ellipsoid (0,0,0,equat_r, equat_r, polar_r);
%     load('topo.mat','topo','topomap1');
%     topo2 = [topo(:,181:360) topo(:,1:180)];
%     pro.FaceColor= 'texture';
%     pro.EdgeColor = 'none';
%     pro.FaceLighting = 'phong';
%     pro.Cdata = topo2;
%     earth= surface(xx,yy,zz,pro,'DisplayName','Earth')
%     colormap(topomap1)
% end

%PLOTTING AXES
xL=[-2*norm(r0) 2*norm(r0)];
yL=[-2*norm(r0) 2*norm(r0)];
zL=[-2*norm(r0) 2*norm(r0)];
line([0 0], yL,[0 0],'color','y','linewidth',0.5,'DisplayName','Y');  %y-axis
line(xL, [0 0],[0 0],'color','y','linewidth',0.5,'DisplayName','X');  %x-axis
line([0 0], [0 0],zL,'color','y','linewidth',0.5,'DisplayName','Z');  %z-axis

%PLOTTING INITIAL ORBIT
[inc0,e0,a0,energy0,Tp0] = R_V_to_parameters2(r0,v0,mue);
if mues1e0==1;
    [t0,n0] = ode45('two_body_sun', Tp0, [r0'; v0']);
elseif mues1e0==0;
    [t0,n0] = ode45('two_body_earth', Tp0, [r0'; v0']);
end
plot3(n0(:,1), n0(:,2), n0(:,3) ,'b', 'LineWidth', 1.0,'DisplayName','Initial Orbit');
%PLOTTING TRANSFER ORBIT
plot3(n2(:,1), n2(:,2), n2(:,3) ,'r', 'LineWidth', 1.0,'DisplayName','Transfer Orbit');
%PLOTTING FINAL ORBIT
[incresult,eresult,aresult,energyresult,Tpresult] = R_V_to_parameters2(rresult,vresult,mue);
if mues1e0==1
    [tresult,nresult] = ode45('two_body_sun', Tpresult, [rresult'; vresult']);
elseif mues1e0==0
    [tresult,nresult] = ode45('two_body_earth', Tpresult, [rresult'; vresult']);
end
plot3(nresult(:,1), nresult(:,2), nresult(:,3) ,'g', 'LineWidth', 1.0,'DisplayName','Final Orbit');
%properties
title(a)
xlabel('x')
ylabel('y')
zlabel('z')
legend('show')
hold off
view(150,15) 


end

