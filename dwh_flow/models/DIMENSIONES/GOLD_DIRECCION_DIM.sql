{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct 
    hash(direction) as ID_DIRECCION_N,
    direction as DIRECCION_C
from 
    {{source('WAVE','impact')}}
