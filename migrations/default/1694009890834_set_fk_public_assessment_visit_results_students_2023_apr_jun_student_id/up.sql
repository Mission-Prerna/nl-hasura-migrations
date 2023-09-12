alter table "public"."assessment_visit_results_students_2023_apr_jun"
  add constraint "assessment_visit_results_students_2023_apr_jun_student_id_fk"
  foreign key ("student_id")
  references "public"."students"
  ("unique_id") on update cascade on delete set null;
