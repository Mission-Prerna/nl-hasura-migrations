alter table "public"."assessment_visit_results_v2_2025_jul_sep" add column "updated_at" timestamp
 not null default now();

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
CREATE TRIGGER "set_public_assessment_visit_results_v2_2025_jul_sep_updated_at"
BEFORE UPDATE ON "public"."assessment_visit_results_v2_2025_jul_sep"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_assessment_visit_results_v2_2025_jul_sep_updated_at" ON "public"."assessment_visit_results_v2_2025_jul_sep"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
