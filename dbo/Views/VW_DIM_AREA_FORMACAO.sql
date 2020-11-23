﻿



CREATE   VIEW [dbo].[VW_DIM_AREA_FORMACAO] AS 
SELECT D.ID_DIM_AREA_FORMACAO
	, D.DSC_AREA_FORMACAO
	, O.[AREA_FORMACAO]
	, O.[ASSET]
	, O.[SUB_AREA_FORMACAO]
	--, left([SUB_AREA_FORMACAO], len([SUB_AREA_FORMACAO]) - charindex('#', reverse([SUB_AREA_FORMACAO]) + '#')) as [SUB_AREA_FORMACAO]
FROM [dbo].[DIM_AREA_FORMACAO] D LEFT JOIN [stg].[tbl_O_AREA_FORMACAO] O ON D.ID_DIM_AREA_FORMACAO=O.[area_formacao_cod]