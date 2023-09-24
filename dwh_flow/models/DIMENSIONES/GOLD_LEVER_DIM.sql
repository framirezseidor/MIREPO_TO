{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(lever) as ID_LEVER_N,
    lever as LEVER_C
from 
    {{source('WAVE','initiative')}}