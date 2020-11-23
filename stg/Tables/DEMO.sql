CREATE TABLE [stg].[DEMO] (
    [FileKey]              NVARCHAR (50)  NOT NULL,
    [FileName]             NVARCHAR (100) NOT NULL,
    [variavel]             NVARCHAR (50)  NOT NULL,
    [ano]                  NVARCHAR (50)  NOT NULL,
    [nuts_ii]              NVARCHAR (50)  NULL,
    [cae]                  NVARCHAR (50)  NULL,
    [competencia_agregado] NVARCHAR (50)  NULL,
    [competencia]          NVARCHAR (50)  NULL,
    [valor]                NVARCHAR (50)  NULL
);


GO
CREATE CLUSTERED INDEX [IX_DEMO]
    ON [stg].[DEMO]([FileKey] ASC, [FileName] ASC, [variavel] ASC, [ano] ASC) WITH (DATA_COMPRESSION = PAGE);

