alter table "public"."school_results_fraud_reports" alter column "updated_at" set default now();
alter table "public"."school_results_fraud_reports" alter column "updated_at" drop not null;
alter table "public"."school_results_fraud_reports" add column "updated_at" date;
