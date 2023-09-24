{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(initiativeowner) as ID_DINICIATIVA_N,
    initiativeowner as DUENO_INICIATIVA_C,
    initiativeownerbackup as DUENO_INICIATIVA_BU_C
from 
    {{source('WAVE','initiative')}}