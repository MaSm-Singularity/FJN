CREATE TABLE [dbo].[ETL_DIM] (
    [ID_ETL_DIM]         INT           IDENTITY (1, 1) NOT NULL,
    [DSC_DIM]            VARCHAR (50)  NULL,
    [DSC_FILE]           VARCHAR (150) NULL,
    [DSC_FILE_EXTENSION] VARCHAR (150) NULL,
    [DSC_SOURCE_TYPE]    VARCHAR (150) NULL,
    [CD_TEMPLATE]        INT           NULL,
    [ID_ETL_OTHER]       INT           NULL
);

