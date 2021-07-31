#!/bin/bash


DATA_FOLDER="data"
PLOTS_FOLDER="plots"

mkdir -p $PLOTS_FOLDER
# plot coin evolution over time
gnuplot <<- EOF
	set datafile separator ','
	set autoscale
	set grid
	set title 'Evolutia $1 in timp'
	set xlabel 'time'
	set ylabel 'USD'
	set term png
	set output '$PLOTS_FOLDER/$1.png'
	plot '$DATA_FOLDER/$1.csv' with linespoints
EOF
