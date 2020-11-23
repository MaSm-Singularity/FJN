CREATE TABLE [stg].[tbl_D_2] (
    [id]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]  NVARCHAR (50)  NOT NULL,
    [FileName] NVARCHAR (200) NOT NULL,
    [chave]    NVARCHAR (200) NULL,
    [valor]    NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_D_2] PRIMARY KEY CLUSTERED ([id] ASC)
);

