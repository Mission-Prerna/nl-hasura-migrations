alter table "public"."school_results_fraud_reports"
  add constraint "school_results_fraud_reports_udise_fkey"
  foreign key ("udise")
  references "public"."school_list"
  ("udise") on update restrict on delete restrict;
