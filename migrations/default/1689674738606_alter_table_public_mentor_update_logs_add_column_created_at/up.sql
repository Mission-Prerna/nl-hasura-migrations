alter table "public"."mentor_update_logs" add column "created_at" timestamptz
 not null default now();
