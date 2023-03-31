CREATE  INDEX "assessment_visit_results_v2_created_at_mentor_id_idx" on
  "public"."assessment_visit_results_v2" using btree ("created_at", "mentor_id");
