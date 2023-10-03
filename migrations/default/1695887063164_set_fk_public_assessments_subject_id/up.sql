alter table "public"."assessments"
  add constraint "assessments_subject_id_fkey"
  foreign key ("subject_id")
  references "public"."subjects"
  ("id") on update cascade on delete cascade;
