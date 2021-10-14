include secrets.mk

components.geojson : components.csv | elections.db
	csvs-to-sqlite $< $|
	ogr2ogr -f GeoJSON $@ $| -sql 'select * from `2019_precincts` inner join components using (ward, precinct)' -dialect sqlite	

components.csv : elections.csv
	cat $< | python scripts/pca.py > $@

elections.csv : elections.db
	sqlite3 -header -csv $< < scripts/hstack.sql > $@

elections.db : 2019_precincts.geojson municipal_general_2015.csv municipal_general_2019.csv
	ogr2ogr -f SQLite -dsco SPATIALITE=YES -t_srs "EPSG:4326" $@ $(word 1,$^) -nlt PROMOTE_TO_MULTI
	csvs-to-sqlite $(filter %.csv,$^) $@

%_precincts.geojson : chicago_municipal_elections.zip
	unzip -p $< chicago-municipal-elections-master/precincts/$@ > $@

municipal_general_%.csv : chicago_municipal_elections.zip
	unzip -p $< chicago-municipal-elections-master/data/$@ > $@

chicago_pl.geojson :
	python scripts/chicago_pl.py > $@

chicago_municipal_elections.zip :
	wget -O $@ "https://github.com/datamade/chicago-municipal-elections/archive/refs/heads/master.zip"
