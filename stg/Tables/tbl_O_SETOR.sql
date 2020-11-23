CREATE TABLE [stg].[tbl_O_SETOR] (
    [id]                  BIGINT          IDENTITY (1, 1) NOT NULL,
    [FileKey]             NVARCHAR (50)   NOT NULL,
    [FileName]            NVARCHAR (200)  NOT NULL,
    [setor_1d]            NVARCHAR (2000) NULL,
    [setor_1d_designacao] NVARCHAR (4000) NULL,
    [setor_bf]            NVARCHAR (4000) NULL,
    [setor_bf_designacao] NVARCHAR (4000) NULL,
    CONSTRAINT [PK_tbl_O_SETORES] PRIMARY KEY CLUSTERED ([id] ASC)
);

