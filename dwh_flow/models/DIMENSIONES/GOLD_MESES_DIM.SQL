{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}


WITH MESES AS (
SELECT  1 AS NUMERO_MES_N, 'enero' as MES_C UNION
SELECT  2 AS NUMERO_MES_N, 'febrero' as MES_C UNION
SELECT  3 AS NUMERO_MES_N, 'marzo' as MES_C UNION
SELECT  4 AS NUMERO_MES_N, 'abril' as MES_C UNION
SELECT  5 AS NUMERO_MES_N, 'mayo' as MES_C UNION
SELECT  6 AS NUMERO_MES_N, 'junio' as MES_C UNION
SELECT  7 AS NUMERO_MES_N, 'julio' as MES_C UNION
SELECT  8 AS NUMERO_MES_N, 'agosto' as MES_C UNION
SELECT  9 AS NUMERO_MES_N, 'septiembre' as MES_C UNION
SELECT  10 AS NUMERO_MES_N, 'octubre' as MES_C UNION
SELECT  11 AS NUMERO_MES_N, 'noviembre' as MES_C UNION
SELECT  12 AS NUMERO_MES_N, 'diciembre' as MES_C 
)

SELECT * FROM MESES ORDER BY NUMERO_MES_N