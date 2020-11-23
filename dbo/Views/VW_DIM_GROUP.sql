
CREATE VIEW [dbo].[VW_DIM_GROUP] AS 
select BITMASK_cod AS BITMASK_CODE
	, REPLACE(DESCRITIVO,'ID_DIM_','') AS BITMASK_DESCRIPTION
	, case when DESCRITIVO = '' then 0
		else len(DESCRITIVO) - len(replace(DESCRITIVO, ',', ''))+1
		end as NUM_OCCURRENCE
FROM (
	select BITMASK_cod
		,dbo.fnGetBitMaskDesc(a.BITMASK_desc) AS DESCRITIVO
	from (
		SELECT distinct cast(BITMASK as bigint) as BITMASK_desc
			, BITMASK as BITMASK_cod
		FROM dbo.[DIM_VAL]
	) A
)B
