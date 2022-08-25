%{
make shapefile for plotting in QGIS
attributes
shape type: multipoint
X = lon
Y = lat
value = disp rate
%}
clear all; close all; fclose all; clc

% load('ps_plot_v-do.mat')
% load ps_plot_u-dmo_r20170403.mat
load CSK_dsc_nov21_u_dmo.mat
% load('ps2.mat')
lambda = 0.031;

% disp_CSK_dsc_201711109 = (-double(ph_disp(:,end-1)).*lambda)./(4*pi());
% % for i = 1:length(ph_disp)
% for i = 1:length(disp_CSK_dsc_201711109)
% Data(i).Geometry = 'MultiPoint' ;
% % Data(i).BoundingBox = [lonlat(i,1), lonlat(i,2); lonlat(i,1), lonlat(i,2)];
% Data(i).X = lonlat(i,1)  ;  % latitude
% Data(i).Y = lonlat(i,2) ;  % longitude
% Data(i).value = double(disp_CSK_dsc_201711109(i));   % displacement rate
% end


for i = 1:length(Phase)
Data(i).Geometry = 'MultiPoint' ;
% Data(i).BoundingBox = [lonlat(i,1), lonlat(i,2); lonlat(i,1), lonlat(i,2)];
% Data(i).X = double(ll(i,1))  ;  % longitude
% Data(i).Y = double(ll(i,2)) ;  % latitude
% Data(i).LOS_disp = double(modLos(1,i));
Data(i).X = Lon(i) ;  % longitude
Data(i).Y = Lat(i) ;  % latitude
Data(i).LOS_disp = (-double(Phase(i)).*lambda)./(4*pi());   % displacement = -(Phase*lambda)/(4*pi)
end

shapewrite(Data, 'CSK_dsc_nov21_data.shp')
p = shaperead('CSK_dsc_nov21_data.shp')