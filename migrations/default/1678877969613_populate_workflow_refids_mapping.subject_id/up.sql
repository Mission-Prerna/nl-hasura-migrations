update workflow_refids_mapping AS w
set subject_id = s.id
from subjects s
where w.subject = s.name;
