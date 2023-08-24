# overturemaps italy
## prepare the data
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

## process description
all data is incorporated into a duckdb file on which the following SQL operations are then performed
- extraction from the downloaded parquet files into a duckdb table taking into account the bounding box of Italy with a buffer of 5km
- from the created table, a new table is created with a selection of columns so that each contains only one value. E.g. for names you choose the languages of Italian, English, German and French
- the table is enriched with new columns corresponding to ISTAT codes through a spatial relationship with the geometries of Italian municipalities
- based on these attributes, data are extracted at the level of each Italian region

## execution
### prepare data
```bash
duckdb omf_italy -c ".read 00_prepare_tables_istat.sql"
```
### create geopackages of the places for earch region of Italy
```bash
duckdb omf_italy -c ".read 01_extraction_places_italy.sql"
```
### create geopackages of the buildings for earch region of Italy
```bash
duckdb omf_italy -c ".read 02_extraction_buildings_italy.sql"
```


