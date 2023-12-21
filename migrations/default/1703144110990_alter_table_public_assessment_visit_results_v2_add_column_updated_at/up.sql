alter table "public"."assessment_visit_results_v2" add column "updated_at" timestamp
 not null default now();
