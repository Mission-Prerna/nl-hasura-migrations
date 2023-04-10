alter table "public"."assessment_visit_results_students" alter column "app_version_code" drop not null;
alter table "public"."assessment_visit_results_students" add column "app_version_code" int4;
