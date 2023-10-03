alter table "public"."assessments" drop constraint "assessments_subject_id_fkey",
  add constraint "assessments_subject_id_fkey"
  foreign key ("subject_id")
  references "public"."subjects"
  ("id") on update cascade on delete restrict;
