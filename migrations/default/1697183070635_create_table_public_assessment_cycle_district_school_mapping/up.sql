CREATE TABLE "public"."assessment_cycle_district_school_mapping" ("id" bigserial NOT NULL, "cycle_id" integer NOT NULL, "district_id" integer NOT NULL, "udise" bigint NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("cycle_id") REFERENCES "public"."assessment_cycles"("id") ON UPDATE cascade ON DELETE restrict, UNIQUE ("cycle_id", "district_id", "udise"));
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
CREATE TRIGGER "set_public_assessment_cycle_district_school_mapping_updated_at"
BEFORE UPDATE ON "public"."assessment_cycle_district_school_mapping"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_assessment_cycle_district_school_mapping_updated_at" ON "public"."assessment_cycle_district_school_mapping"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
