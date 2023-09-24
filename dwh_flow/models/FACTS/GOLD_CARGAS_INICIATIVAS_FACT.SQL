{{
    config(
        materialized= 'table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

Select 
    *
from 
    {{ref('SILVER_CARGA_INICIATIVAS_T')}}
