﻿CREATE TABLE [dbo].[DIM_API_INE_PROFISSAO] (
    [ID_DIM_API_INE_PROFISSAO]  VARCHAR (5)   NOT NULL,
    [DSC_DIM_API_INE_PROFISSAO] VARCHAR (200) NULL,
    CONSTRAINT [PK_DIM_API_INE_PROFISSAO] PRIMARY KEY CLUSTERED ([ID_DIM_API_INE_PROFISSAO] ASC)
);

