%{
S1 asc. stamps volume change pre-processing
Author: Mark Bemelmans
created on: September 24, 2021
%}

clear all; close all; clc;

%% load data
load ps_plot_u-dmo.mat

load ps2 
load parms
%% set processing parameters
%{
take mean of signal over no-deformation period of time series and compare
each consequtive date to this mean of the procursory 'stable' period.
%}
no_def_cutoff_date = datenum(2017,8,1); % all acquisitions before Aug. 1,2017 were definitely no-def signal
sel_pre = day<no_def_cutoff_date;

pre_def_mean = mean(ph_disp(:,sel_pre),2); % take pre def. mean

n_dates = sum(sel_pre==0);
days_def = day(~sel_pre);
Lon = lonlat(:,1);
Lat = lonlat(:,2);
Inc = repmat(rad2deg(mean_incidence),size(Lon));
Heading = repmat(heading,size(Lon));
for day_idx = 1:n_dates
    def_ts(day_idx).day = days_def(day_idx);
    ph_idx = find(day==def_ts(day_idx).day);
    def_ts(day_idx).def = ph_disp(:,ph_idx)-pre_def_mean;
    savename = "S1_asc_full_" + datestr(def_ts(day_idx).day) + ".mat";
    Phase = def_ts(day_idx).def;
    save(savename,'Lon','Lat','Inc','Heading','Phase')
    clear Phase savename
end
