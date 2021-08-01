#!/bin/bash


DATA_FOLDER="data"
PLOTS_FOLDER="plots"


if [ ! -d "$DATA_FOLDER" ]
then
  echo "[ERROR] Input folder '$DATA_FOLDER' does not exist!"
  exit 1
fi

mkdir -p $PLOTS_FOLDER
# plot coin evolution over time

DATA_FILES=($(ls $DATA_FOLDER | sed 's/.csv//g'))

if [ ! -z $1 ]
then
  DATA_FILES=($1)
fi

for coin in "${DATA_FILES[@]}"
do
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
	set output '$PLOTS_FOLDER/$coin.png'
	plot '$DATA_FOLDER/$coin.csv' using 1:2 with boxes
EOF
done


