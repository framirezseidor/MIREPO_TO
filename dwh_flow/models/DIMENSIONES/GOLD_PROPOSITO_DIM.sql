{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(purpose) as ID_PROPOSITO_N,
    purpose as DESC_PROPOSITO_C
from 
    {{source('WAVE','kpi')}}
