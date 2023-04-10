CREATE  INDEX "assessment_visit_results_v2_submission_timestamp_idx" on
  "public"."assessment_visit_results_v2" using btree ("submission_timestamp");
