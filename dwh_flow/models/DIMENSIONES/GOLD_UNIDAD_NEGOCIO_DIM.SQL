{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(businessunit) as ID_UNEGOCIO_N,
    businessunit as UNIDAD_NEGOCIO_C
from 
    {{source('WAVE','initiative')}}
