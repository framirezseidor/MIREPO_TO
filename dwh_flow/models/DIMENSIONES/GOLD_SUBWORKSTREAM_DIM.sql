{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(accountableworkstreamsubworkstream) as ID_SUBWORKSTREAM_N,
    accountableworkstreamsubworkstream as SUBWORKSTREAM_C
from 
    {{source('WAVE','initiative')}}