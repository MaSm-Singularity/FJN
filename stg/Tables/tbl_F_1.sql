CREATE TABLE [stg].[tbl_F_1] (
    [id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]        NVARCHAR (50)  NOT NULL,
    [FileName]       NVARCHAR (200) NOT NULL,
    [ano]            NVARCHAR (200) NULL,
    [nuts_ii]        NVARCHAR (200) NULL,
    [nuts_iii]       NVARCHAR (200) NULL,
    [concelho]       NVARCHAR (200) NULL,
    [setor_bf]       NVARCHAR (200) NULL,
    [dimensao_categ] NVARCHAR (200) NULL,
    [prof_bf]        NVARCHAR (200) NULL,
    [tipo_contrato]  NVARCHAR (200) NULL,
    [regime_trab]    NVARCHAR (200) NULL,
    [area_formacao]  NVARCHAR (200) NULL,
    [nivel_ensino]   NVARCHAR (200) NULL,
    [sexo]           NVARCHAR (200) NULL,
    [idade_categ]    NVARCHAR (200) NULL,
    [valor]          NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_F_1] PRIMARY KEY CLUSTERED ([id] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IX_tbl_F_1]
    ON [stg].[tbl_F_1]([FileKey] ASC, [FileName] ASC) WITH (DATA_COMPRESSION = PAGE);

