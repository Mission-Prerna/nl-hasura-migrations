alter table "public"."assessment_visit_results_students_2023_jul_sep" add column "created_at" timestamptz
 not null default now();
