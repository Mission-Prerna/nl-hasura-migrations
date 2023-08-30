CREATE  INDEX "assessment_visit_results_students_2023_oct_dec_sub_ts_idx" on
  "public"."assessment_visit_results_students_2023_oct_dec" using btree ("submission_timestamp");
