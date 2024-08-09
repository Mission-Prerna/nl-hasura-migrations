alter table "public"."school_results_fraud_reports" add column "created_at" timestamptz
 not null default now();
