function [fitCellArray] = getFitArray(rpm,tp,ricardoData,ricardoDataType,fitTypeParam)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


fitCellArray=cell(1,length(rpm));    %initialize fitCellArray

if (fitTypeParam==1)
    fitType='pchip';
elseif (fitTypeParam==2)
    fitType='linearinterp';
elseif (fitTypeParam==3)
    fitType='cubicinterp';
else
    fitType='linearinterp';             %if wrong parameter entered, default to linear interp
end

for ii=1:length(rpm)
    if (ricardoDataType==1)
        fitCellArray{ii}=fit(ricardoData(:,ii),tp,fitType);
    elseif (ricardoDataType==2)
        fitCellArray{ii}=fit(tp,ricardoData(:,ii),fitType);
    end
end

end

