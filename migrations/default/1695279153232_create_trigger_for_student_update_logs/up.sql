CREATE OR REPLACE FUNCTION jsonb_diff_val(val1 JSONB,val2 JSONB)
    RETURNS JSONB AS $$
DECLARE
    result JSONB;
    v RECORD;
BEGIN
    result = val1;
    FOR v IN SELECT * FROM jsonb_each(val2) LOOP
            IF result @> jsonb_build_object(v.key,v.value)
            THEN result = result - v.key;
            ELSIF result ? v.key THEN CONTINUE;
            ELSE
                result = result || jsonb_build_object(v.key,'null');
            END IF;
        END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."create_student_update_logs"()
    RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO student_update_logs(student_id, old_record, new_record) values (NEW.unique_id, jsonb_diff_val(row_to_json(old)::jsonb, row_to_json(new)::jsonb), jsonb_diff_val(row_to_json(new)::jsonb, row_to_json(old)::jsonb));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "create_student_update_logs"
    BEFORE UPDATE ON "public"."students"
    FOR EACH ROW
EXECUTE PROCEDURE "public"."create_student_update_logs"();
COMMENT ON TRIGGER "create_student_update_logs" ON "public"."students"
    IS 'log the current snapshot of the student update';