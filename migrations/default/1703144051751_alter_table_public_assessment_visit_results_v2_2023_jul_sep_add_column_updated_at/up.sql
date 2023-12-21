alter table "public"."assessment_visit_results_v2_2023_jul_sep" add column "updated_at" timestamp
 not null default now();
