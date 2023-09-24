{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(whatisthetypeofimpactmetriccategory) as ID_TIMPACTO_CATEGORIA_N,
    whatisthetypeofimpactmetriccategory as TIPO_IMPACTO_CATEGORIA_C
from 
    {{source('WAVE','impact')}}
