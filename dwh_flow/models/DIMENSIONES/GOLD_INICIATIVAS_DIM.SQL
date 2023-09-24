{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

WITH WAVE AS (
    Select distinct
        initiative as ID_INICIATIVA_N,
        name as NOMBRE_INICIATIVA_C,
        businessunit as UNIDAD_NEGOCIO_C,
        accountableworkstreamworkstream WORKSTREAM_C, 
        accountableworkstreamsubworkstream SUBWORKSTREAM_C, 
        stagesimplified ESTATUS_C, 
        weeklystatus ESTATUSSEMANAL_C,
        initiativeowner DUENOINICIATIVA_C,
        actualebitdarunratemmxn
    from 
        {{source('WAVE','initiative')}}
    --where 
    --    stagesimplified= 'L5 - Realised' and
    --    actualebitdarunratemmxn >= 1 
), REGIONES AS (
    SELECT 
        iniciativa as ID_INICIATIVA_N,
        unidad_de_negocio AS UNIDAD_NEGOCIO_C,
        ws AS WORKSTREAM_C,
        region AS REGION_C
    FROM 
        {{source('SHAREPNT','iniciativa_region_base_historica_original')}}
), HIST AS (

    SELECT 
        DISTINCT ID_INICIATIVA_N AS ID_INICIATIVA_N
    FROM 
        {{ref('SILVER_HISTORICO_INICIATIVAS_V')}}

), FILTRO AS (
    SELECT 
        WAVE.ID_INICIATIVA_N,
        WAVE.NOMBRE_INICIATIVA_C,
        REGIONES.UNIDAD_NEGOCIO_C,
        REGIONES.WORKSTREAM_C, 
        WAVE.SUBWORKSTREAM_C, 
        WAVE.ESTATUS_C, 
        WAVE.ESTATUSSEMANAL_C,
        WAVE.DUENOINICIATIVA_C,
        WAVE.actualebitdarunratemmxn,
        REGIONES.REGION_C
    FROM 
        HIST INNER JOIN WAVE
        ON HIST.ID_INICIATIVA_N = WAVE.ID_INICIATIVA_N
        LEFT JOIN REGIONES
        ON HIST.ID_INICIATIVA_N = REGIONES.ID_INICIATIVA_N
)

SELECT * FROM FILTRO 
