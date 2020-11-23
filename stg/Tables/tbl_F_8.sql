CREATE TABLE [stg].[tbl_F_8] (
    [id]                         BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]                    NVARCHAR (50)  NOT NULL,
    [FileName]                   NVARCHAR (200) NOT NULL,
    [ano]                        NVARCHAR (200) NULL,
    [trimestre]                  NVARCHAR (200) NULL,
    [mes]                        NVARCHAR (200) NULL,
    [competencia_bg_agr]         NVARCHAR (200) NULL,
    [competencia_bg_detalhada]   NVARCHAR (200) NULL,
    [competencia_onet_agr]       NVARCHAR (200) NULL,
    [competencia_onet_detalhada] NVARCHAR (200) NULL,
    [nuts_ii]                    NVARCHAR (200) NULL,
    [nuts_iii_rev2013]           NVARCHAR (200) NULL,
    [nivel_ensino]               NVARCHAR (200) NULL,
    [setor_bf]                   NVARCHAR (200) NULL,
    [prof_bf]                    NVARCHAR (200) NULL,
    [valor]                      NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_F_8] PRIMARY KEY CLUSTERED ([id] ASC)
);

