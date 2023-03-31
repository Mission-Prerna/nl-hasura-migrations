update competency_mapping AS c
set subject_id = s.id
from subjects s
where c.subject = s.name;
