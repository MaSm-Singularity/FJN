CREATE TABLE [stg].[tbl_F_6] (
    [id]                         BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]                    NVARCHAR (50)  NOT NULL,
    [FileName]                   NVARCHAR (200) NOT NULL,
    [ies_curso]                  NVARCHAR (200) NULL,
    [area_formacao]              NVARCHAR (200) NULL,
    [competencia_onet_agr]       NVARCHAR (200) NULL,
    [competencia_onet_detalhada] NVARCHAR (200) NULL,
    [valor]                      NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_F_6] PRIMARY KEY CLUSTERED ([id] ASC)
);

