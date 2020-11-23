CREATE TABLE [dbo].[ETL_INPUT_FILES] (
    [id]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [RecordDate]   DATETIME      CONSTRAINT [DF_ETL_INPUT_FILES_RecordDate] DEFAULT (sysdatetime()) NOT NULL,
    [FileId]       VARCHAR (200) NOT NULL,
    [FullFileName] VARCHAR (600) NOT NULL,
    [ModDate]      DATETIME      NOT NULL,
    [L1Status]     CHAR (1)      CONSTRAINT [DF_ETL_INPUT_FILES_Status] DEFAULT ('I') NOT NULL,
    [L1RunID]      VARCHAR (100) NULL,
    [L1RunStatus]  VARCHAR (100) NULL,
    [L2Status]     CHAR (1)      NULL,
    [L2RunID]      VARCHAR (100) NULL,
    [L2RunStatus]  VARCHAR (100) NULL,
    CONSTRAINT [PK_ETL_INPUT_FILES] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ETL_INPUT_FILES]
    ON [dbo].[ETL_INPUT_FILES]([FullFileName] ASC);


GO
CREATE TRIGGER trg_ETL_INPUT_FILES_del 
   ON  ETL_INPUT_FILES 
   AFTER DELETE
AS 
BEGIN
	SET NOCOUNT ON;

    insert into ETL_INPUT_FILES_HIST([RecordDate],[FileId],[FullFileName],[ModDate],[L1Status],[L1RunID],[L1RunStatus],[L2Status],[L2RunID],[L2RunStatus])
	select [RecordDate],[FileId],[FullFileName],[ModDate],[L1Status],[L1RunID],[L1RunStatus],[L2Status],[L2RunID],[L2RunStatus] from deleted

END
