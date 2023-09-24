{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(moneda) as ID_MONEDA_N,
    moneda as MONEDA_C,
    country as PAIS_C
from 
    {{source('WAVE','impact')}}
