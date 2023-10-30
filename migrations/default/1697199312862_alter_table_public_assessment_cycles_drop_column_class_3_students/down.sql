comment on column "public"."assessment_cycles"."class_3_students" is E'Table to create a cycle';
alter table "public"."assessment_cycles" alter column "class_3_students" drop not null;
alter table "public"."assessment_cycles" add column "class_3_students" jsonb;
