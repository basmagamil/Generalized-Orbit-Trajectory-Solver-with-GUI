function [Vdi] = trans(Ro,Vo,dVi,phi_i,psi)

        Roti = [cos(phi_i)     sin(phi_i)       0    ;
              -sin(phi_i)     cos(phi_i)       0    ;
               0               0           1    ] * ...
              [cos(psi)        0       -sin(psi);
               0               1               0;
               sin(psi)        0        cos(psi)];

        dvi  = Roti*[dVi;0;0];
        
   
        Ho  = cross(Ro,Vo); wo = Ho/norm(Ho);    vo = Vo/norm(Vo);    uo = cross(wo,vo);
        
        DVi  =[vo' uo' wo']*dvi;
        
  
        
        Vdi  = Vo + DVi';