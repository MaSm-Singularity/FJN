﻿CREATE TABLE [dbo].[DIM_PROF_BF_AGG] (
    [ID_DIM_PROF_BF_AGG] INT           IDENTITY (1, 1) NOT NULL,
    [DSC_PROF_BF_AGG]    VARCHAR (300) NULL,
    CONSTRAINT [PK_DIM_PROF_BF_AGG] PRIMARY KEY CLUSTERED ([ID_DIM_PROF_BF_AGG] ASC)
);

