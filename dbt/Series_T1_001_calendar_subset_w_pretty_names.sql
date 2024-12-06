
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- {{ config(materialized='table') }}

{{ config(materialized='table',
alias = 'CALENDAR_T1'
) }}

with source_data as (

SELECT CAL_T1.PERIODMONTH AS "PERIOD_MONTH",
CAL_T1.CALENDARMONTH AS "CALENDAR_MONTH",
YEAR(TO_DATE(CAL_T1.CALENDARMONTHEND)) AS "YEAR_CALENDAR_MONTH_END",
CAL_T1.BANK_DAY

FROM DEV_MATTINGS_SOL_DB.MAT_TRAK__DBO.CALENDAR_WPK CAL_T1

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
