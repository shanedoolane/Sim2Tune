function [MAP] = createMAPaxis(lowerBound,upperBound,numberOfSites)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if (numberOfSites>24)
    numberOfSites=24;
end

MAP=zeros(1,numberOfSites);

increment=(upperBound-lowerBound)/(numberOfSites-1);
value=lowerBound;

for ii=1:numberOfSites
    MAP(ii)=value;
    value= value+increment;
end

MAP=flip(MAP'); %Make a decreasing vertical array to hold different MAP sites
end

