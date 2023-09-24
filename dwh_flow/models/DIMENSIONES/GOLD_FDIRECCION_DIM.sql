{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(frequencydirection) as ID_FDIRECCION_N,
     frequencydirection as FRECUENCIA_DIRECCION_C
from 
    {{source('WAVE','impact')}}
