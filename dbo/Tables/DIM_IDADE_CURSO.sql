﻿CREATE TABLE [dbo].[DIM_IDADE_CURSO] (
    [ID_DIM_IDADE_CURSO] INT           IDENTITY (1, 1) NOT NULL,
    [DSC_IDADE_CURSO]    VARCHAR (100) NULL,
    CONSTRAINT [PK_DIM_IDADE_CURSO] PRIMARY KEY CLUSTERED ([ID_DIM_IDADE_CURSO] ASC)
);

