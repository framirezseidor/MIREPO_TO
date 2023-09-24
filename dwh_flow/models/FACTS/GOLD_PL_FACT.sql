{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select 
    initiative_ AS ID_INICIATIVA_N,
    name AS INICIATIVA_C,
    business_unit AS UNEGOCIO_C,
    initiative_owner AS DUENO_INICIATIVA_C,
    `initiative_owner_back-up` AS DUENO_INICIATIVA_BU_C,
    stage AS ESTATUS_C,
    stage_simplified AS ESTATUS_SIMPLIFICADO_C,
    `accountable_workstream___workstream` AS WORKSTREAM_C,
    `accountable_workstream___sub-workstream` AS SUBWORKSTREAM_C
from 
    {{source('WAVE','initiative')}}
