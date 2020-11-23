CREATE TABLE [stg].[tbl_F_7] (
    [id]                         BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]                    NVARCHAR (50)  NOT NULL,
    [FileName]                   NVARCHAR (200) NOT NULL,
    [ano]                        NVARCHAR (200) NULL,
    [trimestre]                  NVARCHAR (200) NULL,
    [sexo]                       NVARCHAR (200) NULL,
    [nuts_ii]                    NVARCHAR (200) NULL,
    [prof_agregada]              NVARCHAR (200) NULL,
    [nivel_ensino_ine]           NVARCHAR (200) NULL,
    [situacao_prof]              NVARCHAR (200) NULL,
    [setor_agregado]             NVARCHAR (200) NULL,
    [competencia_onet_agr]       NVARCHAR (200) NULL,
    [competencia_onet_detalhada] NVARCHAR (200) NULL,
    [valor]                      NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_F_7] PRIMARY KEY CLUSTERED ([id] ASC)
);

