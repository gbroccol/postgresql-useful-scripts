-----------------------------------------------
-- RELATED WITH TABLES
-----------------------------------------------

-- To list all the table names of an schema
SELECT schemaname,
       tablename
FROM pg_tables
WHERE schemaname = 'public';

-- To list all the table of your database with their primary keys
SELECT tc.table_schema,
       tc.table_name,
       kc.column_name
FROM information_schema.table_constraints tc,
     information_schema.key_column_usage kc
WHERE tc.constraint_type = 'PRIMARY KEY'
  AND kc.table_name = tc.table_name
  AND kc.table_schema = tc.table_schema
  AND kc.constraint_name = tc.constraint_name
ORDER BY 1, 2;

-- To list all the table indexes
SELECT *
FROM pg_indexes
WHERE schemaname != 'pg_catalog'
ORDER BY schemaname,
         tablename;
