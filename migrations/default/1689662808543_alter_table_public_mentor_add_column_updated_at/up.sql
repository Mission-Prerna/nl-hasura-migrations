alter table "public"."mentor" add column "updated_at" timestamptz
 not null default now();