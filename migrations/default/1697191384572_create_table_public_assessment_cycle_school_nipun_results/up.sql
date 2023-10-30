CREATE TABLE "public"."assessment_cycle_school_nipun_results" ("id" bigserial NOT NULL, "cycle_id" integer NOT NULL, "udise" bigint NOT NULL, "mentor_id" bigint NOT NULL, "is_nipun" boolean NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("cycle_id") REFERENCES "public"."assessment_cycles"("id") ON UPDATE cascade ON DELETE restrict, FOREIGN KEY ("udise") REFERENCES "public"."school_list"("udise") ON UPDATE cascade ON DELETE restrict, FOREIGN KEY ("mentor_id") REFERENCES "public"."mentor"("id") ON UPDATE cascade ON DELETE restrict, UNIQUE ("cycle_id", "udise", "mentor_id"));
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
CREATE TRIGGER "set_public_assessment_cycle_school_nipun_results_updated_at"
BEFORE UPDATE ON "public"."assessment_cycle_school_nipun_results"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_assessment_cycle_school_nipun_results_updated_at" ON "public"."assessment_cycle_school_nipun_results"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
