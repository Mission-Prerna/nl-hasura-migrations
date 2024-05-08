alter table "public"."assessment_visit_results_v2_2024_jan_mar" add column "updated_at" timestamp
 not null default now();
