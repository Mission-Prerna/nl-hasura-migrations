alter table "public"."assessment_cycle_district_school_mapping"
  add constraint "assessment_cycle_district_school_mapping_udise_fkey"
  foreign key ("udise")
  references "public"."school_list"
  ("udise") on update cascade on delete restrict;
