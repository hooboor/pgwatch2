select
  (extract(epoch from now()) * 1e9)::int8 as epoch_ns,
  coalesce(sum(calls), 0) as calls,
  coalesce(sum(total_time), 0) as total_time
from
  pg_stat_statements
where
  dbid = (select oid from pg_database where datname = current_database())
  and calls > 10
;
