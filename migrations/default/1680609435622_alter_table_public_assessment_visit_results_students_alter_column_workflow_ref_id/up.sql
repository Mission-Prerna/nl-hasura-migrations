ALTER TABLE "public"."assessment_visit_results_students" ALTER COLUMN "workflow_ref_id" TYPE character varying;
alter table "public"."assessment_visit_results_students" alter column "workflow_ref_id" set not null;
