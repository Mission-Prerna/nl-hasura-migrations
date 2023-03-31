alter table "public"."assessment_visit_results_v2" alter column "udise" set not null;
alter table "public"."assessment_visit_results_v2" alter column "udise" set default '0'::bigint;
