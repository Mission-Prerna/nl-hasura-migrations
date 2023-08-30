create table cache_mentor_metrics_daily
(
    id                bigserial                              not null
        constraint cache_mentor_metrics_daily_pkey
            primary key,
    mentor_id         bigint                                 not null
        constraint cache_mentor_metrics_daily_mentor_id_fkey
            references mentor
            on update restrict on delete restrict,
    day              integer                                not null,
    assessments_taken smallint                 default 0     not null,
    nipun_count       smallint                 default 0     not null,
    created_at        timestamp with time zone default now() not null,
    updated_at        timestamp with time zone default now() not null,
    constraint cache_mentor_metrics_daily_mentor_id_day_key
        unique (mentor_id, day)
);

create trigger set_public_cache_mentor_metrics_daily_updated_at
    before update
    on cache_mentor_metrics_daily
    for each row
execute procedure set_current_timestamp_updated_at();
