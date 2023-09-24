{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

WITH SIGNO AS (
    Select 
        ID_INICIATIVA_N,
        --DIRECTIVA_FRECUENCIA_C,
        CATEGORIA_METRICA_C,
        MONEDA_C,
        TIPO_CARGA_C,
        ANIO_N,
        MES_C,
        CASE
            WHEN upper(DIRECTIVA_FRECUENCIA_C) like '%BENEFIT%' THEN VALOR_N
            ELSE (-1 * VALOR_N)
        END AS VALOR_N
    from 
        {{ref('SILVER_WAVE_T')}}


), AGRUPAR AS (
    Select 
        ID_INICIATIVA_N,
        CATEGORIA_METRICA_C,
        MONEDA_C,
        TIPO_CARGA_C,
        ANIO_N,
        MES_C,
        SUM(VALOR_N) AS VALOR_N
    from 
        SIGNO
    GROUP BY ALL


), ASIGNAR_CODIGO AS (
    Select 
        ID_INICIATIVA_N,
        CASE
            WHEN CATEGORIA_METRICA_C = 'Revenue' THEN 2012
            WHEN CATEGORIA_METRICA_C = 'COGS' THEN 2023
            WHEN CATEGORIA_METRICA_C = 'SG&A' THEN 2014
            --WHEN CATEGORIA_METRICA_C = 'CAPEX' THEN 5000
        END AS ID_CONCEPTO_C,
        CATEGORIA_METRICA_C AS CONCEPTO_C,
        MONEDA_C,
        TIPO_CARGA_C,
        ANIO_N,
        MES_C,
        VALOR_N
    from 
        AGRUPAR
),EBITDA AS (
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
        ASIGNAR_CODIGO
    GROUP BY ALL
), UNIR AS (
    SELECT * FROM ASIGNAR_CODIGO UNION 
    SELECT * FROM EBITDA

), FILTRADO AS (

    SELECT
        UNIR.* 
    FROM
        UNIR INNER JOIN {{ref('GOLD_INICIATIVAS_DIM')}} as D
        on unir.ID_INICIATIVA_N = D.ID_INICIATIVA_N
)

SELECT * FROM FILTRADO