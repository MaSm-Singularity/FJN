﻿CREATE TABLE [dbo].[DIM_PERCURSO] (
    [ID_DIM_PERCURSO] INT          IDENTITY (1, 1) NOT NULL,
    [DSC_PERCURSO]    VARCHAR (50) NULL,
    CONSTRAINT [PK_DIM_PERCURSO] PRIMARY KEY CLUSTERED ([ID_DIM_PERCURSO] ASC)
);
