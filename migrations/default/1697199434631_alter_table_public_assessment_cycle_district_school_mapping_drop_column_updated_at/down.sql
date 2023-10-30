alter table "public"."assessment_cycle_district_school_mapping" alter column "updated_at" set default now();
alter table "public"."assessment_cycle_district_school_mapping" alter column "updated_at" drop not null;
alter table "public"."assessment_cycle_district_school_mapping" add column "updated_at" timestamptz;
