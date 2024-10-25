SELECT current_user;

SELECT *
FROM pg_catalog.pg_roles;

SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.table_privileges
LIMIT 5;

CREATE ROLE abc_open_data WITH NOSUPERUSER LOGIN;

CREATE ROLE publishers WITH NOLOGIN;
GRANT publishers TO abc_open_data;

--before a role can SELECT or otherwise interact with a table, the role must be granted USAGE on that table’s schema. Fill in the query below to GRANT USAGE to publishers.
GRANT USAGE ON SCHEMA analytics TO publishers;

-- query that grants publishers the ability to SELECT on all existing tables in analytics.
GRANT SELECT ON ALL TABLES IN SCHEMA analytics TO publishers;

SELECT * 
FROM information_schema.table_privileges
WHERE grantee = 'publishers';

--confirm that abc_open_data has the ability to SELECT on analytics.downloads through inheritance from publishers.
SET ROLE abc_open_data;

SELECT * 
FROM analytics.downloads
LIMIT 5;

SET ROLE ccuser;

SELECT * 
FROM directory.datasets
LIMIT 5;

--Column Level Security

GRANT USAGE ON SCHEMA directory TO publishers;

GRANT SELECT (id, create_date, hosting_path, publisher, src_size)
ON directory.datasets TO publishers;

SET ROLE abc_open_data;

SELECT id, publisher, hosting_path
FROM directory.datasets
LIMIT 5;

SET ROLE ccuser;

--Row Level Security

CREATE POLICY rls_policy ON analytics.downloads FOR SELECT TO publishers USING (owner=current_user);

ALTER TABLE analytics.downloads ENABLE ROW LEVEL SECURITY;

SELECT *
FROM analytics.downloads
LIMIT 5;

SET ROLE abc_open_data;

SELECT *
FROM analytics.downloads
LIMIT 5;
--Resultados muestran solo columnas donde owner es abc_open_data



