CREATE TABLE [stg].[tbl_O_COMPETENCIAS_BG] (
    [id]                            BIGINT          IDENTITY (1, 1) NOT NULL,
    [FileKey]                       NVARCHAR (50)   NOT NULL,
    [FileName]                      NVARCHAR (200)  NOT NULL,
    [tipo_competencia]              NVARCHAR (2000) NULL,
    [competencia_bg_agr]            NVARCHAR (2000) NULL,
    [competencia_bg_detalhada]      NVARCHAR (2000) NULL,
    [comp_bg_detalhada_desig_en]    NVARCHAR (2000) NULL,
    [skill_pt]                      NVARCHAR (2000) NULL,
    [competencia_bg_detalhada_desc] NVARCHAR (2000) NULL,
    [linktoESCO]                    NVARCHAR (2000) NULL,
    [competencia_onet_agr]          NVARCHAR (2000) NULL,
    [competencia_onet_detalhada]    NVARCHAR (2000) NULL,
    [asset]                         NVARCHAR (2000) NULL,
    [comp_bf]                       NVARCHAR (2000) NULL,
    CONSTRAINT [PK_tbl_O_COMPETENCIAS_BG] PRIMARY KEY CLUSTERED ([id] ASC)
);

