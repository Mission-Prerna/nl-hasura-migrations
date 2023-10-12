alter table "public"."assessments"
  add constraint "assessments_student_id_fkey"
  foreign key ("student_id")
  references "public"."students"
  ("unique_id") on update cascade on delete cascade;
