CREATE TABLE "public"."assessment_visit_results_v2" ("id" bigserial NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "grade" int2 NOT NULL, "subject_id" integer NOT NULL, "module_result" json NOT NULL, "is_visited" boolean NOT NULL DEFAULT False, "mentor_id" integer, "no_of_student" integer NOT NULL DEFAULT 0, "udise_code" varchar NOT NULL, "total_time_taken" int2 NOT NULL DEFAULT 0, "actor_id" integer NOT NULL, "block_id" integer NOT NULL, "student_session" uuid NOT NULL, "assessment_type" int2 NOT NULL DEFAULT 0, PRIMARY KEY ("id") );COMMENT ON TABLE "public"."assessment_visit_results_v2" IS E'V2 for assessment_visit_results table';
