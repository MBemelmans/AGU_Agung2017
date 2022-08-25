% Make baseline pair file

clear all; close all; clc

set(0, 'DefaultLineLineWidth', 2);
set(0, 'DefaultTextFontSize',18);
set(0, 'DefaultAxesFontSize',18);

%% load pair .csv file

pair_table = readtable('asf-sbas-pairs.csv');

%% write .txt file

string1 = pair_table.Var6;
string2 = pair_table.Var24;

string1 = datestr(string1,'yyyymmdd');
string2 = datestr(string2,'yyyymmdd');


fileID = fopen('dsc_base_prep.txt','w');
count = 0
for base_id = 1:size(string1,1)
     count = count + 1;
        if count <10
            fprintf(fileID,'ref_ORBIT00%d    %s\n',count,string1(base_id,:));
            fprintf(fileID,'int_ORBIT00%d    %s\n',count,string2(base_id,:));
        elseif (count <100 && count >9)
            fprintf(fileID,'ref_ORBIT0%d    %s\n',count,string1(base_id,:));
            fprintf(fileID,'int_ORBIT0%d    %s\n',count,string2(base_id,:));
        elseif (count <1000 && count >99)
            fprintf(fileID,'ref_ORBIT%d    %s\n',count,string1(base_id,:));
            fprintf(fileID,'int_ORBIT%d    %s\n',count,string2(base_id,:));
        end
end

fclose(fileID);