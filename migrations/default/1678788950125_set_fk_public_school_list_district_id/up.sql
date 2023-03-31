alter table "public"."school_list"
  add constraint "school_list_district_id_fkey"
  foreign key ("district_id")
  references "public"."districts"
  ("id") on update cascade on delete restrict;
