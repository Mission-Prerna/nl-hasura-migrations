CREATE  INDEX "assessment_survey_result_actor_id_idx" on
  "public"."assessment_survey_result_v2" using hash ("actor_id");
