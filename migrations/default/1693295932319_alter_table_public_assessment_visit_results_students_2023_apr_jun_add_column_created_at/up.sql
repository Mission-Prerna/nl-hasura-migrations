alter table "public"."assessment_visit_results_students_2023_apr_jun" add column "created_at" timestamptz
 not null default now();
