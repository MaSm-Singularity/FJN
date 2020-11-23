CREATE TABLE [stg].[tbl_D_1] (
    [id]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]  NVARCHAR (50)  NOT NULL,
    [FileName] NVARCHAR (200) NOT NULL,
    [chave]    NVARCHAR (200) NULL,
    [valor]    NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_D_1] PRIMARY KEY CLUSTERED ([id] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IX_tbl_D_1]
    ON [stg].[tbl_D_1]([FileKey] ASC, [FileName] ASC) WITH (DATA_COMPRESSION = PAGE);

