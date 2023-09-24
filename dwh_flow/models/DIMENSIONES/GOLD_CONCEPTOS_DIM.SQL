{{
    config(
        materialized='table' ,
        database= 'unitycatalog_dev',
        schema= 'gold_flow_dwh'      
        )
}}

WITH CONCEPTOS AS (
    SELECT 1 AS ORDEN,  2012 AS ID_CONCEPTO_N, 'Venta' AS CONCEPTO_C UNION
    SELECT 2 AS ORDEN,  2023 AS ID_CONCEPTO_N, 'Costo' AS CONCEPTO_C UNION
    SELECT 3 AS ORDEN,  2001 AS ID_CONCEPTO_N, 'Magen bruto' AS CONCEPTO_C UNION
    SELECT 4 AS ORDEN,  2030 AS ID_CONCEPTO_N, 'Gastos de Comisiones' AS CONCEPTO_C UNION
    SELECT 5 AS ORDEN,  2035 AS ID_CONCEPTO_N, 'Gasto Distribución (Fletes)' AS CONCEPTO_C UNION
    SELECT 6 AS ORDEN,  2002 AS ID_CONCEPTO_N, 'Gastos de mantenimiento, sercicios, renta, honorarios y subscripción' AS CONCEPTO_C UNION
    SELECT 7 AS ORDEN,  2003 AS ID_CONCEPTO_N, 'Gastos del automovil' AS CONCEPTO_C UNION
    SELECT 8 AS ORDEN,  2004 AS ID_CONCEPTO_N, 'Gastos por viaje' AS CONCEPTO_C UNION
    SELECT 9 AS ORDEN,  2005 AS ID_CONCEPTO_N, 'Gastos por generales' AS CONCEPTO_C UNION
    SELECT 10 AS ORDEN,  2006 AS ID_CONCEPTO_N, 'Gastos por multas' AS CONCEPTO_C UNION
    SELECT 11 AS ORDEN,  2007 AS ID_CONCEPTO_N, 'Gastos de empleado' AS CONCEPTO_C UNION
    SELECT 12 AS ORDEN,  2008 AS ID_CONCEPTO_N, 'Gastos de nómina' AS CONCEPTO_C UNION
    SELECT 13 AS ORDEN,  2009 AS ID_CONCEPTO_N, 'Gastos de publicidad ' AS CONCEPTO_C UNION
    SELECT 14 AS ORDEN,  2010 AS ID_CONCEPTO_N, 'Gastos de honorarios' AS CONCEPTO_C UNION
    SELECT 15 AS ORDEN,  2011 AS ID_CONCEPTO_N, 'Gastos de TI' AS CONCEPTO_C UNION
    SELECT 16 AS ORDEN,  2013 AS ID_CONCEPTO_N, 'Gastos de proyectos especiales' AS CONCEPTO_C UNION
    SELECT 17 AS ORDEN,  2014 AS ID_CONCEPTO_N, 'Gastos totales ' AS CONCEPTO_C UNION
    SELECT 18 AS ORDEN,  2015 AS ID_CONCEPTO_N, 'EBITDA (Actual)' AS CONCEPTO_C 
) 
SELECT * FROM CONCEPTOS ORDER BY ORDEN



/*
2012	Venta
2023	Costo
2001	Magen bruto
2030	Gastos de Comisiones
2035	Gasto Distribución (Fletes)
2002	Gastos de mantenimiento, sercicios, renta, honorarios y subscripción
2003	Gastos del automovil
2004	Gastos por viaje
2005	Gastos por generales
2006	Gastos por multas
2007	Gastos de empleado
2008	Gastos de nómina
2009	Gastos de publicidad 
2010	Gastos de honorarios
2011	Gastos de TI
2013	Gastos de proyectos especiales
2014	Gastos totales 
2015	EBITDA (Actual)
*/