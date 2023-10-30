alter table "public"."assessment_cycle_district_school_mapping" add column "created_at" timestamptz
 not null default now();
