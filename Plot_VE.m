%%
%%% Assign these variables from user input%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
folder='C:\Users\jrroc\Documents\Formula\Murphy Project\Motec Stuff\Maps\Calculation Stuff';
RPMvMAPfile='RPMvMAP';
RPMvVEfile='RPMvVE';
upperBound=100;
lowerBound=20;
numberOfSites=17; %max 24


%%
%Extract data from Excel Spreadsheet containing formatted Ricardo Wave
%Data.
%   x: decreasing horizontal RPM vector from 15000 to 500 in 500RPM
%       increments (values can vary depending on Ricardo Wave sims)
%
%   y: decreasing vertical TP vector frpm 90 to 0 in 4.5 degree increments
%   (values can vary depending on Rocardo Wave sims)
%   
%   z: 2D array of MAP/VE data (depends on which of two tables is used)


[xMAP,yMAP,zMAP]=ricardo2array(folder,RPMvMAPfile);
[xVE,yVE,zVE]=ricardo2array(folder,RPMvVEfile);

%%
%Creates a cell array containing an interpolation equation for each RPM
TPfromMAPfits=getFitArray(xMAP,yMAP,zMAP,1,1);
RPMindex=12;
h=MAPvRPMfits{RPMindex};
plot(h,zMAP(:,RPMindex),yMAP,'g');
xlabel('MAP [KPa]');
ylabel('TP [deg]');
title(num2str(xMAP(RPMindex)))

VEfromTPfits=getFitArray(xVE,yVE,zVE,2,1);
% g=VEfromTPfits{1};
% plot(g,yVE,zVE(:,1),'g');


%%
%Generate decreasing vertical vector of MAP values(y axis of VE table,allows customizable MAP axis)
%Generate decreasing horizontal vector of RPM from existing RPM vector
% These will be used as the X and Y axis for the Master VE Table

MAPaxis=createMAPaxis(lowerBound,upperBound,numberOfSites);
RPMaxis=xMAP;

%%
%Create a function using these two lines that applies fit eqns
TPfromMAP=getTPfromMAP(TPfromMAPfits,RPMaxis,MAPaxis);

%%
%Smooth TPfromMAP to reflect only physical values. Minimum and Maximum throttle
%positions possible are 0 and 90 degrees




%%
%Generate VE table as a function of RPMaxis and MAPaxis
VEfromTP=getVEfromTP(VEfromTPfits,TPfromMAP,RPMaxis,MAPaxis);


