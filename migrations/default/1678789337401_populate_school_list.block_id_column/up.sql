update school_list AS s
set block_id = b.id
from blocks b
where b.name = s.block;
