alter table "public"."assessment_visit_results_v2_2023_oct_dec" add column "updated_at" timestamp
 not null default now();
