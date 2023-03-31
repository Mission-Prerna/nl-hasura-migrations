CREATE TABLE "public"."blocks" ("id" serial NOT NULL, "district_id" integer NOT NULL, "name" bpchar NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("district_id", "name"));COMMENT ON TABLE "public"."blocks" IS E'Contains blocks information';
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
CREATE TRIGGER "set_public_blocks_updated_at"
BEFORE UPDATE ON "public"."blocks"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_blocks_updated_at" ON "public"."blocks" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
