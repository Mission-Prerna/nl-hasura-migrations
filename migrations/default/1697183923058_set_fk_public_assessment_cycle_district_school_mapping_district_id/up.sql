alter table "public"."assessment_cycle_district_school_mapping"
  add constraint "assessment_cycle_district_school_mapping_district_id_fkey"
  foreign key ("district_id")
  references "public"."districts"
  ("id") on update cascade on delete restrict;
