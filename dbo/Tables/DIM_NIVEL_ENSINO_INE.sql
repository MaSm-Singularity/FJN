﻿CREATE TABLE [dbo].[DIM_NIVEL_ENSINO_INE] (
    [ID_DIM_NIVEL_ENSINO_INE] INT          IDENTITY (1, 1) NOT NULL,
    [DSC_NIVEL_ENSINO_INE]    VARCHAR (50) NULL,
    CONSTRAINT [PK_DIM_NIVEL_ENSINO_INE] PRIMARY KEY CLUSTERED ([ID_DIM_NIVEL_ENSINO_INE] ASC)
);
