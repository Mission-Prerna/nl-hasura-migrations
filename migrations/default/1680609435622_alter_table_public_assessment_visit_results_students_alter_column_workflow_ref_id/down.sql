alter table "public"."assessment_visit_results_students" alter column "workflow_ref_id" drop not null;
ALTER TABLE "public"."assessment_visit_results_students" ALTER COLUMN "workflow_ref_id" TYPE character varying;
