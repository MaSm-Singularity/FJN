﻿CREATE TABLE [dbo].[ETL_FCT_DIM] (
    [ID_ETL_FCT] INT NOT NULL,
    [ID_ETL_DIM] INT NOT NULL,
    CONSTRAINT [PK_ETL_FCT_DIM] PRIMARY KEY CLUSTERED ([ID_ETL_FCT] ASC, [ID_ETL_DIM] ASC)
);

