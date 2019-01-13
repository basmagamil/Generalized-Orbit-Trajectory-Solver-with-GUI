
function [vresult, rresult, G, deltaV1, deltaV2, time] = solve_plot4(v0,r0,BCus,BCuslgic,x0,x0lgic,mues1e0)
mue=findmue(mues1e0);

% v0 = [-16.1558 -25.439 0.000561];
% r0 = [-1.25732*10^8 7.77318*10^7 -2734.18];
% %vx vy vz rx ry rz
% BCus = [17.3933 -4.33479 0.14295 -9.09351*10^7 -2.63396*10^8 3.31278*10^6]
% BCuslgic = [1 1 1 1 1 1];
% x0 = [2 2 2 2 2 2 8640000];
% x0lgic = [1 1 1 1 1 1 0];
% mues1e0=1;

xp = x0(logical(x0lgic))';
indfree=find(logical(x0lgic));

for G = 1:70
    G
    xx=zeros(length(x0),1);
    xpadd=zeros(1,length(x0));
    for j=1:length(xp)
        xpadd(1,indfree(j))=xp(j);
        xx=~logical(x0lgic).*x0+xpadd;
    end
    % xx2=[xp(1) 0 0 xp(2) pi 0 3579];
    K = jacobiancalc4(xx,mues1e0,[v0 r0]);
    Jaco = K(logical(BCuslgic),logical(x0lgic))
    BCx0 = f4(xx,mues1e0,[v0 r0]);
    BCx0relv = BCx0(logical(BCuslgic));
    residu = -BCus + BCx0relv;
    deltavvec = -(Jaco)\residu'; 
    xp = xp + deltavvec; 
    if G==1
        figure
    end
    [vresult, rresult] = plot_solve4( v0,r0,xx,mues1e0,'Visualizing Iterations' )

    
    if(abs(sum(residu))<1e-4) %Convergence is checked 
    break
    end

end 

for j=1:length(xp)
    xpadd(1,indfree(j))=xp(j);
    xx=~logical(x0lgic).*x0+xpadd;
end
[BCf] = f4(xx,mues1e0,[v0 r0]);

deltaV1=[xx(1) xx(2) xx(3)];
deltaV2= [xx(3) xx(4) xx(5)];
time=xx(7);

figure
[vresult, rresult] = plot_solve4( v0,r0,xx,mues1e0,'Visualizing Final Transfer' )


end

