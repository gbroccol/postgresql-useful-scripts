-----------------------------------------------
-- RELATED WITH DATABASES
-----------------------------------------------

-- To list database's names
select datname       as database_name,
       datistemplate as is_template,
       datallowconn  as is_new_connection_allowed -- false -> no new connections to that database will be allowed (but existing sessions are not terminated simply by setting the flag false).
                                                    -- The template0 database is normally marked datallowconn = false to prevent its modification.
from pg_database;

-- To create database as a template (создание базы данных-шаблона)
create database my_template is_template = true;

-- To create database using template (создание базы из шаблона)
create database pr_temp template = my_template;