CREATE TABLE [stg].[tbl_F_3] (
    [id]                         BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]                    NVARCHAR (50)  NOT NULL,
    [FileName]                   NVARCHAR (200) NOT NULL,
    [ano]                        NVARCHAR (200) NULL,
    [nuts_ii]                    NVARCHAR (200) NULL,
    [nuts_iii]                   NVARCHAR (200) NULL,
    [concelho]                   NVARCHAR (200) NULL,
    [setor_bf]                   NVARCHAR (200) NULL,
    [competencia_onet_aggr]      NVARCHAR (200) NULL,
    [competencia_onet_detalhada] NVARCHAR (200) NULL,
    [valor]                      NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_F_3] PRIMARY KEY CLUSTERED ([id] ASC)
);

