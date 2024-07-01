CREATE TABLE "public"."actor_school_blacklist" ("id" serial NOT NULL, "actor_id" integer NOT NULL, "udise" int8 NOT NULL, "is_blacklist" boolean NOT NULL DEFAULT true, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("actor_id") REFERENCES "public"."actors"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("udise") REFERENCES "public"."school_list"("udise") ON UPDATE cascade ON DELETE cascade, UNIQUE ("id"), UNIQUE ("actor_id", "udise"));COMMENT ON TABLE "public"."actor_school_blacklist" IS E'Schools actors blacklist mapping';
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
CREATE TRIGGER "set_public_actor_school_blacklist_updated_at"
BEFORE UPDATE ON "public"."actor_school_blacklist"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_actor_school_blacklist_updated_at" ON "public"."actor_school_blacklist"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
