CREATE  INDEX "assessment_visit_results_students_2023_jul_sep_sub_ts_idx" on
  "public"."assessment_visit_results_students_2023_jul_sep" using btree ("submission_timestamp");
