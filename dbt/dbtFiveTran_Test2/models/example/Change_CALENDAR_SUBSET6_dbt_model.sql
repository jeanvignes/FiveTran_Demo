
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- {{ config(materialized='table') }}

{{ config(materialized='table',
alias = 'CALENDAR_SUBSET6_REV'
) }}

with source_data as (

SELECT SUB6.PERIODMONTH,
SUB6.CALENDARMONTH,
YEAR(TO_DATE("CALENDARMONTHEND")) AS "YEAR_CALENDARMONTHEND",
SUB6.BANK_DAY

FROM MAT_TRAK_.CALENDAR_SUBSET6 SUB6

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
