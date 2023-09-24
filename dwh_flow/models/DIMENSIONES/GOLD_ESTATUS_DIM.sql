{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(stage) as ID_ESTATUS_N,
    stage as ESTATUS_C,
    stagesimplified as ESTATUS_SIMPLIFICADO_C
from 
    {{source('WAVE','initiative')}}