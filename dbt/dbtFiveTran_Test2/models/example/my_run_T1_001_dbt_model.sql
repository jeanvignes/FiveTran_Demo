
-- Use the `ref` function to select from other models

select *
from {{ ref('Series_T1_001_calendar_subset_w_pretty_names') }}
--where id = 1
