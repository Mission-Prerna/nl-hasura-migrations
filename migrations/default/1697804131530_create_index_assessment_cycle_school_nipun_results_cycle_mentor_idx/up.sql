CREATE  INDEX "assessment_cycle_school_nipun_results_cycle_mentor_idx" on
  "public"."assessment_cycle_school_nipun_results" using btree ("cycle_id", "mentor_id");
