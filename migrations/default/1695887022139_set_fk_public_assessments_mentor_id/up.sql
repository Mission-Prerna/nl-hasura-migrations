alter table "public"."assessments"
  add constraint "assessments_mentor_id_fkey"
  foreign key ("mentor_id")
  references "public"."mentor"
  ("id") on update cascade on delete cascade;
