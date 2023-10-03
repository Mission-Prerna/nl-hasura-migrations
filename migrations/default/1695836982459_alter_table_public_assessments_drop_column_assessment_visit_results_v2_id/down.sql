alter table "public"."assessments" alter column "assessment_visit_results_v2_id" drop not null;
alter table "public"."assessments" add column "assessment_visit_results_v2_id" int8;
