﻿
CREATE   VIEW [dbo].[VW_DIM_NUTS2] AS 
SELECT ID_DIM_NUTS2
	, DSC_NUTS2 
FROM [dbo].[DIM_NUTS2] D LEFT JOIN [stg].[tbl_O_NUTSII] O ON D.ID_DIM_NUTS2=O.NUTS_II_COD