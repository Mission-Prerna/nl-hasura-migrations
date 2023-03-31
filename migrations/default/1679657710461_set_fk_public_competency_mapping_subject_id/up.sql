alter table "public"."competency_mapping"
  add constraint "competency_mapping_subject_id_fkey"
  foreign key ("subject_id")
  references "public"."subjects"
  ("id") on update cascade on delete restrict;
