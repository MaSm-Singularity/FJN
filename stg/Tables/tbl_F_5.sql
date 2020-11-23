CREATE TABLE [stg].[tbl_F_5] (
    [id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]            NVARCHAR (50)  NOT NULL,
    [FileName]           NVARCHAR (200) NOT NULL,
    [ano]                NVARCHAR (200) NULL,
    [ies_curso]          NVARCHAR (200) NULL,
    [ano_letivo]         NVARCHAR (200) NULL,
    [tipo_ensino]        NVARCHAR (200) NULL,
    [nivel_ensino_dgeec] NVARCHAR (200) NULL,
    [nuts_ii]            NVARCHAR (200) NULL,
    [nuts_iii_rev2013]   NVARCHAR (200) NULL,
    [area_formacao]      NVARCHAR (200) NULL,
    [sexo]               NVARCHAR (200) NULL,
    [nacionalidade]      NVARCHAR (200) NULL,
    [faixa_etaria]       NVARCHAR (200) NULL,
    [media_final]        NVARCHAR (200) NULL,
    [percursos]          NVARCHAR (200) NULL,
    [forma_ingresso]     NVARCHAR (200) NULL,
    [valor]              NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_F_5] PRIMARY KEY CLUSTERED ([id] ASC)
);

