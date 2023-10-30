CREATE TABLE "public"."assessment_cycles" ("id" serial NOT NULL, "start_date" date NOT NULL, "end_date" date NOT NULL, "class_1_students_count" int2 NOT NULL, "class_1_students" jsonb NOT NULL, "class_1_nipun_percentage" int2 NOT NULL, "class_2_students_count" int2 NOT NULL, "class_2_students" jsonb NOT NULL, "class_2_nipun_percentage" int2 NOT NULL, "class_3_students_count" int2 NOT NULL, "class_3_students" jsonb NOT NULL, "class_3_nipun_percentage" int2 NOT NULL, "name" character varying(255) NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );COMMENT ON TABLE "public"."assessment_cycles" IS E'Table to create a cycle';
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_assessment_cycles_updated_at"
BEFORE UPDATE ON "public"."assessment_cycles"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_assessment_cycles_updated_at" ON "public"."assessment_cycles"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
