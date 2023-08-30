alter table "public"."cache_mentor_metrics_weekly" alter column "grade_1_assessments" set default 0;
alter table "public"."cache_mentor_metrics_weekly" alter column "grade_1_assessments" drop not null;
alter table "public"."cache_mentor_metrics_weekly" add column "grade_1_assessments" int2;
