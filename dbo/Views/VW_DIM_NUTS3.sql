﻿
CREATE   VIEW [dbo].[VW_DIM_NUTS3] AS 
SELECT D.ID_DIM_NUTS3
	,D.DSC_NUTS3
	,O.NUTS_II_COD
FROM [dbo].[DIM_NUTS3] D LEFT JOIN [stg].[tbl_O_NUTSIII] O ON D.ID_DIM_NUTS3=O.NUTS_III_COD
