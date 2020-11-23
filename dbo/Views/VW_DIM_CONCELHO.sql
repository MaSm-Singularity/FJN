﻿

CREATE viEW [dbo].[VW_DIM_CONCELHO] AS 
	SELECT ID_DIM_CONCELHO
		, coalesce(DSC_CONCELHO, O.[CONCELHO]) as DSC_CONCELHO
		, [NUTS_II_COD]
		, O.[NUTS_III_COD]		
	FROM [dbo].[DIM_CONCELHO] D LEFT JOIN [stg].[tbl_O_CONCELHO] O ON D.ID_DIM_CONCELHO=cast(O.[CONCELHO_COD] as int)
