comment on column "public"."assessment_visit_results_v2"."student_session" is E'V2 for assessment_visit_results table';
alter table "public"."assessment_visit_results_v2" alter column "student_session" drop not null;
alter table "public"."assessment_visit_results_v2" add column "student_session" uuid;
