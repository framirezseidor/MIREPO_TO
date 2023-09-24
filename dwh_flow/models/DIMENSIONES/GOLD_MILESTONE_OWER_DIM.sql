{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(milestoneowner) as ID_MILESTONE_OWER_N,
    milestoneowner as NOMBRE_MOWNER_C
from 
    {{source('WAVE','milestone')}}