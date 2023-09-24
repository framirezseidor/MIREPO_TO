{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(sbus) as ID_SBU_N,
    sbus as DESCRIPCION_SBU_C
from 
    {{source('WAVE','impact')}}
