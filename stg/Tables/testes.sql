CREATE TABLE [stg].[testes] (
    [id]   INT           IDENTITY (1, 1) NOT NULL,
    [date] DATETIME2 (7) CONSTRAINT [DF_testes_date] DEFAULT (sysdatetime()) NOT NULL,
    [cnt]  INT           NOT NULL,
    CONSTRAINT [PK_testes] PRIMARY KEY CLUSTERED ([id] ASC)
);

