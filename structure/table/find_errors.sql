-- Кол-во залипших строк в SYNC / CRON
SELECT schemaname,
       relname as tablename,
       n_live_tup
FROM pg_stat_user_TABLEs
WHERE schemaname IN ('sync', 'cron')
  AND n_live_tup > 0
  AND relname != 'lastsyncdata'
ORDER BY schemaname, relname;
