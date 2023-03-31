alter table "public"."mentor"
  add constraint "mentor_district_id_fkey"
  foreign key ("district_id")
  references "public"."districts"
  ("id") on update cascade on delete restrict;
