{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'silver_flow'      
        )
}}

with ENERO_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'enero' AS mes_t,
        enero as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  FEBRERO_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'febrero' AS mes_t,
        febrero as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  MARZO_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'marzo' AS mes_t,
        marzo as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  ABRIL_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'abril' AS mes_t,
        abril as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  MAYO_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'mayo' AS mes_t,
        mayo as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  JUNIO_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'junio' AS mes_t,
        junio as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  JULIO_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'julio' AS mes_t,
        julio as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  AGOSTO_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'agosto' AS mes_t,
        agosto as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  SEPTIEMBRE_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'septiembre' AS mes_t,
        septiembre as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  OCTUBRE_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'octubre' AS mes_t,
        octubre as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  NOVIEMBRE_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'noviembre' AS mes_t,
        noviembre as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  DICIEMBRE_M AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        ano as anio_n,
        n_ as codigo_n,
        'diciembre' AS mes_t,
        diciembre as valor_t
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_=3000 AND iniciativa is not null

),  DESPIVOTEAR AS (
    SELECT * FROM ENERO_M
    UNION     SELECT * FROM FEBRERO_M
    UNION     SELECT * FROM MARZO_M    
    UNION     SELECT * FROM ABRIL_M
    UNION     SELECT * FROM MAYO_M
    UNION     SELECT * FROM JUNIO_M
    UNION     SELECT * FROM JULIO_M
    UNION     SELECT * FROM AGOSTO_M
    UNION     SELECT * FROM SEPTIEMBRE_M
    UNION     SELECT * FROM OCTUBRE_M
    UNION     SELECT * FROM NOVIEMBRE_M
    UNION     SELECT * FROM DICIEMBRE_M                                

)
    select 
        *
    from 
        DESPIVOTEAR