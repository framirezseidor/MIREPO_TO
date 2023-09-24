{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(tema) as ID_TEMA,
    tema as TEMA_C
from 
    {{source('WAVE','initiative')}}