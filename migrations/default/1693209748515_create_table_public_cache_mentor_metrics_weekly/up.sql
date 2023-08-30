create table cache_mentor_metrics_weekly
(
    id                  bigserial                              not null
        constraint cache_mentor_metrics_weekly_pkey
            primary key,
    mentor_id           bigint                                 not null
        constraint cache_mentor_metrics_weekly_mentor_id_fkey
            references mentor
            on update restrict on delete restrict,
    week                integer                                not null,
    schools_visited     smallint                 default 0     not null,
    assessments_taken   smallint                 default 0     not null,
    avg_time            smallint                 default 0     not null,
    grade_1_assessments smallint                 default 0     not null,
    grade_2_assessments smallint                 default 0     not null,
    grade_3_assessments smallint                 default 0     not null,
    nipun_count         smallint                 default 0     not null,
    created_at          timestamp with time zone default now() not null,
    updated_at          timestamp with time zone default now() not null,
    constraint cache_mentor_metrics_weekly_mentor_id_week_key
        unique (mentor_id, week)
);

create trigger set_public_cache_mentor_metrics_weekly_updated_at
    before update
    on cache_mentor_metrics_weekly
    for each row
execute procedure set_current_timestamp_updated_at();
