{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'silver_flow'      
        )
}}


with SIN_CARACTERES AS (
    SELECT
        iniciativa AS id_iniciativa_n,
        cast(substr(ano,2,4) as int) as anio_n,
        concepto as concepto_c,
        n_ as codigo_n,
        replace(replace(replace(enero,'$','' ), '(','-'),')','')  enero,
        replace(replace(replace(febrero,'$','' ), '(','-'),')','')  febrero,
        replace(replace(replace(marzo,'$','' ), '(','-'),')','')  marzo,
        replace(replace(replace(abril,'$','' ), '(','-'),')','')  abril,
        replace(replace(replace(mayo,'$','' ), '(','-'),')','')  mayo,
        replace(replace(replace(junio,'$','' ), '(','-'),')','')  junio,
        replace(replace(replace(julio,'$','' ), '(','-'),')','')  julio,
        replace(replace(replace(agosto,'$','' ), '(','-'),')','')  agosto,
        replace(replace(replace(septiembre,'$','' ), '(','-'),')','')  septiembre,
        replace(replace(replace(octubre,'$','' ), '(','-'),')','')  octubre,
        replace(replace(replace(noviembre,'$','' ), '(','-'),')','')  noviembre,
        replace(replace(replace(diciembre,'$','' ), '(','-'),')','')  diciembre
    FROM
        {{source('FORMATO','stg_formato_iniciativas_t')}} 
    where
        n_<>3000 AND iniciativa is not null and ano is not null
), 

CONVERSION AS (
    select
        id_iniciativa_n,
        anio_n,
        concepto_c,
        codigo_n,
        cast(nvl(enero,0) as decimal(6,3)) enero,
        cast(nvl(febrero,0) as decimal(6,3)) febrero,
        cast(nvl(marzo,0) as decimal(6,3)) marzo,
        cast(nvl(abril,0) as decimal(6,3)) abril,
        cast(nvl(mayo,0) as decimal(6,3)) mayo,
        cast(nvl(junio,0) as decimal(6,3)) junio,
        cast(nvl(julio,0) as decimal(6,3)) julio,
        cast(nvl(agosto,0) as decimal(6,3)) agosto,
        cast(nvl(septiembre,0) as decimal(6,3)) septiembre,
        cast(nvl(octubre,0) as decimal(6,3)) octubre,
        cast(nvl(noviembre,0) as decimal(6,3)) noviembre,
        cast(nvl(diciembre,0) as decimal(6,3)) diciembre
    from 
        SIN_CARACTERES

), HISTORICO AS (
    select
        id_iniciativa_n ,
        anio_n,
        concepto_c,
        id_concepto_n as codigo_n,
        cast(enero_n as decimal(6,3)) enero,
        cast(febrero_n as decimal(6,3)) febrero,
        cast(marzo_n as decimal(6,3)) marzo,
        cast(abril_n as decimal(6,3)) abril,
        cast(mayo_n as decimal(6,3)) mayo,
        cast(junio_n as decimal(6,3)) junio,
        cast(julio_n as decimal(6,3)) julio,
        cast(agosto_n as decimal(6,3)) agosto,
        cast(septiembre_n as decimal(6,3)) septiembre,
        cast(octubre_n as decimal(6,3)) octubre,
        cast(noviembre_n as decimal(6,3)) noviembre,
        cast(diciembre as decimal(6,3)) diciembre
    from 
        {{ref('SILVER_HISTORICO_INICIATIVAS_V')}}
), TODO AS (

    SELECT * FROM CONVERSION

    UNION

    SELECT * FROM HISTORICO

), DESPIVOTEAR AS (
    SELECT 
        id_iniciativa_n,
        codigo_n,
        concepto_c,
        anio_n,
        month as mes_t,
        value as valor_n
    FROM   (
            SELECT id_iniciativa_n, anio_n, codigo_n, concepto_c,
                    enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre
            FROM   TODO
        ) x
    UNPIVOT
    (
    value FOR month IN (enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
    ) u

)
    select 
        *
    from 
        DESPIVOTEAR;
