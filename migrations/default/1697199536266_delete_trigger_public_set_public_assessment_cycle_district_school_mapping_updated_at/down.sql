CREATE TRIGGER "set_public_assessment_cycle_district_school_mapping_updated_at"
BEFORE UPDATE ON "public"."assessment_cycle_district_school_mapping"
FOR EACH ROW EXECUTE FUNCTION set_current_timestamp_updated_at();COMMENT ON TRIGGER "set_public_assessment_cycle_district_school_mapping_updated_at" ON "public"."assessment_cycle_district_school_mapping"
IS E'trigger to set value of column "updated_at" to current timestamp on row update';
