comment on column "public"."assessment_visit_results_v2"."total_time_taken" is E'V2 for assessment_visit_results table';
alter table "public"."assessment_visit_results_v2" alter column "total_time_taken" set default 0;
alter table "public"."assessment_visit_results_v2" alter column "total_time_taken" drop not null;
alter table "public"."assessment_visit_results_v2" add column "total_time_taken" int4;
