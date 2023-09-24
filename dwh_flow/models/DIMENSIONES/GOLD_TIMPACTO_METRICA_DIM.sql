{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(whatisthetypeofimpactmetric) as ID_TIMPACTO_METRICA_N,
    whatisthetypeofimpactmetric as TIPO_IMPACTO_METRICA_C
from 
    {{source('WAVE','impact')}}
