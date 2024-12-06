
-- Use the `ref` function to select from other models


select *
from {{ ref('Series_T1_001_calendar_subset_w_pretty_names') }};

--select *
--from {{ ref('Change_CALENDAR_SUBSET6_dbt_model') }}
