CREATE TABLE [stg].[tbl_O_COMPETENCIAS_ONET] (
    [id]                               BIGINT          IDENTITY (1, 1) NOT NULL,
    [FileKey]                          NVARCHAR (50)   NOT NULL,
    [FileName]                         NVARCHAR (200)  NOT NULL,
    [tipo_competencia]                 NVARCHAR (2000) NULL,
    [competencia_onet_agr]             NVARCHAR (2000) NULL,
    [competencia_onet_agr_designacao]  NVARCHAR (2000) NULL,
    [competencia_onet_detalhada]       NVARCHAR (2000) NULL,
    [competencia_onet_detalhada_desig] NVARCHAR (2000) NULL,
    [competencia_onet_detalhada_desc]  NVARCHAR (2000) NULL,
    [asset]                            NVARCHAR (2000) NULL,
    CONSTRAINT [PK_tbl_O_COMPETENCIAS_ONET] PRIMARY KEY CLUSTERED ([id] ASC)
);

