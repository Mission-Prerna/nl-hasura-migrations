alter table "public"."cache_mentor_metrics_weekly" alter column "grade_3_assessments" set default 0;
alter table "public"."cache_mentor_metrics_weekly" alter column "grade_3_assessments" drop not null;
alter table "public"."cache_mentor_metrics_weekly" add column "grade_3_assessments" int2;
