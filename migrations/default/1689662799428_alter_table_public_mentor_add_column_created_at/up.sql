alter table "public"."mentor" add column "created_at" timestamptz
 not null default now();
