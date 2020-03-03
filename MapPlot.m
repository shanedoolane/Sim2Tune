function [] = MapPlot(M,title,xaxis,yaxis,zaxis,figurenum)
%MapPot creates a 3 dimensional surface plot used commonly in engine
%tuning. The input arguments allow for rapid plotting.

%Inputs:         M - Array containing raw data for X, Y,& Z axes in form
%                    [x,y,z]
%                Z - String for title
%            xaxis - string for lab and unit for x axis
%            yaxis - string for label and unit for y axis
%            zaxis - string for label and unit for z axis
%        figurenum - figure number to plot map to.

if isempty(figurenum) 
    figurenum=1;
end
if isempty(title) 
    title='Untitled Surface';
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
surf(M,Y,Z); %create surface plot from M
colorbar;   %initiate colorbar
colormap(jet); %set colormap
xlabel(xaxis);
ylabel(yaxis);
zlabel(zaxis);
Title(title);
end

