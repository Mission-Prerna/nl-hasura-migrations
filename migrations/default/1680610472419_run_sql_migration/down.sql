-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
ALTER TABLE "public"."assessment_visit_results_students" ALTER COLUMN "competency_id" TYPE varchar USING ("competency_id"::varchar);
