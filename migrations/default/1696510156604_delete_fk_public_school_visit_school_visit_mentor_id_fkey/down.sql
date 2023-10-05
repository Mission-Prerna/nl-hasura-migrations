alter table "public"."school_visit"
  add constraint "school_visit_mentor_id_fkey"
  foreign key ("mentor_id")
  references "public"."mentors"
  ("id") on update cascade on delete cascade;
