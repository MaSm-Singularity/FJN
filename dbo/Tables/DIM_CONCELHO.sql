﻿CREATE TABLE [dbo].[DIM_CONCELHO] (
    [ID_DIM_CONCELHO] INT          IDENTITY (1, 1) NOT NULL,
    [DSC_CONCELHO]    VARCHAR (50) NULL,
    CONSTRAINT [PK_DIM_CONCELHO] PRIMARY KEY CLUSTERED ([ID_DIM_CONCELHO] ASC)
);

