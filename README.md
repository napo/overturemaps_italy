# overturemaps italy
On this page you will find the links to the data extraction of the first release of OvertureMaps Foundation and all the scripts needed to replicate the operation.<br/>
The data version is [Release Overture 2023-07-26-alpha.0](https://overturemaps.org/download/).<br/>
The license for buildings is ODbL, while for places it is CDLA-Permissive 2.0.<br/>
The data is enriched with ISTAT ids and released in geopackage format.<br/>
In this repository there is also the dataset of the non-generalized Italian municipal borders at 2023 of ISTAT (CC-BY license) in geoparquet format.

### prerequisites
just duckdb
## data download
note: the coordinate reference system is EPSG:4326
### places
1. [Abruzzo](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_abruzzo.gpkg) 16Mb
2. [Basilicata](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_basilicata.gpkg) 5.9Mb
3. [Calabria](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_calabria.gpkg) 19.8Mb
4. [Campania](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_campania.gpkg) 61.3Mb
5. [Emilia-Romagna](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_emiliaromagna.gpkg) 53.5Mb
6. [Friuli Venezia-Giulia](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_friuliveneziagiulia.gpkg) 13.8Mb
7. [Lazio](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_lazio.gpkg) 66.2Mb
8. [Liguria](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_liguria.gpkg) 20.1Mb
9. [Lombardia](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_lombardia.gpkg) 96.9Mb
10. [Marche](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_marche.gpkg) 20.2Mb
11. [Molise](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_molise.gpkg) 3.2Mb
12. [Piemonte](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_piemonte.gpkg) 46.2Mb
13. [Puglia](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_puglia.gpkg) 44.9Mb
14. [Sardegna](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_sardegna.gpkg) 19.9Mb
15. [Sicilia](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_sicilia.gpkg) 53.4Mb
16. [Toscana](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_toscana.gpkg) 51.3Mb
17. [Trentino Alto Adige](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_trentinoaltoadige.gpkg) 15.7Mb
18. [Umbria](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_umbria.gpkg) 11.5Mb
19. [Valle d'Aosta](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_valledaosta.gpkg) 2.3Mb
20. [Veneto](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/places_veneto.gpkg) 55.8Mb

### buildings
1. [Abruzzo](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_abruzzo.gpkg) 66.1Mb
2. [Basilicata](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_basilicata.gpkg) 49.9Mb
3. [Calabria](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_calabria.gpkg) 96.4Mb
4. [Campania](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_campania.gpkg) 197.3Mb
5. [Emilia-Romagna](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_emiliaromagna.gpkg) 509.0Mb
6. [Friuli Venezia-Giulia](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_friuliveneziagiulia.gpkg) 248.5Mb
7. [Lazio](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_lazio.gpkg) 290.6Mb
8. [Liguria](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_liguria.gpkg) 200.3Mb
9. [Lombardia](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_lombardia.gpkg) 640.9Mb
10. [Marche](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_marche.gpkg) 94.8Mb
11. [Molise](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_molise.gpkg) 20.4Mb
12. [Piemonte](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_piemonte.gpkg) 473.8Mb
13. [Puglia](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_puglia.gpkg) 662.0Mb
14. [Sardegna](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_sardegna.gpkg) 235.5Mb
15. [Sicilia](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_sicilia.gpkg) 347.0Mb
16. [Toscana](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_toscana.gpkg) 512.0Mb
17. [Trentino Alto Adige](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_trentinoaltoadige.gpkg) 125.1Mb
18. [Umbria](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_umbria.gpkg) 46.7Mb
19. [Valle d'Aosta](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_valledaosta.gpkg) 24.9Mb
20. [Veneto](https://s3.eu-central-1.amazonaws.com/overturemaps.italy/buildings_veneto.gpkg) 925.7Mb

## process
### prepare the data
Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and download the data<br/>
If you want download all
```
aws s3 cp --region us-west-2 --no-sign-request --recursive s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/ <DESTINATION>
```
To download single themes:
- admins<br/> *s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/theme=admins*
- buildings<br/> *s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/theme=buildings*
- places<br/>*s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/theme=places*
- transportation<br/>*s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/theme=transportation*

### process description
all data is incorporated into a duckdb file on which the following SQL operations are then performed
- extraction from the downloaded parquet files into a duckdb table taking into account the bounding box of Italy with a buffer of 5km
- from the created table, a new table is created with a selection of columns so that each contains only one value. E.g. for names you choose the languages of Italian, English, German and French
- the table is enriched with new columns corresponding to ISTAT codes through a spatial relationship with the geometries of Italian municipalities
- based on these attributes, data are extracted at the level of each Italian region

### execution
#### prepare data
bash script
```bash
duckdb omf_italy -c ".read 00_prepare_tables_istat.sql"
```
#### create geopackages of the places for earch region of Italy
bash script
```bash
duckdb omf_italy -c ".read 01_extraction_places_italy.sql"
```
#### create geopackages of the buildings for earch region of Italy
```bash
duckdb omf_italy -c ".read 02_extraction_buildings_italy.sql"
```

#### assign the SRS to each file
bash script
```bash
for i in `ls *.gpkg`;
  do
    name=`basename $i .gpkg`;
    tmpname=`echo $name`_tmp.gpkg;
    echo "assign WGS84 to $i";
    ogr2ogr -a_srs EPSG:4326 -f "GPKG" $tmpname $i;
    mv $tmpname $i;
    echo "done!";
done
```

#### creation of geoparquet files
bash script
```bash
wget https://github.com/planetlabs/gpq/releases/download/v0.11.0/gpq-linux-amd64.tar.gz
tar xfvz gpq-linux-amd64.tar.gz 
chmod 755 gpq
regions="abruzzo basilicata calabria campania emiliaromagna friuliveneziagiulia lazio liguria lombardia marche molise piemonte puglia sardegna sicilia toscana trentinoaltoadige umbria valledaosta veneto"
url="https://s3.eu-central-1.amazonaws.com/overturemaps.italy/"
placeslbl="places_"
gpkglbl=".gpkg"
parquetlbl=".parquet"
buildingslbl="buildings"
for r in $regions 
do
	d="$url$placeslbl$r$gpkglbl"
	wget $d
	duckdb -c "load spatial;CREATE TABLE $placeslbl$r as select * from st_read('$placeslbl$r$gpkglbl', layer='$placeslbl$r');ALTER TABLE $placeslbl$r  RENAME geom TO geometry;COPY  (SELECT * FROM $placeslbl$r ) TO 'tmp.parquet' (FORMAT PARQUET, CODEC 'ZSTD');"
	rm $placeslbl$r$gpkglbl
	./gpq convert tmp.parquet $placeslbl$r$parquetlbl
	rm tmp.parquet
done;
for r in $regions 
do
	d="$url$buildingslbl$r$gpkglbl"
	wget $d
	duckdb -c "load spatial;CREATE TABLE $buildingslbl$r as select * from st_read('$buildingslbl$r$gpkglbl', layer='$r');ALTER TABLE $buildingslbl$r  RENAME geom TO geometry;COPY  (SELECT * FROM $buildingslbl$r ) TO 'tmp.parquet' (FORMAT PARQUET, CODEC 'ZSTD');"
	rm $placeslbl$r$gpkglbl
	./gpq convert tmp.parquet $buildingslbl$r$parquetlbl
	rm tmp.parquet
done;
```
