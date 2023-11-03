CREATE TABLE "public"."student_update_logs" ("id" bigserial NOT NULL, "student_id" character varying(15) NOT NULL, "old_record" jsonb NOT NULL, "new_record" jsonb NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("student_id") REFERENCES "public"."students"("unique_id") ON UPDATE cascade ON DELETE cascade);COMMENT ON TABLE "public"."student_update_logs" IS E'This table holds the history of the updates made to students table records';