function [TParray] = getTPfromMAP(TPfromMAPfitsCellArray,rpm,MAP)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

TParray=zeros(length(MAP),length(rpm));

for ii=1:length(rpm)
    for jj=1:length(MAP)
        MAPsite=MAP(jj);
        interpEQN=TPfromMAPfitsCellArray{ii};
        TParray(jj,ii)=interpEQN(MAPsite);
    end
end

end

