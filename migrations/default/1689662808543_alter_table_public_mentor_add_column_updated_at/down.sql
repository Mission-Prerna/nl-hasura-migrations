DROP TRIGGER IF EXISTS set_public_mentor_updated_at ON "public"."mentor";
ALTER TABLE mentor DROP COLUMN updated_at;