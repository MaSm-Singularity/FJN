﻿CREATE TABLE [dbo].[DIM_REGIME_TRAB] (
    [ID_DIM_REGIME_TRAB] INT          IDENTITY (1, 1) NOT NULL,
    [DSC_REGIME_TRAB]    VARCHAR (50) NULL,
    CONSTRAINT [PK_DIM_REGIME_TRAB] PRIMARY KEY CLUSTERED ([ID_DIM_REGIME_TRAB] ASC)
);
