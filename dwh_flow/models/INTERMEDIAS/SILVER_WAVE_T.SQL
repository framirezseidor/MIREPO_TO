{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'silver_flow'      
        )
}}


WITH ANIO2019 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2019 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2019 as enero,
                feb2019 as febrero,
                mar2019 as marzo,
                apr2019 as abril,
                may2019 as mayo,
                jun2019 as junio,
                jul2019 as julio,
                aug2019 as agosto,
                sep2019 as septiembre,
                oct2019 as octubre,
                nov2019 as noviembre,
                dec2019 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u

), ANIO2020 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2020 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2020 as enero,
                feb2020 as febrero,
                mar2020 as marzo,
                apr2020 as abril,
                may2020 as mayo,
                jun2020 as junio,
                jul2020 as julio,
                aug2020 as agosto,
                sep2020 as septiembre,
                oct2020 as octubre,
                nov2020 as noviembre,
                dec2020 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u

), ANIO2021 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2021 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2021 as enero,
                feb2021 as febrero,
                mar2021 as marzo,
                apr2021 as abril,
                may2021 as mayo,
                jun2021 as junio,
                jul2021 as julio,
                aug2021 as agosto,
                sep2021 as septiembre,
                oct2021 as octubre,
                nov2021 as noviembre,
                dec2021 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u

), ANIO2022 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2022 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2022 as enero,
                feb2022 as febrero,
                mar2022 as marzo,
                apr2022 as abril,
                may2022 as mayo,
                jun2022 as junio,
                jul2022 as julio,
                aug2022 as agosto,
                sep2022 as septiembre,
                oct2022 as octubre,
                nov2022 as noviembre,
                dec2022 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u

), ANIO2023 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2023 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2023 as enero,
                feb2023 as febrero,
                mar2023 as marzo,
                apr2023 as abril,
                may2023 as mayo,
                jun2023 as junio,
                jul2023 as julio,
                aug2023 as agosto,
                sep2023 as septiembre,
                oct2023 as octubre,
                nov2023 as noviembre,
                dec2023 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u

), ANIO2024 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2024 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2024 as enero,
                feb2024 as febrero,
                mar2024 as marzo,
                apr2024 as abril,
                may2024 as mayo,
                jun2024 as junio,
                jul2024 as julio,
                aug2024 as agosto,
                sep2024 as septiembre,
                oct2024 as octubre,
                nov2024 as noviembre,
                dec2024 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u

), ANIO2025 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2025 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2025 as enero,
                feb2025 as febrero,
                mar2025 as marzo,
                apr2025 as abril,
                may2025 as mayo,
                jun2025 as junio,
                jul2025 as julio,
                aug2025 as agosto,
                sep2025 as septiembre,
                oct2025 as octubre,
                nov2025 as noviembre,
                dec2025 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u

), ANIO2026 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2026 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2026 as enero,
                feb2026 as febrero,
                mar2026 as marzo,
                apr2026 as abril,
                may2026 as mayo,
                jun2026 as junio,
                jul2026 as julio,
                aug2026 as agosto,
                sep2026 as septiembre,
                oct2026 as octubre,
                nov2026 as noviembre,
                dec2026 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u

), ANIO2027 AS (
    SELECT
        impact,
        initiative,
        frequencydirection,
        whatisthetypeofimpactmetriccategory,
        whatisthetypeofimpactmetric,
        sitioworkstream,
        sitiosubworkstream,
        direction,
        sbus,
        moneda,
        country,
        purpose,
        2027 AS anio_n,
        month as mes_t,
        value as valor_n
    FROM 
        (
            select
                impact,
                initiative,
                frequencydirection,
                whatisthetypeofimpactmetriccategory,
                whatisthetypeofimpactmetric,
                sitioworkstream,
                sitiosubworkstream,
                direction,
                sbus,
                moneda,
                country,
                purpose,
                jan2027 as enero,
                feb2027 as febrero,
                mar2027 as marzo,
                apr2027 as abril,
                may2027 as mayo,
                jun2027 as junio,
                jul2027 as julio,
                aug2027 as agosto,
                sep2027 as septiembre,
                oct2027 as octubre,
                nov2027 as noviembre,
                dec2027 as diciembre
            from	
                {{source('WAVE','impact')}}
        ) X
    UNPIVOT
        (
            value for month IN (enero, febrero, marzo, abril, mayo,
                junio, julio, agosto, septiembre, octubre, noviembre, diciembre)
        ) u


), TODO AS (
    SELECT * FROM ANIO2019
    UNION SELECT * FROM ANIO2020
    UNION SELECT * FROM ANIO2021
    UNION SELECT * FROM ANIO2022
    UNION SELECT * FROM ANIO2023    
    UNION SELECT * FROM ANIO2024
    UNION SELECT * FROM ANIO2025
    UNION SELECT * FROM ANIO2026
    UNION SELECT * FROM ANIO2027                

), FILTRO AS (
    SELECT
        --impact,
        initiative AS ID_INICIATIVA_N,
        frequencydirection DIRECTIVA_FRECUENCIA_C,
        whatisthetypeofimpactmetriccategory AS CATEGORIA_METRICA_C,
        whatisthetypeofimpactmetric TIPO_METRICA_C,
        direction AS DIRECCION_C,
        --sbus,
        --T.moneda AS MONEDA_C,
        'M MXN (Peso Mexicano)' AS MONEDA_C,
        --country,
        purpose AS TIPO_CARGA_C,
        anio_n AS ANIO_N,
        mes_t AS MES_C,
        valor_n*valor AS VALOR_N
    FROM 
        TODO AS T 
        INNER JOIN {{ref('GOLD_INICIATIVAS_DIM')}} AS D
        ON T.initiative = D.ID_INICIATIVA_N
        INNER JOIN {{source('SHAREPNT','stg_moneda_t')}} AS M
        ON T.moneda=M.moneda
    WHERE
        whatisthetypeofimpactmetriccategory IN ('Revenue', 'COGS',  'SG&A')	
        and purpose = 'Forecast'
        and anio_n <= year(current_date())
)

    SELECT * FROM FILTRO

/*
SUM(IF [Categoria]='Revenue' THEN [VALOR_N] END)
-SUM(IF [Categoria]='COGS' THEN [VALOR_N] END)
-SUM(IF [Categoria]='SG&A' THEN [VALOR_N] END)
*/