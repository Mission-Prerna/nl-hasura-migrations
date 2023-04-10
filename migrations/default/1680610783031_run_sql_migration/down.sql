-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
ALTER TABLE "public"."assessment_visit_results_student_odk_results" ALTER COLUMN "answer" TYPE
varchar USING ("answer"::varchar);
