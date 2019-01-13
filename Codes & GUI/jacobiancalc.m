function [J] = jacobiancalc(g0,mues1e0,varargin)

%computing at initial guesses 

BCsi = f(g0,mues1e0,varargin{:});  %prop
% the varargin function corresponds to the idea that i can sometimes put constraints and sometimes
%variables guesses GUI should, in this script, provide varargin with the following order [r0x r0y r0z v0x v0y v0z]  
%initialization 




for G = 1:17
[k l] = size(BCsi); 
%Jacobian 
xx = zeros(k,1);
       dx1= (0.1/100)*g0;
       for i = 1:length(g0)
           if g0(i) == 0 
               dx1(i) = 0.1/100;
           end
       end
       dx = dx1;
J = zeros(l,length(g0));
for j = 1:length(g0)
        xx = g0;
        xx(j) = g0(j) + dx(j);
        f1 = f(g0,mues1e0,varargin{:});
        f2 = f(xx,mues1e0,varargin{:});
         J(:,j)=(f2-f1)'/(dx(j));
end
  

end

  