CREATE TABLE "public"."districts" ("id" serial NOT NULL, "name" bpchar NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("name"));COMMENT ON TABLE "public"."districts" IS E'Contains district information';
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
CREATE TRIGGER "set_public_districts_updated_at"
BEFORE UPDATE ON "public"."districts"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_districts_updated_at" ON "public"."districts" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
