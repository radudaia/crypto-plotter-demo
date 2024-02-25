PYTHON=/usr/bin/env python3
BASH=/usr/bin/env bash
DATA_DIR=data
PLOT_DIR=plot

all: data plot

data:
	$(PYTHON) main.py

plot: data
	$(BASH) plotter.sh

.PHONY: clean
clean:
	rm -rf $(DATA_DIR) $(PLOT_DIR)
