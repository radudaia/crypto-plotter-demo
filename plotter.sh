#!/bin/bash


# plot coin evolution over time
gnuplot <<- EOF
	set datafile separator ','
	set autoscale
	set title 'Evolutia $1 in timp'
	set xlabel 'time'
	set ylabel 'USD'
	set term png
	set output '$1.png'
	plot '$1.csv' with linespoints
EOF
