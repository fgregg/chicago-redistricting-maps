include secrets.mk

chicago_pl.geojson :
	python scripts/chicago_pl.py > $@
