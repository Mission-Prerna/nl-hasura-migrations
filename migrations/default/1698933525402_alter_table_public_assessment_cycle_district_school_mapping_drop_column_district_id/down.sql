alter table "public"."assessment_cycle_district_school_mapping" add constraint "assessment_cycle_district_school_cycle_id_district_id_udise_key" unique (udise, cycle_id, district_id);
alter table "public"."assessment_cycle_district_school_mapping"
  add constraint "assessment_cycle_district_school_mapping_district_id_fkey"
  foreign key (district_id)
  references "public"."districts"
  (id) on update cascade on delete restrict;
alter table "public"."assessment_cycle_district_school_mapping" alter column "district_id" drop not null;
alter table "public"."assessment_cycle_district_school_mapping" add column "district_id" int4;
