CREATE  INDEX "assessment_visit_results_v2_ass_type_id_idx" on
  "public"."assessment_visit_results_v2" using btree ("assessment_type_id");
