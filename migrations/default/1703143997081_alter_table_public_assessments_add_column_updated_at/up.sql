alter table "public"."assessments" add column "updated_at" timestamp
 not null default now();
