alter table "public"."mentor"
  add constraint "mentor_designation_id_fkey"
  foreign key ("designation_id")
  references "public"."designations"
  ("id") on update cascade on delete restrict;
