function [x,y,z] = ricardo2array(fileloc)
% takes a spreadsheet composed of ricardo wave data and outputs x,y,z

T=readtable(FileLoc,'ReadVariableNames',false);
z=table2array(T(2:end,2:end));
x=table2array(T(1,2:end));
y=table2array(T(2:end,1));
end

