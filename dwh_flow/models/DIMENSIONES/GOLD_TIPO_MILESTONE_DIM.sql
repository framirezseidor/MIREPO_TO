{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(type) as ID_TMILESTONE_N,
   type as TIPO_MILESTONE_C
from 
    {{source('WAVE','milestone')}}