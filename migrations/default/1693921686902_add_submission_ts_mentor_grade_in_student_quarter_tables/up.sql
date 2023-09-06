alter table "public"."assessment_visit_results_students_2024_jan_mar" add column "submission_timestamp" bigint
    not null default '0';
alter table "public"."assessment_visit_results_students_2024_jan_mar" add column "created_at" timestamptz
    not null default now();
CREATE  INDEX "assessment_visit_results_students_2024_jan_mar_sub_ts_idx" on
    "public"."assessment_visit_results_students_2024_jan_mar" using btree ("submission_timestamp");
CREATE  INDEX "assessment_visit_results_students_2024_jan_mar_created_at_idx" on
    "public"."assessment_visit_results_students_2024_jan_mar" using btree ("created_at");
alter table "public"."assessment_visit_results_students_2024_jan_mar" add column "grade" int2
    not null default '0';
alter table "public"."assessment_visit_results_students_2024_jan_mar" add column "mentor_id" bigint
    null;
alter table "public"."assessment_visit_results_students_2024_jan_mar"
    add constraint "assessment_visit_results_students_2024_jan_mar_mentor_id_fke"
        foreign key ("mentor_id")
            references "public"."mentor"
                ("id") on update cascade on delete cascade;
CREATE  INDEX "assessment_visit_results_students_2024_jan_mar_grade_idx" on
    "public"."assessment_visit_results_students_2024_jan_mar" using btree ("grade");
CREATE  INDEX "assessment_visit_results_students_2024_jan_mar_mentor_id_idx" on
    "public"."assessment_visit_results_students_2024_jan_mar" using btree ("mentor_id");
alter table "public"."assessment_visit_results_students_2024_apr_jun" add column "submission_timestamp" bigint
    not null default '0';
alter table "public"."assessment_visit_results_students_2024_apr_jun" add column "created_at" timestamptz
    not null default now();
CREATE  INDEX "assessment_visit_results_students_2024_apr_jun_sub_ts_idx" on
    "public"."assessment_visit_results_students_2024_apr_jun" using btree ("submission_timestamp");
CREATE  INDEX "assessment_visit_results_students_2024_apr_jun_created_at_idx" on
    "public"."assessment_visit_results_students_2024_apr_jun" using btree ("created_at");
alter table "public"."assessment_visit_results_students_2024_apr_jun" add column "grade" int2
    not null default '0';
alter table "public"."assessment_visit_results_students_2024_apr_jun" add column "mentor_id" bigint
    null;
alter table "public"."assessment_visit_results_students_2024_apr_jun"
    add constraint "assessment_visit_results_students_2024_apr_jun_mentor_id_fke"
        foreign key ("mentor_id")
            references "public"."mentor"
                ("id") on update cascade on delete cascade;
CREATE  INDEX "assessment_visit_results_students_2024_apr_jun_grade_idx" on
    "public"."assessment_visit_results_students_2024_apr_jun" using btree ("grade");
CREATE  INDEX "assessment_visit_results_students_2024_apr_jun_mentor_id_idx" on
    "public"."assessment_visit_results_students_2024_apr_jun" using btree ("mentor_id");
alter table "public"."assessment_visit_results_students_2024_jul_sep" add column "submission_timestamp" bigint
    not null default '0';
alter table "public"."assessment_visit_results_students_2024_jul_sep" add column "created_at" timestamptz
    not null default now();
CREATE  INDEX "assessment_visit_results_students_2024_jul_sep_sub_ts_idx" on
    "public"."assessment_visit_results_students_2024_jul_sep" using btree ("submission_timestamp");
CREATE  INDEX "assessment_visit_results_students_2024_jul_sep_created_at_idx" on
    "public"."assessment_visit_results_students_2024_jul_sep" using btree ("created_at");
alter table "public"."assessment_visit_results_students_2024_jul_sep" add column "grade" int2
    not null default '0';
alter table "public"."assessment_visit_results_students_2024_jul_sep" add column "mentor_id" bigint
    null;
alter table "public"."assessment_visit_results_students_2024_jul_sep"
    add constraint "assessment_visit_results_students_2024_jul_sep_mentor_id_fke"
        foreign key ("mentor_id")
            references "public"."mentor"
                ("id") on update cascade on delete cascade;
CREATE  INDEX "assessment_visit_results_students_2024_jul_sep_grade_idx" on
    "public"."assessment_visit_results_students_2024_jul_sep" using btree ("grade");
CREATE  INDEX "assessment_visit_results_students_2024_jul_sep_mentor_id_idx" on
    "public"."assessment_visit_results_students_2024_jul_sep" using btree ("mentor_id");
alter table "public"."assessment_visit_results_students_2024_oct_dec" add column "submission_timestamp" bigint
    not null default '0';
alter table "public"."assessment_visit_results_students_2024_oct_dec" add column "created_at" timestamptz
    not null default now();
CREATE  INDEX "assessment_visit_results_students_2024_oct_dec_sub_ts_idx" on
    "public"."assessment_visit_results_students_2024_oct_dec" using btree ("submission_timestamp");
CREATE  INDEX "assessment_visit_results_students_2024_oct_dec_created_at_idx" on
    "public"."assessment_visit_results_students_2024_oct_dec" using btree ("created_at");
alter table "public"."assessment_visit_results_students_2024_oct_dec" add column "grade" int2
    not null default '0';
alter table "public"."assessment_visit_results_students_2024_oct_dec" add column "mentor_id" bigint
    null;
alter table "public"."assessment_visit_results_students_2024_oct_dec"
    add constraint "assessment_visit_results_students_2024_oct_dec_mentor_id_fke"
        foreign key ("mentor_id")
            references "public"."mentor"
                ("id") on update cascade on delete cascade;
CREATE  INDEX "assessment_visit_results_students_2024_oct_dec_grade_idx" on
    "public"."assessment_visit_results_students_2024_oct_dec" using btree ("grade");
CREATE  INDEX "assessment_visit_results_students_2024_oct_dec_mentor_id_idx" on
    "public"."assessment_visit_results_students_2024_oct_dec" using btree ("mentor_id");

alter table "public"."assessment_visit_results_students_2025_jan_mar" add column "submission_timestamp" bigint
    not null default '0';
alter table "public"."assessment_visit_results_students_2025_jan_mar" add column "created_at" timestamptz
    not null default now();
CREATE  INDEX "assessment_visit_results_students_2025_jan_mar_sub_ts_idx" on
    "public"."assessment_visit_results_students_2025_jan_mar" using btree ("submission_timestamp");
CREATE  INDEX "assessment_visit_results_students_2025_jan_mar_created_at_idx" on
    "public"."assessment_visit_results_students_2025_jan_mar" using btree ("created_at");
alter table "public"."assessment_visit_results_students_2025_jan_mar" add column "grade" int2
    not null default '0';
alter table "public"."assessment_visit_results_students_2025_jan_mar" add column "mentor_id" bigint
    null;
alter table "public"."assessment_visit_results_students_2025_jan_mar"
    add constraint "assessment_visit_results_students_2025_jan_mar_mentor_id_fke"
        foreign key ("mentor_id")
            references "public"."mentor"
                ("id") on update cascade on delete cascade;
CREATE  INDEX "assessment_visit_results_students_2025_jan_mar_grade_idx" on
    "public"."assessment_visit_results_students_2025_jan_mar" using btree ("grade");
CREATE  INDEX "assessment_visit_results_students_2025_jan_mar_mentor_id_idx" on
    "public"."assessment_visit_results_students_2025_jan_mar" using btree ("mentor_id");
alter table "public"."assessment_visit_results_students_2025_apr_jun" add column "submission_timestamp" bigint
    not null default '0';
alter table "public"."assessment_visit_results_students_2025_apr_jun" add column "created_at" timestamptz
    not null default now();
CREATE  INDEX "assessment_visit_results_students_2025_apr_jun_sub_ts_idx" on
    "public"."assessment_visit_results_students_2025_apr_jun" using btree ("submission_timestamp");
CREATE  INDEX "assessment_visit_results_students_2025_apr_jun_created_at_idx" on
    "public"."assessment_visit_results_students_2025_apr_jun" using btree ("created_at");
alter table "public"."assessment_visit_results_students_2025_apr_jun" add column "grade" int2
    not null default '0';
alter table "public"."assessment_visit_results_students_2025_apr_jun" add column "mentor_id" bigint
    null;
alter table "public"."assessment_visit_results_students_2025_apr_jun"
    add constraint "assessment_visit_results_students_2025_apr_jun_mentor_id_fke"
        foreign key ("mentor_id")
            references "public"."mentor"
                ("id") on update cascade on delete cascade;
CREATE  INDEX "assessment_visit_results_students_2025_apr_jun_grade_idx" on
    "public"."assessment_visit_results_students_2025_apr_jun" using btree ("grade");
CREATE  INDEX "assessment_visit_results_students_2025_apr_jun_mentor_id_idx" on
    "public"."assessment_visit_results_students_2025_apr_jun" using btree ("mentor_id");
alter table "public"."assessment_visit_results_students_2025_jul_sep" add column "submission_timestamp" bigint
    not null default '0';
alter table "public"."assessment_visit_results_students_2025_jul_sep" add column "created_at" timestamptz
    not null default now();
CREATE  INDEX "assessment_visit_results_students_2025_jul_sep_sub_ts_idx" on
    "public"."assessment_visit_results_students_2025_jul_sep" using btree ("submission_timestamp");
CREATE  INDEX "assessment_visit_results_students_2025_jul_sep_created_at_idx" on
    "public"."assessment_visit_results_students_2025_jul_sep" using btree ("created_at");
alter table "public"."assessment_visit_results_students_2025_jul_sep" add column "grade" int2
    not null default '0';
alter table "public"."assessment_visit_results_students_2025_jul_sep" add column "mentor_id" bigint
    null;
alter table "public"."assessment_visit_results_students_2025_jul_sep"
    add constraint "assessment_visit_results_students_2025_jul_sep_mentor_id_fke"
        foreign key ("mentor_id")
            references "public"."mentor"
                ("id") on update cascade on delete cascade;
CREATE  INDEX "assessment_visit_results_students_2025_jul_sep_grade_idx" on
    "public"."assessment_visit_results_students_2025_jul_sep" using btree ("grade");
CREATE  INDEX "assessment_visit_results_students_2025_jul_sep_mentor_id_idx" on
    "public"."assessment_visit_results_students_2025_jul_sep" using btree ("mentor_id");
alter table "public"."assessment_visit_results_students_2025_oct_dec" add column "submission_timestamp" bigint
    not null default '0';
alter table "public"."assessment_visit_results_students_2025_oct_dec" add column "created_at" timestamptz
    not null default now();
CREATE  INDEX "assessment_visit_results_students_2025_oct_dec_sub_ts_idx" on
    "public"."assessment_visit_results_students_2025_oct_dec" using btree ("submission_timestamp");
CREATE  INDEX "assessment_visit_results_students_2025_oct_dec_created_at_idx" on
    "public"."assessment_visit_results_students_2025_oct_dec" using btree ("created_at");
alter table "public"."assessment_visit_results_students_2025_oct_dec" add column "grade" int2
    not null default '0';
alter table "public"."assessment_visit_results_students_2025_oct_dec" add column "mentor_id" bigint
    null;
alter table "public"."assessment_visit_results_students_2025_oct_dec"
    add constraint "assessment_visit_results_students_2025_oct_dec_mentor_id_fke"
        foreign key ("mentor_id")
            references "public"."mentor"
                ("id") on update cascade on delete cascade;
CREATE  INDEX "assessment_visit_results_students_2025_oct_dec_grade_idx" on
    "public"."assessment_visit_results_students_2025_oct_dec" using btree ("grade");
CREATE  INDEX "assessment_visit_results_students_2025_oct_dec_mentor_id_idx" on
    "public"."assessment_visit_results_students_2025_oct_dec" using btree ("mentor_id");
