alter table "public"."assessments" add constraint "assessments_id_submitted_at_key" unique ("id", "submitted_at");
