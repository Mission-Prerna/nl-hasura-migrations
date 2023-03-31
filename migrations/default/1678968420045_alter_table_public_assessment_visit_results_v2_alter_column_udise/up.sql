ALTER TABLE "public"."assessment_visit_results_v2" ALTER COLUMN "udise" drop default;
alter table "public"."assessment_visit_results_v2" alter column "udise" drop not null;
