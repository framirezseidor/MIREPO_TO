{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select distinct
    hash(accountableworkstreamworkstream) as ID_WORKSTREAM_N,
    accountableworkstreamworkstream as WORKSTREAM_C
from 
    {{source('WAVE','initiative')}}