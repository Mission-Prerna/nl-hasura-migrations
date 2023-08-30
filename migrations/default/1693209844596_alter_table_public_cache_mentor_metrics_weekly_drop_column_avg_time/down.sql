alter table "public"."cache_mentor_metrics_weekly" alter column "avg_time" set default 0;
alter table "public"."cache_mentor_metrics_weekly" alter column "avg_time" drop not null;
alter table "public"."cache_mentor_metrics_weekly" add column "avg_time" int2;
