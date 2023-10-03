SELECT create_hypertable('public.assessments', 'submitted_at', chunk_time_interval => INTERVAL '1 month');
