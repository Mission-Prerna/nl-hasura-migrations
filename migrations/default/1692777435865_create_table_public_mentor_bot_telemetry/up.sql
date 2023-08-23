CREATE TABLE "public"."mentor_bot_telemetry" ("id" bigserial NOT NULL, "mentor_id" integer NOT NULL, "bot_id" uuid NOT NULL, "action" integer NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("mentor_id") REFERENCES "public"."mentor"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("mentor_id", "bot_id", "action"));COMMENT ON TABLE "public"."mentor_bot_telemetry" IS E'Log all actions by a mentor with a bot';
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
CREATE TRIGGER "set_public_mentor_bot_telemetry_updated_at"
BEFORE UPDATE ON "public"."mentor_bot_telemetry"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_mentor_bot_telemetry_updated_at" ON "public"."mentor_bot_telemetry"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
