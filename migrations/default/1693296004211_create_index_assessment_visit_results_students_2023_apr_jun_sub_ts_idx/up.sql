CREATE  INDEX "assessment_visit_results_students_2023_apr_jun_sub_ts_idx" on
  "public"."assessment_visit_results_students_2023_apr_jun" using btree ("submission_timestamp");
