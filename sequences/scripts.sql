-----------------------------------------------
-- RELATED WITH SEQUENCES
-----------------------------------------------

-- create + functions
create sequence my_sequence start 100;
select nextval('my_sequence');
select currval('my_sequence');
select setval('my_sequence', 200, true);

-- To list all sequences information
SELECT *
FROM information_schema.sequences
ORDER BY sequence_schema;

-- Display all the information about an specific sequence
SELECT *
FROM your_schema_name.your_sequence_name;

-- To list sequences comments
SELECT c.relname                                     AS "sequence_name",
       CASE WHEN c.relkind = 'S' THEN 'sequence' END AS "type",
       pg_get_userbyid(c.relowner)                   AS "owner",
       t.spcname                                     AS tspace,
       n.nspname                                     AS "schemaname",
       d.description                                 AS "comment"
FROM pg_class AS c
         LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
         LEFT JOIN pg_tablespace t ON t.oid = c.reltablespace
         LEFT JOIN pg_description AS d ON (d.objoid = c.oid
    AND d.objsubid = 0)
WHERE c.relkind IN ('S')
  AND d.description > ''
ORDER BY n.nspname, c.relname;

/* 
Note: depENDing of the value of "pg_class.relkind", you could query different objects: 
  r = ordinary table, 
  i = index, 
  S = sequence, 
  v = view, 
  m = materialized view, 
  c = composite type, 
  t = TOAST table, 
  f = foreign table
- More information in: 
  https://www.postgresql.org/docs/9.3/static/catalog-pg-class.html
*/

-- todo НАЙТИ ПОСЛЕДОВАТЕЛЬНОСТИ, КОТОРЫЕ МЕНЬШЕ, ЧЕМ ПОСЛЕДНЕЕ ЗНАЧЕНИЕ В КОЛОНКЕ
