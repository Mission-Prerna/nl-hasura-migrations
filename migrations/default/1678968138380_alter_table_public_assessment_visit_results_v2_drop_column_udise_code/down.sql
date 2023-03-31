comment on column "public"."assessment_visit_results_v2"."udise_code" is E'V2 for assessment_visit_results table';
alter table "public"."assessment_visit_results_v2"
  add constraint "assessment_visit_results_v2_udise_code_fkey"
  foreign key (udise_code)
  references "public"."school_list"
  (udise_code) on update cascade on delete restrict;
alter table "public"."assessment_visit_results_v2" alter column "udise_code" drop not null;
alter table "public"."assessment_visit_results_v2" add column "udise_code" varchar;
