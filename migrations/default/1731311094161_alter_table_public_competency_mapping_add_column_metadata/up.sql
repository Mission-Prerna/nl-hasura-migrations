alter table "public"."competency_mapping" add column "metadata" jsonb
 not null default jsonb_build_object();
