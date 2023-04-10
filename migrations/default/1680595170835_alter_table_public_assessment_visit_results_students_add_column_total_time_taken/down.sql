-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
alter table "public"."assessment_visit_results_students" drop column if exists "total_time_taken";
