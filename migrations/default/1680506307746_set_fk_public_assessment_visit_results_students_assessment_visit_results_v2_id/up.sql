alter table "public"."assessment_visit_results_students"
  add constraint "assessment_visit_results_students_assessment_visit_results_v"
  foreign key ("assessment_visit_results_v2_id")
  references "public"."assessment_visit_results_v2"
  ("id") on update cascade on delete cascade;
