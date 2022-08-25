#! bin/#!/usr/bin/env bash

# 0.00022727 degree approx= 25 m along great circle
scatterfile=~/Documents/PhD/projects/Agung2017/GBIS_results/INSAR_input/S1_dsc_nov08_data.csv
projfile=~/Documents/PhD/projects/Agung2017/GBIS_results/INSAR_input/S1_dsc_nov08_data_proj.csv

gmt begin
  gmt project $scatterfile -C115.4935/-8.34341 -E115.51768/-8.34341 -h1 -W-0.00022727/0.00022727 > $projfile
gmt end
