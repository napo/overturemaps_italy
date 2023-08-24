 /* Extraction of a bounding box around Italy */
 CREATE TABLE places AS
    SELECT *
    FROM read_parquet('theme=places/type=*/*', filename=true, hive_partitioning=1)
    WHERE
        bbox.minx > 6.563099    AND 
        bbox.maxx < 18.578562   AND
        bbox.miny > 35.447866   AND
        bbox.maxy < 47.136744;

 /* column data extrapolation */
CREATE TABLE places_italy AS
SELECT
    id,
    CAST(updatetime AS VARCHAR) AS updatetime,    
    version,
    confidence,
    CASE 
        WHEN array_has(map_keys(names),'common')
        THEN
            list_extract([
                list_extract(x['value'], 1)
                for x in list_extract(names['common'], 1)
                if x['language'] == ['local']
            ], 1)
        ELSE NULL
    END as name,
    /* the name array contains a map with several keys. 
        The one always present is "common" from which we 
        extract the name for language "local" */
    categories['main'] as main_category,
    /* on the Italian territory there are at most two alternatives */ 
    categories['alternate'][1] as other_category, 
    categories['alternate'][2] as another_category,
    /* on the Italian territory there is only one data  */ 
    websites[1] as website,
    socials[1] as social,
    emails[1] as email,
    phones[1] as phone,
    brand.names['brand_names_common'][1][1]['value'][1] as brand,
    addresses[1]['postcode'][1] as postcode,
    addresses[1]['freeform'][1] as freeform,
    addresses[1]['locality'][1] as locality,
    addresses[1]['region'][1] as region,
    addresses[1]['country'][1] as country,
    /* the sources can be several, we consider only the first two  */ 
    sources[1]['dataset'][1] as main_source,
    sources[1]['recordid'][1] as main_source_id,
    sources[2]['dataset'][1] as other_source,
    sources[2]['recordid'][1] as other_source_id,
    ST_GeomFromWkb(geometry) AS geometry
    FROM places_italy;

/* creation of IDs for ISTAT data integration */
ALTER TABLE places_italy ADD COLUMN cod_rip BIGINT;
ALTER TABLE places_italy ADD COLUMN cod_reg BIGINT;
ALTER TABLE places_italy ADD COLUMN cod_prov BIGINT;
ALTER TABLE places_italy ADD COLUMN cod_cm BIGINT;
ALTER TABLE places_italy ADD COLUMN cod_uts BIGINT;
ALTER TABLE places_italy ADD COLUMN pro_com BIGINT;
ALTER TABLE places_italy ADD COLUMN pro_com_t VARCHAR;
ALTER TABLE places_italy ADD COLUMN comune_a VARCHAR;
ALTER TABLE places_italy ADD COLUMN cc_uts BIGINT;
ALTER TABLE places_italy ADD COLUMN comune VARCHAR;

/* updating of ISTAT data through spatial relationship 
    this operation needs time */
UPDATE places_italy b
SET
    cod_rip = m.COD_RIP,
    cod_reg = m.COD_REG,
    cod_prov = m.COD_PROV,
    cod_cm = m.COD_CM,
    cod_uts = m.COD_UTS,
    pro_com = m.PRO_COM,
    pro_com_t = m.PRO_COM_T,
    comune_a = m.COMUNE_A,
    cc_uts = m.CC_UTS,
    comune = m.COMUNE
FROM municipalities m
WHERE  ST_Within(b.geometry,ST_GeomFromWKB(m.wkb_geometry));

/* geopackage conversion  for each italian regione */
COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 1
) TO 'places_piemonte.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 2
) TO 'places_valledaosta.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 3
) TO 'places_lombardia.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 4
) TO 'places_trentinoaltoadige.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 5
) TO 'places_veneto.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 6
) TO 'places_friuliveneziagiulia.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 7
) TO 'places_liguria.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 8
) TO 'places_emiliaromagna.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 9
) TO 'places_toscana.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 10
) TO 'places_umbria.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 11
) TO 'places_marche.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 12
) TO 'places_lazio.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 13
) TO 'places_abruzzo.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 14
) TO 'places_molise.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 15
) TO 'places_campania.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 16
) TO 'places_puglia.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 17
) TO 'places_basilicata.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 18
) TO 'places_calabria.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 19
) TO 'places_sicilia.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM places_italy
    WHERE   COD_REG == 20
) TO 'places_sardegna.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');