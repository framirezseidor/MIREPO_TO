{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

WITH SUMATORIA AS (
    Select 
        ID_INICIATIVA_N,
        2015 AS ID_CONCEPTO_C,
        'EBITDA' AS CONCEPTO_C,
        MONEDA_C,
        TIPO_CARGA_C,
        ANIO_N,
        MES_C,
        SUM(VALOR_N) AS VALOR_N
    from 
        {{ref('GOLD_WAVE_FACT')}}
    GROUP BY ALL
)

SELECT * FROM SUMATORIA