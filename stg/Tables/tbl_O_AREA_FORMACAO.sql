CREATE TABLE [stg].[tbl_O_AREA_FORMACAO] (
    [id]                BIGINT          IDENTITY (1, 1) NOT NULL,
    [FileKey]           NVARCHAR (50)   NOT NULL,
    [FileName]          NVARCHAR (200)  NOT NULL,
    [area_formacao_cod] NVARCHAR (2000) NULL,
    [area_formacao]     NVARCHAR (4000) NULL,
    [asset]             NVARCHAR (4000) NULL,
    [sub_area_formacao] NVARCHAR (4000) NULL,
    CONSTRAINT [PK_tbl_O_AREA_FORMACAO] PRIMARY KEY CLUSTERED ([id] ASC)
);

