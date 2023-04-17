ALTER TABLE "public"."assessment_visit_results_students" ALTER COLUMN "competency_id" TYPE integer USING ("competency_id"::integer);
