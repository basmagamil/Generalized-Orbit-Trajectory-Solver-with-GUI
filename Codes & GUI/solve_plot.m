
function[vresult, rresult, G, deltaV1, deltaV2, time] = solve_plot(v0,r0,BCus,BCuslgic,x0,x0lgic,mues1e0)
mue=findmue(mues1e0);
% mues1e0=0;
% v0 =[0 7.7 0];
% r0 =[6678 0 0];
% %vmag rmag e i a energy
% BCuslgic = [0 1 1 0 0 0];
% BCus = [9378, 0];
% x0 = [0.2 0 0 0 pi 0 3579]; 
% x0lgic = [1 0 0 1 0 0 0]; 
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
    K = jacobiancalc(xx,mues1e0,[v0 r0]);
    Jaco = K(logical(BCuslgic),logical(x0lgic))
    BCx0 = f(xx,mues1e0,[v0 r0]);
    BCx0relv = BCx0(logical(BCuslgic));
    residu = -BCus + BCx0relv;
    deltavvec = -(Jaco)\residu'; 
    xp = xp + deltavvec; 
    if G==1
        figure
    end
    [vresult, rresult] = plot_solve( v0,r0,xx,mues1e0,'Visualizing Iterations' )

    
    if(abs(sum(residu))<1e-4) %Convergence is checked 
    break
    end

end 

for j=1:length(xp)
    xpadd(1,indfree(j))=xp(j);
    xx=~logical(x0lgic).*x0+xpadd;
end
[BCf] = f(xx,mues1e0,[v0 r0]);

deltaV1=[xx(1) xx(2) xx(3)];
deltaV2= [xx(3) xx(4) xx(5)];
time=xx(7);

figure
[vresult, rresult] = plot_solve( v0,r0,xx,mues1e0,'Visualizing Final Transfer' )


end

