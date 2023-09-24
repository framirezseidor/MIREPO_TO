{{
    config(
        materialized='view' ,
        database= 'unitycatalog_dev',
        schema= 'silver_flow'      
        )
}}


	with anio_2019 as (

		SELECT 
		iniciativa, n_, concepto, 
		2019 AS ANIO, 
		jan_19 as enero,
		feb_19 as febrero,
		mar_19 as marzo,
		apr_19 as abril, 
		may_19 as mayo, 
		jun_19 as junio,
		jul_19 as julio, 
		aug_19 as agosto, 
		sep_19 as septiembre, 
		oct_19 as octubre, 
		nov_19 as noviembre, 
		dec_19 as diciembre, 
		total_2019 as Total
		FROM 
		{{source('FORMATO', 'stg_iniciativas_hist_t')}} 
		
	),  anio_2020 as (
		SELECT 
		iniciativa, n_, concepto, 
		2020 AS ANIO, 
		jan_20 as enero,
		feb_20 as febrero,
		mar_20 as marzo,
		apr_20 as abril, 
		may_20 as mayo, 
		jun_20 as junio,
		jul_20 as julio, 
		aug_20 as agosto, 
		sep_20 as septiembre, 
		oct_20 as octubre, 
		nov_20 as noviembre, 
		dec_20 as diciembre, 
		total_2020 as Total
		FROM 
		{{source('FORMATO', 'stg_iniciativas_hist_t')}} 
		
	),  anio_2021 as (
		SELECT 
		iniciativa, n_, concepto, 
		2021 AS ANIO, 
		jan_21 as enero,
		feb_21 as febrero,
		mar_21 as marzo,
		apr_21 as abril, 
		may_21 as mayo, 
		jun_21 as junio,
		jul_21 as julio, 
		aug_21 as agosto, 
		sep_21 as septiembre, 
		oct_21 as octubre, 
		nov_21 as noviembre, 
		dec_21 as diciembre, 
		total_2021 as Total
		FROM 
		{{source('FORMATO', 'stg_iniciativas_hist_t')}} 
		
	),  anio_2022 as (
		SELECT 
		iniciativa, n_, concepto, 
		2022 AS ANIO, 
		jan_22 as enero,
		feb_22 as febrero,
		mar_22 as marzo,
		apr_22 as abril, 
		may_22 as mayo, 
		jun_22 as junio,
		jul_22 as julio, 
		aug_22 as agosto, 
		sep_22 as septiembre, 
		oct_22 as octubre, 
		nov_22 as noviembre, 
		dec_22 as diciembre, 
		total_2022 as Total
		FROM 
		{{source('FORMATO', 'stg_iniciativas_hist_t')}} 
		
	),  anio_2023 as (
		SELECT 
		iniciativa, n_, concepto, 
		2023 AS ANIO, 
		jan_23 as enero,
		feb_23 as febrero,
		mar_23 as marzo,
		apr_23 as abril, 
		may_23 as mayo, 
		jun_23 as junio,
		jul_23 as julio,
		00.00 as agosto,
		00.00 as septiembre, 
		00.00 as octubre, 
		00.00 as noviembre, 
		00.00 as diciembre, 	
		total_2023 as Total
		FROM 
		{{source('FORMATO', 'stg_iniciativas_hist_t')}} 

	), mezcla as (

		select * from anio_2019
		union
		select * from anio_2020
		union
		select * from anio_2021	
		union
		select * from anio_2022
		union
		select * from anio_2023	
		
	), FINAL  as (

		SELECT
			cast(iniciativa as int) as ID_INICIATIVA_N,
			cast(n_ as int) as ID_CONCEPTO_N,
			concepto AS CONCEPTO_C,
			cast(ANIO as int) AS ANIO_N,
			cast( replace(replace(replace(nvl(enero,0),'$',''),'(','-'),')','')  as decimal(5,3)) as ENERO_N,
			cast( replace(replace(replace(nvl(febrero,0),'$',''),'(','-'),')','') as decimal(5,3)) as FEBRERO_N,
			cast( replace(replace(replace(nvl(marzo,0),'$',''),'(','-'),')','') as decimal(5,3)) as MARZO_N,
			cast( replace(replace(replace(nvl(abril,0),'$',''),'(','-'),')','') as decimal(5,3)) as ABRIL_N,
			cast( replace(replace(replace(nvl(mayo,0),'$',''),'(','-'),')','') as decimal(5,3)) as MAYO_N,
			cast( replace(replace(replace(nvl(junio,0),'$',''),'(','-'),')','') as decimal(5,3)) as JUNIO_N,
			cast( replace(replace(replace(nvl(julio,0),'$',''),'(','-'),')','') as decimal(5,3)) as JULIO_N,
			cast( replace(replace(replace(nvl(agosto,0),'$',''),'(','-'),')','') as decimal(5,3)) as AGOSTO_N,
			cast( replace(replace(replace(nvl(septiembre,0),'$',''),'(','-'),')','') as decimal(5,3)) as SEPTIEMBRE_N,
			cast( replace(replace(replace(nvl(octubre,0),'$',''),'(','-'),')','') as decimal(5,3)) as OCTUBRE_N,
			cast( replace(replace(replace(nvl(noviembre,0),'$',''),'(','-'),')','') as decimal(5,3)) as NOVIEMBRE_N,
			cast( replace(replace(replace(nvl(diciembre,0),'$',''),'(','-'),')','') as decimal(5,3)) as DICIEMBRE,
			cast( replace(replace(replace(nvl(Total,0),'$',''),'(','-'),')','') as decimal(5,3)) as TOTAL_N
		from 
			mezcla 
		where 
			n_ <> 3000 
	)

	SELECT * FROM FINAL ;
