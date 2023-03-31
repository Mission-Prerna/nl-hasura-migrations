update workflow_refids_mapping AS w
set assessment_type_id = a.id
from assessment_types a
where w.assessment_type = a.name;
