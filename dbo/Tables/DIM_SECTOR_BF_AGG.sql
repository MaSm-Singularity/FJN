﻿CREATE TABLE [dbo].[DIM_SECTOR_BF_AGG] (
    [ID_DIM_SECTOR_BF_AGG] INT           IDENTITY (1, 1) NOT NULL,
    [DSC_SECTOR_BF_AGG]    VARCHAR (200) NULL,
    CONSTRAINT [PK_DIM_SECTOR_BF_AGG] PRIMARY KEY CLUSTERED ([ID_DIM_SECTOR_BF_AGG] ASC)
);

