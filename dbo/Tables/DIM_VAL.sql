﻿CREATE TABLE [dbo].[DIM_VAL] (
    [ID_DIM_VAL]                    INT          IDENTITY (1, 1) NOT NULL,
    [BITMASK]                       BIGINT       NULL,
    [ID_DIM_IES_CURSO]              INT          NULL,
    [ID_DIM_PROFISSAO_BF]           INT          NULL,
    [ID_DIM_SEXO]                   INT          NULL,
    [ID_DIM_NUTS2]                  VARCHAR (5)  NULL,
    [ID_DIM_NUTS3]                  VARCHAR (5)  NULL,
    [ID_DIM_ANO_LECTIVO]            INT          NULL,
    [ID_DIM_IDADE_TRABALHO]         INT          NULL,
    [ID_DIM_CONCELHO]               INT          NULL,
    [ID_DIM_TIPO_ENSINO]            INT          NULL,
    [ID_DIM_NIVEL_ENSINO]           INT          NULL,
    [ID_DIM_NIVEL_ENSINO_DGEEC]     INT          NULL,
    [ID_DIM_TIPO_CONTRATO]          INT          NULL,
    [ID_DIM_SIT_PROFISSIONAL]       INT          NULL,
    [ID_DIM_DIMENSAO_EMP]           INT          NULL,
    [ID_DIM_REGIME_TRAB]            INT          NULL,
    [ID_DIM_NACIONALIDADE]          INT          NULL,
    [ID_DIM_FREGUESIA]              INT          NULL,
    [ID_DIM_AREA_FORMACAO]          INT          NULL,
    [ID_DIM_DISTRITO]               INT          NULL,
    [ID_DIM_SECTOR_BF]              INT          NULL,
    [ID_DIM_SECTOR_BF_AGG]          INT          NULL,
    [ID_DIM_IDADE_CURSO]            INT          NULL,
    [ID_DIM_FORMA_INGRESSO]         INT          NULL,
    [ID_DIM_PERCURSO]               INT          NULL,
    [ID_DIM_COMPETENCIA_ONET_DET]   VARCHAR (50) NULL,
    [ID_DIM_COMPETENCIA_ONET_AGG]   VARCHAR (5)  NULL,
    [ID_DIM_COMPETENCIA_BG_DET]     INT          NULL,
    [ID_DIM_COMPETENCIA_BG_AGG]     INT          NULL,
    [ID_DIM_API_INE_SEXO]           VARCHAR (5)  NULL,
    [ID_DIM_NUTSII_INE]             INT          NULL,
    [ID_DIM_API_INE_IDADE_TRABALHO] VARCHAR (5)  NULL,
    [ID_DIM_NIVEL_ENSINO_INE]       INT          NULL,
    [ID_DIM_API_INE_TIPO_CONTRATO]  VARCHAR (5)  NULL,
    [ID_DIM_API_INE_PROFISSAO]      VARCHAR (5)  NULL,
    [ID_DIM_API_INE_REGIME_TRAB]    VARCHAR (50) NULL,
    [ID_DIM_API_INE_SECTOR]         VARCHAR (50) NULL,
    [ID_DIM_PROFISSAO_BF2]          INT          NULL,
    [ID_DIM_PROF_BF_AGG]            INT          NULL,
    [ID_DIM_MEDIA_FINAL]            INT          NULL,
    [ID_DIM_NUTS3_2013]             VARCHAR (5)  NULL,
    [ID_DIM_API_INE_NUTS3_2013]     VARCHAR (5)  NULL,
    [ID_DIM_API_INE_NIVEL_ENSINO]   VARCHAR (50) NULL,
    [hshDIM]                        AS           (CONVERT([varbinary](128),hashbytes('SHA2_256',((((((((((((((((((((((((((((((((((((((((isnull(CONVERT([varchar](8000),[ID_DIM_IES_CURSO]),'')+isnull(CONVERT([varchar](8000),[ID_DIM_PROFISSAO_BF]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_SEXO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_NUTS2]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_NUTS3]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_ANO_LECTIVO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_IDADE_TRABALHO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_CONCELHO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_TIPO_ENSINO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_NIVEL_ENSINO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_NIVEL_ENSINO_DGEEC]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_TIPO_CONTRATO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_SIT_PROFISSIONAL]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_DIMENSAO_EMP]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_REGIME_TRAB]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_NACIONALIDADE]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_FREGUESIA]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_AREA_FORMACAO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_DISTRITO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_SECTOR_BF]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_SECTOR_BF_AGG]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_IDADE_CURSO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_FORMA_INGRESSO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_PERCURSO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_COMPETENCIA_ONET_DET]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_COMPETENCIA_ONET_AGG]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_COMPETENCIA_BG_DET]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_COMPETENCIA_BG_AGG]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_API_INE_SEXO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_NUTSII_INE]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_API_INE_IDADE_TRABALHO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_NIVEL_ENSINO_INE]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_API_INE_TIPO_CONTRATO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_API_INE_PROFISSAO]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_API_INE_REGIME_TRAB]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_API_INE_SECTOR]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_PROFISSAO_BF2]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_PROF_BF_AGG]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_MEDIA_FINAL]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_NUTS3_2013]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_API_INE_NUTS3_2013]),''))+isnull(CONVERT([varchar](8000),[ID_DIM_API_INE_NIVEL_ENSINO]),'')))),
    CONSTRAINT [PK_DIM_VAL] PRIMARY KEY CLUSTERED ([ID_DIM_VAL] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IX_DIM_VAL_BITMASK]
    ON [dbo].[DIM_VAL]([BITMASK] ASC, [hshDIM] ASC) WITH (DATA_COMPRESSION = PAGE);

