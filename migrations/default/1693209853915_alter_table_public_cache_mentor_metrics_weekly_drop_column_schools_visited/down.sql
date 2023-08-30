alter table "public"."cache_mentor_metrics_weekly" alter column "schools_visited" set default 0;
alter table "public"."cache_mentor_metrics_weekly" alter column "schools_visited" drop not null;
alter table "public"."cache_mentor_metrics_weekly" add column "schools_visited" int2;
