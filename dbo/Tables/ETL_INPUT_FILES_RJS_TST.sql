CREATE TABLE [dbo].[ETL_INPUT_FILES_RJS_TST] (
    [id]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [RecordDate]   DATETIME      NOT NULL,
    [FileId]       VARCHAR (200) NOT NULL,
    [FullFileName] VARCHAR (600) NOT NULL,
    [ModDate]      DATETIME      NOT NULL,
    [L1Status]     CHAR (1)      NOT NULL,
    [L1RunID]      VARCHAR (100) NULL,
    [L1RunStatus]  VARCHAR (100) NULL,
    [L2Status]     CHAR (1)      NULL,
    [L2RunID]      VARCHAR (100) NULL,
    [L2RunStatus]  VARCHAR (100) NULL
);

