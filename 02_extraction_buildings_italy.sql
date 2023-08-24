 /* Extraction of a bounding box around Italy */
 CREATE TABLE buildings AS
    SELECT *
    FROM read_parquet('theme=buildings/type=building/*', filename=true, hive_partitioning=1)
    WHERE
        bbox.minx > 6.563099    AND 
        bbox.maxx < 18.578562   AND
        bbox.miny > 35.447866   AND
        bbox.maxy < 47.136744;

 /* column data extrapolation */
CREATE TABLE buildings_italy AS 
SELECT
    id,
    CAST(updatetime as varchar) as updatetime,    
    version,
    CASE
        WHEN array_has(map_keys(names),'common')
        THEN
            list_extract([
                list_extract(x['value'], 1)
                for x in list_extract(names['common'], 1)
                if x['language'] == ['local']
            ], 1)
        ELSE NULL
    END name_common, /* extraction of the common name in local language */
    CASE
        WHEN array_has(map_keys(names),'common')
        THEN
            list_extract([
                list_extract(x['value'], 1)
                for x in list_extract(names['common'], 1)
                if x['language'] == ['it']
            ], 1)
        ELSE NULL
    END name_it, /* extraction of the common name in italian */
    CASE
    WHEN array_has(map_keys(names),'common')
        THEN
            list_extract([
                list_extract(x['value'], 1)
                for x in list_extract(names['common'], 1)
                if x['language'] == ['de']
            ], 1)
        ELSE NULL
    END name_de, /* extraction of the common name in german */
    CASE
    WHEN array_has(map_keys(names),'common')
        THEN
            list_extract([
                list_extract(x['value'], 1)
                for x in list_extract(names['common'], 1)
                if x['language'] == ['fr']
            ], 1)
        ELSE NULL
    END name_fr,  /* extraction of the common name in french */
    CASE
    WHEN array_has(map_keys(names),'common')
        THEN
            list_extract([
                list_extract(x['value'], 1)
                for x in list_extract(names['common'], 1)
                if x['language'] == ['en']
            ], 1)
        ELSE NULL
    END name_en,  /* extraction of the common name in english */
    level,
    height,
    numfloors,
    class,
    /* in the data of the italian area there is only one source */
    sources[1]['dataset'][1] as dataset_source,
    sources[1]['recordId'][1] as recordid_source,
    ST_GeomFromWkb(geometry) AS geometry
FROM buildings;

/* creation of IDs for ISTAT data integration */
ALTER TABLE buildings_italy ADD COLUMN cod_rip BIGINT;
ALTER TABLE buildings_italy ADD COLUMN cod_reg BIGINT;
ALTER TABLE buildings_italy ADD COLUMN cod_prov BIGINT;
ALTER TABLE buildings_italy ADD COLUMN cod_cm BIGINT;
ALTER TABLE buildings_italy ADD COLUMN cod_uts BIGINT;
ALTER TABLE buildings_italy ADD COLUMN pro_com BIGINT;
ALTER TABLE buildings_italy ADD COLUMN pro_com_t VARCHAR;
ALTER TABLE buildings_italy ADD COLUMN comune_a VARCHAR;
ALTER TABLE buildings_italy ADD COLUMN cc_uts BIGINT;
ALTER TABLE buildings_italy ADD COLUMN comune VARCHAR;

/* updating of ISTAT data through spatial relationship 
    this operation needs time */
UPDATE buildings_italy b
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
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 1
) TO 'buildings_piemonte.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 2
) TO 'buildings_valledaosta.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 3
) TO 'buildings_lombardia.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 4
) TO 'buildings_trentinoaltoadige.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 5
) TO 'buildings_veneto.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 6
) TO 'buildings_friuliveneziagiulia.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 7
) TO 'buildings_liguria.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 8
) TO 'buildings_emiliaromagna.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 9
) TO 'buildings_toscana.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 10
) TO 'buildings_umbria.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 11
) TO 'buildings_marche.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 12
) TO 'buildings_lazio.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 13
) TO 'buildings_abruzzo.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 14
) TO 'buildings_molise.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 15
) TO 'buildings_campania.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 16
) TO 'buildings_puglia.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 17
) TO 'buildings_basilicata.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 18
) TO 'buildings_calabria.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 19
) TO 'buildings_sicilia.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');

COPY (
    SELECT * FROM buildings_italy
    WHERE   COD_REG == 20
) TO 'buildings_sardegna.gpkg'
WITH (FORMAT GDAL, DRIVER 'GPKG');