alter table "public"."school_results_fraud_reports" alter column "is_valid" drop not null;
alter table "public"."school_results_fraud_reports" add column "is_valid" bool;
