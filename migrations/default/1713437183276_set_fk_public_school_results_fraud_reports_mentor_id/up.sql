alter table "public"."school_results_fraud_reports"
  add constraint "school_results_fraud_reports_mentor_id_fkey"
  foreign key ("mentor_id")
  references "public"."mentor"
  ("id") on update restrict on delete restrict;
