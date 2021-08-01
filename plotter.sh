#!/bin/bash


DATA_FOLDER="data"
PLOTS_FOLDER="plots"

mkdir -p $PLOTS_FOLDER
# plot coin evolution over time
gnuplot <<- EOF
	set datafile separator ','
	set autoscale
	set xdata time
	set timefmt "%Y-%m-%dT%H:%M:%SZ"
	set title 'Evolutia $1 in timp'
	set xtics timedate
	set xtics format "%b/%y"
  set xtics rotate
	set xlabel 'time'
	set ylabel 'USD($)'
	set term png
	set output '$PLOTS_FOLDER/$1.png'
	plot '$DATA_FOLDER/$1.csv' using 1:2 with boxes
EOF
