﻿CREATE TABLE [dbo].[DIM_TIPO_ENSINO] (
    [ID_DIM_TIPO_ENSINO] INT          IDENTITY (1, 1) NOT NULL,
    [DSC_TIPO_ENSINO]    VARCHAR (50) NULL,
    CONSTRAINT [PK_DIM_TIPO_ENSINO] PRIMARY KEY CLUSTERED ([ID_DIM_TIPO_ENSINO] ASC)
);
