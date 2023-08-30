alter table "public"."assessment_visit_results_students_2023_jul_sep"
  add constraint "assessment_visit_results_students_2023_jul_sep_mentor_id_fke"
  foreign key ("mentor_id")
  references "public"."mentor"
  ("id") on update cascade on delete cascade;
