alter table "public"."assessment_visit_results_students_2023_apr_jun"
  add constraint "assessment_visit_results_students_2023_apr_jun_mentor_id_fke"
  foreign key ("mentor_id")
  references "public"."mentor"
  ("id") on update cascade on delete cascade;
