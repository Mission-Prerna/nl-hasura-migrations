CREATE TABLE "public"."cache_mentor_metrics" ("id" bigserial NOT NULL, "mentor_id" bigint NOT NULL, "type" int2 NOT NULL, "type_value" varchar NOT NULL, "schools_visited" int2 NOT NULL DEFAULT 0, "assessments_taken" int2 NOT NULL DEFAULT 0, "avg_time" int2 NOT NULL DEFAULT 0, "grade_1_assessments" int2 NOT NULL DEFAULT 0, "grade_2_assessments" int2 NOT NULL DEFAULT 0, "grade_3_assessments" int2 NOT NULL DEFAULT 0, "nipun_count" int2 NOT NULL DEFAULT 0, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("mentor_id") REFERENCES "public"."mentor"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("mentor_id", "type", "type_value"));COMMENT ON TABLE "public"."cache_mentor_metrics" IS E'This table will hold assessment count metrics againts each mentor for home screen overview';
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
CREATE TRIGGER "set_public_cache_mentor_metrics_updated_at"
BEFORE UPDATE ON "public"."cache_mentor_metrics"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_cache_mentor_metrics_updated_at" ON "public"."cache_mentor_metrics"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
