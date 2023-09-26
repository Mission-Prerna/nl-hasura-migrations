alter table "public"."students" alter column "deleted_at" drop not null;
alter table "public"."students" add column "deleted_at" time;
