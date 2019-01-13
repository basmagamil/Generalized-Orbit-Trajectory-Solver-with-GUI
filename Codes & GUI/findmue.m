function [ mue ] = findmue( input )
% input 1 = sun ; input 0 = earth
%   Detailed explanation goes here
if input==1 %%sun
    mue=1.327e11; 
elseif input==0  %%earth
    mue = 398600;
end

end

