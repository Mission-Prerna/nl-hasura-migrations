alter table "public"."workflow_refids_mapping" drop constraint "workflow_refids_mapping_subject_competency_id_type_assessment_type_grade_min_app_version_code_key";
alter table "public"."workflow_refids_mapping" add constraint "workflow_refids_mapping_subject_competency_id_type_assessment_type_grade_key" unique ("subject", "competency_id", "type", "assessment_type", "grade");
