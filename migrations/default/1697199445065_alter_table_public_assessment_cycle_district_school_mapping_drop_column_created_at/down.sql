alter table "public"."assessment_cycle_district_school_mapping" alter column "created_at" set default now();
alter table "public"."assessment_cycle_district_school_mapping" alter column "created_at" drop not null;
alter table "public"."assessment_cycle_district_school_mapping" add column "created_at" timestamptz;
