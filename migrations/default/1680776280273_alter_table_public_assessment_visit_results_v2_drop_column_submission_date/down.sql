comment on column "public"."assessment_visit_results_v2"."submission_date" is E'V2 for assessment_visit_results table';
alter table "public"."assessment_visit_results_v2" alter column "submission_date" drop not null;
alter table "public"."assessment_visit_results_v2" add column "submission_date" date;
