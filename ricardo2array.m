function [x,y,z] = ricardo2array(filedir,filename)
% takes a spreadsheet composed of ricardo wave data and outputs x,y,z
%Extract data from Excel Spreadsheet containing formatted Ricardo Wave
%Data.
%   x: decreasing horizontal RPM vector from 15000 to 500 in 500RPM
%       increments (values can vary depending on Ricardo Wave sims)
%
%   y: decreasing vertical TP vector frpm 90 to 0 in 4.5 degree increments
%   (values can vary depending on Rocardo Wave sims)
%   
%   z: 2D array of MAP/VE data as a function of TP(Y-axis) and RPM(X-axis)
%   (depends on which of two tables is used)

fileloc=strcat(filedir,'\',filename,'.xlsx');
T=readtable(fileloc,'ReadVariableNames',false);
ricardoOutput=table2array(T(2:end,2:end));
throttlePosition=table2array(T(1,2:end));
rpm=table2array(T(2:end,1));

x=zeros(length(rpm));
for ii=1:length(x)
    x(ii)=str2double(rpm(ii)); 
end
x=x(:,1);            
y=throttlePosition;  
z=100*(ricardoOutput); 

x=x';   %make x a decreasing horizontal rpm vector
y=y';   %make y a decreasing vertical vector
z=z';   %Invert to obtain RPM on X-axis, Tp on Y-axis then convert from bar to KPa
end

