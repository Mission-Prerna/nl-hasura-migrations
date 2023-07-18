comment on column "public"."mentor_update_logs"."created_at" is E'This table holds the history of the updates made to mentor table records';
alter table "public"."mentor_update_logs" alter column "created_at" set default now();
alter table "public"."mentor_update_logs" alter column "created_at" drop not null;
alter table "public"."mentor_update_logs" add column "created_at" timestamptz;
