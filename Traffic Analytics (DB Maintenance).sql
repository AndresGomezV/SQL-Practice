-- Tamaño de la tabla
SELECT
    pg_size_pretty(pg_table_size('sensors.observations')) AS table_size;

--Indexes en la tabla
SELECT *
FROM pg_Indexes
WHERE tablename = 'observations';

--Tamaño de los indexes
SELECT 
  pg_size_pretty(pg_indexes_size('sensors.observations')) AS idxs_size;

--Tamaño de cada index
SELECT
  pg_size_pretty(pg_total_relation_size('sensors.observations_pkey')) AS idx_1_size;

SELECT
  pg_size_pretty(pg_total_relation_size('sensors.observations_location_id_datetime_idx')) AS idx_2_size;

--Total sizes
SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;

--Column names
SELECT column_name 
FROM information_schema.columns 
WHERE table_name = 'observations';

UPDATE sensors.observations
SET distance = distance * 3.821
WHERE true;


SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;

--Vacuum regular before insert data
VACUUM sensors.observations;

SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size;

-- Insert 1000 rows of data
\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './additional_obs_types.csv' WITH DELIMITER ',' CSV HEADER;

SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size;

--Delete dead tuples and removes any excess space
VACUUM FULL sensors.observations;

SELECT  
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size;

DELETE FROM sensors.observations
WHERE location_id > 24;

SELECT 
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;

TRUNCATE sensors.observations;

\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './original_obs_types.csv' WITH DELIMITER ',' CSV HEADER;

\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './additional_obs_types.csv' WITH DELIMITER ',' CSV HEADER;

SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;