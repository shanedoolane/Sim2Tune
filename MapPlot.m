function [] = MapPlot(X,Y,M,titled,xaxis,yaxis,zaxis,figurenum)
%MapPot creates a 3 dimensional surface plot used commonly in engine
%tuning. The input arguments allow for rapid plotting.

%Inputs:         M - Array containing raw data for Z axiss in form
%                    [x,y,z]
%                X - X vector
%                Y - Y vector
%            titled - String for titled
%            xaxis - string for lab and unit for x axis
%            yaxis - string for label and unit for y axis
%            zaxis - string for label and unit for z axis
%        figurenum - figure number to plot map to.

% commonly called using: MapPlot(X,Y,Z,'Map','Engine Speed [RPM]','MAP [kPa]','VE [%]',1)

if isempty(figurenum) 
    figurenum=1;
end
if isempty(titled) 
    titled='Untitledd Surface';
end
if isempty(xaxis) 
    xaxis='Unlabeled Axis';
end
if isempty(yaxis) 
    yaxis='Unlabeled Axis';
end
if isempty(zaxis) 
    zaxis='Unlabeled Surface';
end
figure(figurenum)
clf
surf(X,Y,M); %create surface plot from M
colorbar;   %initiate colorbar
colormap(flipud(parula)); %set colormap
xlabel(xaxis);
ylabel(yaxis);
zlabel(zaxis);
title(titled);
end

