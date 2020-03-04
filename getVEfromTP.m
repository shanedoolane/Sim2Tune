function [VEarray] = getVEfromTP(VEfromTPfitsCellArray,TPfromMAParray,rpm,MAP)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

VEarray=zeros(length(MAP),length(rpm));

for ii=1:length(rpm)
    for jj=1:length(MAP)
        TPinput=TPfromMAParray(jj,ii);
        interpEQN=VEfromTPfitsCellArray{ii};
        VEarray(jj,ii)=interpEQN(TPinput);
    end
end

end

