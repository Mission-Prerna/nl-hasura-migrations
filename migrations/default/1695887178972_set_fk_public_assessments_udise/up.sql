alter table "public"."assessments"
  add constraint "assessments_udise_fkey"
  foreign key ("udise")
  references "public"."school_list"
  ("udise") on update cascade on delete restrict;
